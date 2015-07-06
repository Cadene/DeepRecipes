require 'torch'
require 'nn'
require 'xlua'
require 'optim'

require 'Dataset'
require 'Plot'


------------------------------------------------------------------------
-- Main
------------------------------------------------------------------------

------------------------------------------------------------------------
-- Command line arguments

cmd = torch.CmdLine()
cmd:text()
cmd:text('CadNet')
cmd:text()
cmd:text('Options:')
-- settings dataset building
cmd:option('-data_type',       'Spiral',    'data_type: Spiral | Gauss')
cmd:option('-K',               3,           'number of class')
cmd:option('-N',               500,         'number of points per class')
cmd:option('-D',               2,           'number of dimensionality')
cmd:option('-pc_train',        0.8,         'pourcentage for the training set')
-- settings net building
cmd:option('-type',            'float',     'type: float | cuda')
cmd:option('-seed',            2,           'fixed input seed for repeatable experiments')
cmd:option('-threads',         1,           'number of threads')
cmd:option('-gpuid',           1,           'gpu id')
cmd:option('-H',               100,         'number of hidden layers')
cmd:option('-criterion',       'NLL',       'criterion: NLL - negative log likelihood')
cmd:option('-dropout',         0.2,           'do dropout with x probability')
-- settings optimizer
cmd:option('-optimizer',       'CG',        'CG | LBFGS | SGD | ASGD')
cmd:option('-max_iter',        1e2,         'max iteration')
cmd:option('-learning_rate',   1e-1,        'learning rate at t=0')
cmd:option('-momentum',        0.6,         'momentum')
cmd:option('-weight_decay',    1e-5,        'weight decay')
cmd:option('-batch_size',      200,           'mini-batch size (1 = pure stochastic)')
cmd:option('-t0',              1e-1,           '??')
-- settings saving, printing, ploting
cmd:option('-save_every',      1e10,        'save model')
cmd:option('-print_every',     10,         'print things')
-- cmd:option('-print_layers_op', false,       'Output the values from each layers')
cmd:text()
opt = cmd:parse(arg or {})

------------------------------------------------------------------------
-- Settings

torch.setdefaulttensortype('torch.FloatTensor')
if opt.type == 'cuda' then
   print('... switching to CUDA')
   require 'cutorch'
   require 'cunn'
   cutorch.setDevice(opt.gpuid)
end
torch.setnumthreads(opt.threads)
torch.manualSeed(opt.seed)

------------------------------------------------------------------------
-- Dataset

class = {}
class_str = {}
for i = 1, opt.K do
    class[i] = i
    class_str[i] = tostring(i)
end

N_train = opt.N * opt.pc_train
N_test  = opt.N * (1 - opt.pc_train)

X_train, y_train = Dataset.generate(opt.data_type, N_train, opt.D, opt.K)
X_test,  y_test  = Dataset.generate(opt.data_type, N_test,  opt.D, opt.K)

------------------------------------------------------------------------
-- Model

model = nn.Sequential()

model:add( nn.Linear(opt.D, opt.H) )
model:add( nn.ReLU() )
if opt.dropout ~= 0 then
    model:add( nn.Dropout(0.2) )
end
model:add( nn.Linear(opt.H, opt.K) )

-- criterion
if opt.criterion == 'NLL' then
    model:add( nn.LogSoftMax() )
    criterion = nn.ClassNLLCriterion()
elseif opt.criterion == 'MM' then
    criterion = nn.MultiMarginCriterion()
-- elseif opt.criterion == 'MSE' then
--     model:add(nn.Tanh())
--     criterion = nn.MSECriterion()
--     criterion.sizeAverage()
else
    error(opt.criterion..' is not a valid criterion')
end

-- Retrieve parameters and gradients:
-- this extracts and flattens all the trainable parameters of the mode
-- into a 1-dim vector
parameters, gradParameters = model:getParameters()

-----------------------------------------------------------------------
-- CUDA?

if opt.type == 'cuda' then
   model:cuda()
   criterion:cuda()
end

-----------------------------------------------------------------------
-- Logger

confusion = optim.ConfusionMatrix(class_str)

-----------------------------------------------------------------------
-- Optimizer

if opt.optimizer == 'CG' then
    optimState = {
        maxIter = opt.max_iter
    }
    optimMethod = optim.cg

elseif opt.optimizer == 'LBFGS' then
    optimState = {
        maxIter = opt.max_iter,
        learningRate = opt.learning_rate,
        nCorrection = 10
    }
    optimMethod = optim.lbfgs

elseif opt.optimizer == 'SGD' then
    optimState = {
        maxIter = opt.max_iter,
        learningRate = opt.learning_rate,
        weightDecay = opt.weight_decay,
        momentum = opt.momentum,
        learningRateDecay = 1e-7
    }
    optimMethod = optim.sgd

elseif opt.optimizer == 'ASGD' then
    optimState = {
        maxIter = opt.max_iter,
        eta0 = opt.learning_rate,
        t0 = X_train:size(1) * opt.t0
    }
    optimMethod = optim.asgd

elseif opt.optimizer == 'ADAGRAD' then
    optimState = {
        learningRate = opt.learning_rate,
        paramVariance = nil
    }
    optimMethod = optim.adagrad

elseif opt.optimizer == 'RMSPROP' then
    optimState = {
        maxIter = opt.max_iter,
        learningRate = opt.learning_rate,
        alpha = 0.99,
        epsilon = 1e-8
    }
    optimMethod = optim.rmsprop

else
   error(opt.optimizer..' is not a valid optimizer')
end

-----------------------------------------------------------------------
-- Training

table_f = {}

function train()
    epoch = epoch or 1
    local time = sys.clock()
    model:training()
    shuffle = torch.randperm(X_train:size(1))

    print('epoch n'..epoch)
    for t = 1, X_train:size(1), opt.batch_size do
        xlua.progress(t, X_train:size(1))

        local inputs = {}
        local targets = {}
        for i = t, math.min(t+opt.batch_size-1, X_train:size(1)) do
            local input = X_train[shuffle[i]]
            local target = y_train[shuffle[i]]
            if opt.type == 'cuda' then
                input = input:cuda()
            end
            table.insert(inputs, input)
            table.insert(targets, target)
        end

        local feval = function(x)
            if x ~= parameters then -- ?
                parameters:copy(x)
            end

            gradParameters:zero()

            local f = 0
            for i = 1, #inputs do
                local output = model:forward(inputs[i])
                -- local target = torch.Tensor{targets[i]}
                local err = criterion:forward(output, targets[i])
                f = f + err
                local df_do = criterion:backward(output, targets[i])
                model:backward(inputs[i], df_do)

                confusion:add(output, targets[i])
            end

            gradParameters:div(#inputs)
            f = f / #inputs

            table.insert(table_f, f)

            return f, gradParameters -- f and df/dX
        end

        if optimMethod == optim.asgd then
            _,_,average = optimMethod(feval, parameters, optimState)
        else
            optimMethod(feval, parameters, optimState)
        end
    end

    time = sys.clock() - time
    time = time / X_train:size(1)
    print("\ntime to learn 1 sample = "..(time*1000).."ms")

    print(confusion)

    if epoch % opt.print_every == 0 then
        Plot.decision_region(model, X_train, class, 'epoch_'..epoch..'.png')
    end

    confusion:zero()
    epoch = epoch + 1
end


-----------------------------------------------------------------------
-- Main

for i = 1, 100 do
    train()
end

table_x = {}
for i=1, #table_f do
    table_x[i] = i
end

table_x = torch.Tensor(table_x)
table_f = torch.Tensor(table_f)

to_plot = {'test', table_x, torch.log(table_f), '-'}

Plot.figure('curve.png', to_plot)


-- train(model, X_train, class, criterion, opt.learning_rate, opt.max_iter, opt.save_every, opt.print_every)





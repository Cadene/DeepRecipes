require 'torch'
require 'nn'
require 'xlua'
require 'optim'

require 'Dataset'
require 'Plot'

------------------------------------------------------------------------
-- Functions
------------------------------------------------------------------------

function gradUpdate(model, X, y, criterion, learning_rate)
    local pred = model:forward(X)
    local err = criterion:forward(pred, y)
    local gradCriterion = criterion:backward(pred, y)
    model:zeroGradParameters()            -- reinit gradParameters
    model:backward(X, gradCriterion)
    model:updateParameters(learning_rate)
    -- print('--')
    -- print(pred)
    -- print(err)
    -- print(gradCriterion)
    return err
end


function train(model, X_train, class, criterion, learning_rate, max_iter, save_every, print_every)
    local errors = {}
    local sumErr = 0
    local ix, X, y, err

    for i = 1, max_iter do

        if i > max_iter * 0.75 then
            learning_rate = learning_rate * 1e-1
        end

        if i % save_every == 0 then
            torch.save("./model_" .. i .. ".model", model)
        end

        if i % print_every == 0 then
            -- print('----------------')
            print('sumErr '..sumErr/print_every)
            model:evaluate()
            Plot.plot(model, X_train, class, 'plot'..i ..'.png')
            model:training()
            -- print(model:forward(torch.Tensor({1,1})))
            -- print(model:forward(torch.Tensor({-1,-1})))
            -- print(model:get(1).weight)
            -- print(model:get(1).bias)
            sumErr = 0
        end

        ix = torch.random(N_train * #class) 
        -- print(ix)
        X = X_train[ix]
        y = y_train[ix]
        err = gradUpdate(model, X, y, criterion, learning_rate)
        -- print('err '..err)
        sumErr = sumErr + err
        table.insert(errors, err)
    end
end

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
cmd:option('-seed',            1,           'fixed input seed for repeatable experiments')
cmd:option('-threads',         1,           'number of threads')
cmd:option('-gpuid',           1,           'gpu id')
cmd:option('-H',               100,         'number of hidden layers')
cmd:option('-criterion',       'NLL',       'criterion: NLL - negative log likelihood')
-- settings optimizer
cmd:option('-optimizer',       'CG',        'CG | LBFGS | SGD | ASGD')
cmd:option('-max_iter',        2e4,         'max iteration')
cmd:option('-learning_rate',   2e-1,        'learning rate at t=0')
cmd:option('-dropout',         0,           'do dropout with x probability')

cmd:option('-momentum',        0.6,         'momentum')
cmd:option('-weight_decay',    1e-5,        'weight decay')
cmd:option('-batch_size',      1,           'mini-batch size (1 = pure stochastic)')
-- settings saving, printing, ploting
cmd:option('-save_every',      1e10,        'save model')
cmd:option('-print_every',     1e3,         'print things')
-- cmd:option('-print_layers_op', false,       'Output the values from each layers')
cmd:text()
opt = cmd:parse(arg or {})

-- Set options
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
      maxIter = opt.maxIter
   }
   optimMethod = optim.cg

elseif opt.optimizer == 'LBFGS' then
   optimState = {
      learningRate = opt.learningRate,
      maxIter = opt.maxIter,
      nCorrection = 10
   }
   optimMethod = optim.lbfgs

elseif opt.optimizer == 'SGD' then
   optimState = {
      learningRate = opt.learningRate,
      weightDecay = opt.weightDecay,
      momentum = opt.momentum,
      learningRateDecay = 1e-7
   }
   optimMethod = optim.sgd

elseif opt.optimizer == 'ASGD' then
   optimState = {
      eta0 = opt.learningRate,
      t0 = trsize * opt.t0
   }
   optimMethod = optim.asgd

else
   error(opt.optimizer..' is not a valid optimizer')
end


train(model, X_train, class, criterion, opt.learning_rate, opt.max_iter, opt.save_every, opt.print_every)





require 'torch'
require 'src/Tools'
require 'src/DatabaseFactory'
require 'src/ModelFactory'
require 'src/CriterionFactory'
require 'src/OptimizerFactory'
require 'src/LoggerFactory'
require 'src/OptManager'

------------------------------------------------------------------------
-- Command line arguments

local cmd = torch.CmdLine()
cmd:text()
cmd:text('CadNet')
cmd:text()
cmd:text('Options:')
-- settings dataset building
cmd:option('-type_data',       'spiral',    'data_type: spiral | gauss | recipe101')
cmd:option('-K',               3,           'number of class')
cmd:option('-N',               500,         'number of points per class')
cmd:option('-D',               2,           'number of dimensionality')
cmd:option('-pc_train',        0.8,         'pourcentage for the training set')
cmd:option('-path2load_data',        '../data/recipe_101/recipe_101_clean', 'path2img')
-- settings net building
cmd:option('-cuda',            'false',     '')
cmd:option('-cudnn',           'false',     '')
cmd:option('-convMM',          'true',      '')
cmd:option('-type_model',      'standard',  'model_type: standard | overfeat | medium')
cmd:option('-pretrain_model',  'false',     'pretrain overfeat')
cmd:option('-threads',         1,           'number of threads')
cmd:option('-seed',            1337,        'seed')
cmd:option('-gpuid',           1,           'gpu id')
cmd:option('-H',               100,         'number of hidden layers')
cmd:option('-type_criterion',  'NLL',       'criterion: NLL - negative log likelihood')
cmd:option('-dropout',         0.5,         'do dropout with x probability')
-- settings optimizer
cmd:option('-type_optimizer',       'SGD',       'CG | LBFGS | SGD | ASGD | ADAGRAD')
cmd:option('-learning_rate',   5e-2,        'learning rate at t=0')
cmd:option('-learning_rate_decay', 0.033,   'learning rate decay')
cmd:option('-momentum',        0.6,         'momentum')
cmd:option('-weight_decay',    1e-5,        'weight decay L2 regularization')
cmd:option('-batch_size',      128,         'mini-batch size (1 = pure stochastic)')
cmd:option('-4d_tensor',       'true',      '4D_Tensor instead of batch_size * 3D_Tensor ')
-- settings saving, printing, ploting
cmd:option('-epoch',           100,         'epoch number')
cmd:option('-save_every',      1e10,        'save model')
cmd:option('-plot_every',      10,          'plot things')
cmd:option('-path2save',       './save/',   'path to the saving dir')
cmd:option('-plot',            'true',      'plot')
-- cmd:option('-print_layers_op', false,       'Output the values from each layers')
cmd:option('-train_model',	   'true',	    '')
cmd:option('-test_model',	   'false',     '')
cmd:option('-save_model',      'true',      '')
-- settings net loading
cmd:option('-load_model',      'false',     'loading model or not')
cmd:option('-path2load',       './save/',   'path2load model')
cmd:text()
local om = OptManager()
local opt = om:parse(cmd, arg)

------------------------------------------------------------------------
-- Global Effects

Tools.display_pid()

torch.setdefaulttensortype('torch.FloatTensor')
torch.manualSeed(opt.seed)
torch.setnumthreads(opt.threads)

Tools.manage_gpu_lib(opt)

------------------------------------------------------------------------
-- Initialisation

local epoch = 1
if opt.load_epoch then
    epoch = torch.load(opt.path2load_epoch) + 1
end

local database  = DatabaseFactory.generate(opt)
local model     = ModelFactory.generate(opt, database:nb_class())
local criterion = CriterionFactory.generate(opt)
local optimizer = OptimizerFactory.generate(opt)
local log_train = LoggerFactory.generate('train', opt)
local log_test  = LoggerFactory.generate('test', opt)

if opt.cuda then
    model:cuda()
    criterion:cuda()
end

------------------------------------------------------------------------
-- Global
    
g           = {}
g.opt       = opt
g.database  = database
g.model     = model
g.criterion = criterion
g.optimizer = optimizer
g.log_train = log_train
g.log_test  = log_test


------------------------------------------------------------------------
-- Running

model:test(database, criterion, optimizer, log_test, opt, epoch)

for epoch_i = epoch, (opt.epoch + epoch - 1) do
    print('')
    print('#####################')
    print('# Epoch n° '..epoch_i)

    model:train(database, criterion, optimizer, log_train, opt, epoch_i)
    model:test(database, criterion, optimizer, log_test, opt, epoch_i)
    model:save(opt, epoch_i)
end

inputs = torch.Tensor(20,3,221,221)
targets = torch.Tensor(20):fill(1)



local parameters, gradParameters = g.model.m:getParameters()

feval = function(x)
    if x ~= parameters then -- optim
        parameters:copy(x)
    end
    g.model.m:zeroGradParameters()
    outputs = g.model.m:forward(inputs)
    f = g.criterion:forward(outputs, targets)
    df_do = criterion:backward(outputs, targets)
    g.model.m:backward(inputs, df_do)
    return f, gradParameters
end

g.optimizer:optimize(feval, parameters)



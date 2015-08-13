require 'torch'
require 'src/Tools'
require 'src/DatabaseFactory'
require 'src/ModelFactory'
require 'src/CriterionFactory'
require 'src/OptimizerFactory'
require 'src/OptManager'

------------------------------------------------------------------------
-- Command line arguments

local cmd = torch.CmdLine()
cmd:text()
cmd:text('CadNet')
cmd:text()
cmd:text('Options:')
-- settings dataset building
cmd:option('-type_data',       'Spiral',    'data_type: Spiral | Gauss | Recipe101')
cmd:option('-K',               3,           'number of class')
cmd:option('-N',               500,         'number of points per class')
cmd:option('-D',               2,           'number of dimensionality')
cmd:option('-pc_train',        0.8,         'pourcentage for the training set')
cmd:option('-path2load_data',        '../data/recipe_101/recipe_101_clean', 'path2img')
-- settings net building
cmd:option('-cuda',            'false',     '')
cmd:option('-cudnn',           'false',     '')
cmd:option('-type_model',      'standard',  'model_type: standard | overfeat | medium')
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
cmd:option('-t0',              1e-1,        '??')
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
opt = om:parse(cmd, arg)

------------------------------------------------------------------------
-- Global Effects

Tools.display_pid()

torch.setdefaulttensortype('torch.FloatTensor')
torch.manualSeed(opt.seed)
torch.setnumthreads(opt.threads)

Tools.manage_gpu_lib(opt)

------------------------------------------------------------------------
-- Initialisation

database = DatabaseFactory.generate(opt)
model = ModelFactory.generate(opt)
criterion = CriterionFactory.generate(opt)
optimizer = OptimizerFactory.generate(opt)

if opt.cuda then
    model:cuda()
    criterion:cuda()
end

------------------------------------------------------------------------
-- Running

model:test(database, criterion, optimizer, opt)

for epoch = 1, opt.epoch do
    print('')
    print('#####################')
    print('# Epoch n° '..epoch)

    model:train(database, criterion, optimizer, opt, epoch)
    model:test(database, criterion, optimizer, opt, epoch)
    model:save(opt, epoch)
end



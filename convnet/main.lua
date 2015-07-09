require 'torch'
require 'nn'
require 'xlua'
require 'optim'

require 'Ploter'


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
cmd:option('-data_type',       'Spiral',    'data_type: Spiral | Gauss | Recipe101')
cmd:option('-K',               3,           'number of class')
cmd:option('-N',               500,         'number of points per class')
cmd:option('-D',               2,           'number of dimensionality')
cmd:option('-pc_train',        0.8,         'pourcentage for the training set')
cmd:option('-path2dir',        '../data/recipe_101/recipe_101_clean', 'path2img')
-- settings net loading
cmd:option('-load_model',      'false',       'loading model or not')
cmd:option('-path2model',      './save/cade.net', 'path to model')
-- settings net building
cmd:option('-type',            'float',     'type: float | cuda')
cmd:option('-model_type',      'standard',  'model_type: standard | overfeat | cadnet')
cmd:option('-seed',            2,           'fixed input seed for repeatable experiments')
cmd:option('-threads',         4,           'number of threads')
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
cmd:option('-batch_size',      200,         'mini-batch size (1 = pure stochastic)')
cmd:option('-t0',              1e-1,        '??')
-- settings saving, printing, ploting
cmd:option('-epoch',           100,         'epoch number')
cmd:option('-save_every',      1e10,        'save model')
cmd:option('-plot_every',      10,          'plot things')
cmd:option('-path2save',       './save/',        'path to the saving dir')
cmd:option('-plot',            'true',      'plot')
-- cmd:option('-print_layers_op', false,       'Output the values from each layers')
cmd:option('-run',             'true',      'run main')
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

dofile('1_data.lua')

------------------------------------------------------------------------
-- Model

dofile('2_model.lua')

-----------------------------------------------------------------------
-- Logger

confusion = optim.ConfusionMatrix(class_str)
trainLogger = optim.Logger(paths.concat(opt.path2save, 'train.log'))
testLogger  = optim.Logger(paths.concat(opt.path2save, 'test.log'))

-----------------------------------------------------------------------
-- Optimizer

dofile('3_optimizer.lua')


-----------------------------------------------------------------------
-- Training

dofile('4_train.lua')


-----------------------------------------------------------------------
-- Testing

dofile('5_test.lua')

-----------------------------------------------------------------------
-- Main

if opt.run == 'true' then

    _log = {}
    _log['err'] = {}

    for i = 1, opt.epoch do
        train()
        test()
    end

    Ploter.figure('learning_batch'..opt.batch_size..'.png', {
        'amount of error',
        torch.linspace(1,#_log['err'],#_log['err']),
        torch.log(torch.Tensor(_log['err'])),
        '-'
    })

    -- plot errors
    if opt.plot == 'true' then
        trainLogger:style{['% mean class accuracy (train set)'] = '-'}
        testLogger:style{['% mean class accuracy (test set)'] = '-'}
        trainLogger:plot()
        testLogger:plot()
    end

end



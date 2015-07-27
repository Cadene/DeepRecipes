require 'torch'
require 'nn'
require 'xlua'
require 'optim'
posix = require 'posix'

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
cmd:option('-load_seed',       'false',      'load seed')
cmd:option('-path2seed',       './save/seed.save', 'path to seed used during the dataset making process')
-- settings net loading
cmd:option('-load_model',      'false',       'loading model or not')
-- settings net building
cmd:option('-type',            'float',     'type: float | cuda')
cmd:option('-cudnn',           'false',     'false | true')
cmd:option('-model_type',      'standard',  'model_type: standard | overfeat | cadnet')
cmd:option('-threads',         1,           'number of threads')
cmd:option('-gpuid',           1,           'gpu id')
cmd:option('-H',               100,         'number of hidden layers')
cmd:option('-criterion',       'NLL',       'criterion: NLL - negative log likelihood')
cmd:option('-dropout',         0.5,           'do dropout with x probability')
-- settings optimizer
cmd:option('-optimizer',       'SGD',        'CG | LBFGS | SGD | ASGD | ADAGRAD')
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
cmd:option('-path2save',       './save/',        'path to the saving dir')
cmd:option('-plot',            'true',      'plot')
-- cmd:option('-print_layers_op', false,       'Output the values from each layers')
cmd:option('-run',             'false',      'run main')
cmd:option('-train',	       'true',	    'train net')
cmd:option('-test',	       'false',     'test net')
cmd:text()
opt = cmd:parse(arg or {})

------------------------------------------------------------------------
-- PID

pid = posix.getpid("pid")
print("# ... lunching using pid = "..pid)

------------------------------------------------------------------------
-- Path2

path2seed = opt.path2save.."seed.save"
path2train_logger = paths.concat(opt.path2save, 'train.logger')
path2test_logger = paths.concat(opt.path2save, 'test.logger')
path2train_log = paths.concat(opt.path2save, 'train.log')
path2test_log = paths.concat(opt.path2save, 'test.log')
path2model = paths.concat(opt.path2save.."model.net")
path2optim_state = paths.concat(opt.path2save.."optim.state")
path2optim_method = paths.concat(opt.path2save.."optim.method")

------------------------------------------------------------------------
-- Seed

if opt.load_model == 'false' then
    print('# ... saving seed in '..path2seed)
    seed = torch.seed()
    seed_save = io.open(path2seed, 'w')
    seed_save:write(string.format('%.0f', seed)) -- scientific to full number
    seed_save:close()
else
    print('# ... loading seed in '..path2seed)
    for line in io.lines(path2seed) do
        seed = tonumber(line)
    end
end
torch.manualSeed(seed)

------------------------------------------------------------------------
-- Cuda

torch.setdefaulttensortype('torch.FloatTensor')
if opt.type == 'cuda' then
    print('# ... switching to CUDA')
    require 'cutorch'
    require 'cunn'
    if opt.cudnn == 'true' then
        require 'cudnn'
    end
    cutorch.setDevice(opt.gpuid)
end
torch.setnumthreads(opt.threads)

------------------------------------------------------------------------
-- Dataset

dofile('1_data.lua')

------------------------------------------------------------------------
-- Model

dofile('2_model.lua')

-----------------------------------------------------------------------
-- Matrix Confusion

confusion = optim.ConfusionMatrix(class_str)

-----------------------------------------------------------------------
-- Logger

if true then
    trainLogger = optim.Logger(path2train_log)
    testLogger  = optim.Logger(path2test_log)
else
    trainLogger = torch.load(path2train_logger)
    testLogger  = torch.load(path2test_logger)
end

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
-- Saving

function save(epoch)
    if epoch % opt.save_every == 0 then
        time['save_every'] = torch.Timer()
        
        print('# ... saving model to '..path2model)
        os.execute('mkdir -p ' .. sys.dirname(path2model))
        torch.save(path2model, model)
        print(": tac = "..(time['save_every']:time().real).." sec")

        print('# ... saving optimfunc.state to '..path2optim_state)
        os.execute('mkdir -p ' .. sys.dirname(path2optim_state))
        torch.save(path2optim_state, optimfunc.state)
        print(": tac = "..(time['save_every']:time().real).." sec")

        print('# ... saving optimfunc.method to '..path2optim_method)
        os.execute('mkdir -p ' .. sys.dirname(path2optim_method))
        torch.save(path2optim_method, optimfunc.method)
        print(": tac = "..(time['save_every']:time().real).." sec")
    
        --print('# ... saving trainLogger and testLogger')
        --torch.save(path2train_logger, trainLogger)
        --torch.save(path2test_logger, testLogger)
    end
end

-----------------------------------------------------------------------
-- Run

time = {}

if opt.run == 'true' then

    _log = {}
    _log['err'] = {}
	
    for epoch = 1, opt.epoch do

        print('\n#####################')
        print('# Epoch n° '..epoch)

        if opt.train == 'true' then
           train(epoch)
        end
        if opt.test == 'true' then
            test(epoch)
        end

        save(epoch)
    end

    -- Ploter.figure('learning_batch'..opt.batch_size..'.png', {
    --     'amount of error',
    --     torch.linspace(1,#_log['err'],#_log['err']),
    --     torch.log(torch.Tensor(_log['err'])),
    --     '-'
    -- })

    --[[ plot errors ]]--
    if opt.plot == 'true' then
        if opt.train == 'true' then
            trainLogger:style{['% mean class accuracy (train set)'] = '-'}
            trainLogger:plot()
        end
        if opt.test == 'true' then
            testLogger:style{['% mean class accuracy (test set)'] = '-'}
            testLogger:plot()
        end
    end

end



require 'torch'
require 'optim'
require 'src/Optimizer'

local OptimizerFactory = torch.class('OptimizerFactory')

function OptimizerFactory.generate(opt, ...)
    local type_optimizer = opt.type_optimizer:lower()
    local method_name = 'generate_'..type_optimizer
    local optimizer = OptimizerFactory[method_name](opt, ...)
    print(optimizer)
    print('type : '..opt.type_optimizer)
    return optimizer
end

function OptimizerFactory.generate_cg(opt)
    local method   = optim.cg
    local config   = {}
    config.maxIter = opt.max_iter
    return Optimizer(method, config)
end

function OptimizerFactory.generate_lbfgs(opt)
    local method        = optim.lbfgs
    local config        = {}
    config.maxIter      = opt.max_iter
    config.learningRate = opt.learning_rate
    return Optimizer(method, config)
end

function OptimizerFactory.generate_sgd(opt, config)
    local method             = require 'src/sgd'
    config = config or {}
    config.maxIter           = opt.max_iter
    config.learningRate      = opt.learning_rate
    config.learningRateDecay = opt.learningRateDecay
    config.momentum          = opt.momentum
    config.weightDecay       = opt.weight_decay
    config.nesterov          = true
    config.dampening         = 0
    -- config.learningRates     = torch.Tensor(603):fill(5e-2)
    return Optimizer(method, config)
end

function OptimizerFactory.generate_sgd_overfeat(opt, config)
    local method             = require 'src/sgd'
    config = config or {}
    config.maxIter           = opt.max_iter
    config.learningRate      = opt.learning_rate
    config.learningRateDecay = opt.learningRateDecay
    config.momentum          = opt.momentum
    config.weightDecay       = opt.weight_decay
    config.nesterov          = false
    config.dampening         = 0

    local nb_param = 140973285 -- 101 classes

    local lr_classif = config.learningRate
    local lr_convo   = lr_classif / 10
    local lrs        = torch.Tensor(nb_param)
    for i = 1,  18916480 do
        lrs[i] = lr_convo
    end

    for i =  18916480, nb_param do
        lrs[i] = lr_classif
    end
    config.learningRates = lrs
    
    return Optimizer(method, config)
end

function OptimizerFactory.generate_adagrad(opt)
    local method        = optim.adagrad
    local config        = {}
    config.learningRate = opt.learning_rate
    return Optimizer(method, config)
end

function OptimizerFactory.generate_rmsprop(opt)
    local method        = optim.rmsprop
    local config        = {}
    config.maxIter      = opt.max_iter
    config.learningRate = opt.learning_rate
    config.alpha        = 0.99
    config.epsilon      = 1e-8
    return Optimizer(method, config)
end

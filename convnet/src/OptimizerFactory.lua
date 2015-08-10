require 'torch'
require 'optim'
require 'src/Optimizer'

local OptimizerFactory = torch.class('OptimizerFactory')

function OptimizerFactory.generate(opt)
    local optimizer_type = opt.optimizer_type:lower()
    local method_name = 'generate_'..optimizer_type
    return OptimizerFactory[method_name](opt)
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

function OptimizerFactory.generate_sgd(opt)
    local method             = optim.sgd
    local config             = {}
    config.maxIter           = opt.max_iter
    config.learningRate      = opt.learning_rate
    config.learningRateDecay = opt.learningRateDecay
    config.momentum          = opt.momentum
    config.weightDecay       = opt.weight_decay
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
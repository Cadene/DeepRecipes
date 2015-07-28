print("# ... building optimizer")

optimfunc = {}
optimfunc.name = opt.optimizer

if opt.optimizer == 'CG' then
    optimState = {
        maxIter = opt.max_iter
    }
    if opt.load_model ~= 'true' then
        optimMethod = optim.cg
    end

elseif opt.optimizer == 'LBFGS' then
    optimState = {
        maxIter = opt.max_iter,
        learningRate = opt.learning_rate,
        nCorrection = 10
    }
    if opt.load_model ~= 'true' then
        optimMethod = optim.lbfgs
    end

elseif opt.optimizer == 'SGD' then
    -- Given the function above, we can now easily train the model using SGD.
    -- For that, we need to define four key parameters:
    --   + a learning rate: the size of the step taken at each stochastic 
    --     estimate of the gradient
    --   + a weight decay, to regularize the solution (L2 regularization)
    --   + a momentum term, to average steps over time
    --   + a learning rate decay, to let the algorithm converge more precisely
    optimfunc.config = {
        maxIter = opt.max_iter,
        learningRate = opt.learning_rate,
        weightDecay = opt.weight_decay,
        momentum = opt.momentum,
        learningRateDecay = opt.learning_rate_decay
    }
    optimfunc.state = {
        evalCounter = 0,
        decayParameters = nil,
        deltaParameters = nil
    }
    optimfunc.method = require "sgd"

elseif opt.optimizer == 'ASGD' then
    optimState = {
        maxIter = opt.max_iter,
        eta0 = opt.learning_rate,
        t0 = trainSet:size() * opt.t0
    }
    if opt.load_model ~= 'true' then
        optimMethod = optim.asgd
    end

elseif opt.optimizer == 'ADAGRAD' then
    optimfunc.config = {
        learningRate = opt.learning_rate
    }
    optimfunc.state = {
        paramVariance = nil
    }
    optimfunc.method = require "adagrad"

elseif opt.optimizer == 'RMSPROP' then
    optimState = {
        maxIter = opt.max_iter,
        learningRate = opt.learning_rate,
        alpha = 0.99,
        epsilon = 1e-8
    }
    if opt.load_model ~= 'true' then
        optimMethod = optim.rmsprop
    end

else
   error(opt.optimizer..' is not a valid optimizer')
end

if opt.load_model == 'true' then
    print('# ...reloading previously trained optimfunc.state')
    --optimfunc.state  = torch.load(path2.load.optim_state)
    --optimfunc.method = torch.load(path2.load.optim_method)
end

print("# Optimizer")
print(optimfunc)

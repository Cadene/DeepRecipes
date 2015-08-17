require 'torch'
require 'src/Logger'

local LoggerFactory = torch.class('LoggerFactory')

function LoggerFactory.generate(name, opt)
    local logger = Logger(name)
    if opt.load_logger then
        logger:load(opt)
    end
    return logger
end

function LoggerFactory.generate_all(opt)
    local log_train = LoggerFactory.generate('train', opt)
    local log_test  = LoggerFactory.generate('test', opt)
    return log_train, log_test
end

require 'torch'
require 'nn'

local CriterionFactory = torch.class('CriterionFactory')

function CriterionFactory.generate(opt, model, ...)
    local criterion_type = opt.criterion_type:lower()
    local method_name = 'generate_'..criterion_type
    return CriterionFactory[method_name](opt, model, ...)
end

function CriterionFactory.generate_nll(opt, model)
    model:add(nn.LogSoftMax())
    local criterion = nn.ClassNLLCriterion()
    return model, criterion
end

function CriterionFactory.generate_mm(opt, model)
    model:add(nn.SoftMax())
    local criterion = nn.MultiMarginCriterion()
    return model, criterion
end

function CriterionFactory.generate_mse(opt, model)
    model:add(nn.Tanh())
    local criterion = nn.MSECriterion()
    criterion.sizeAverage() -- ???
    return model, criterion
end
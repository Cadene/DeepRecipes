require 'torch'
require 'nn'

local CriterionFactory = torch.class('CriterionFactory')

function CriterionFactory.generate(opt, ...)
    local type_criterion = opt.type_criterion:lower()
    local method_name = 'generate_'..type_criterion
    local criterion = CriterionFactory[method_name](opt, ...)
    print('\nCriterion :\ntype: '..criterion:__tostring())
    return criterion
end

function CriterionFactory.generate_nll(opt)
    local criterion = nn.ClassNLLCriterion()
    return criterion
end

function CriterionFactory.generate_mm(opt)
    local criterion = nn.MultiMarginCriterion()
    return criterion
end

function CriterionFactory.generate_mse(opt)
    local criterion = nn.MSECriterion()
    criterion.sizeAverage() -- ???
    return criterion
end
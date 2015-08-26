require 'torch'

local Optimizer = torch.class('Optimizer')

function Optimizer:__init(method, config, state)
    self.method = method
    self.config = config
    self.state  = state or {}
end

function Optimizer:optimize(feval, parameters)
    self.method(feval, parameters, self.config, self.state)
end

function Optimizer:__tostring__()
    local str = '\nOptimizer:'
    for k,v in pairs(self.config) do
        if k ~= 'learningRates' then
            str = str..'\n'..k..' : '..tostring(v)
        else
            str = str..'\n'..k..' : size['..tostring(v:size(1))
        end
    end
    return str
end
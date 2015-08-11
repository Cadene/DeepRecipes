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
        str = str..'\n'..k..' : '..tostring(v)
    end
    return str
end
require 'torch'

local OptManager = torch.class('OptManager')

function OptManager:__init__()
    self.opt = {}
end

function OptManager:parse(cmd, arg)
    self.opt = cmd:parse(arg or {})
    return self:process()
end

function OptManager:process()
    self:str2bool()
    self:paths()
    print(self.opt)
    return self.opt
end

function OptManager:str2bool()
    for k, v in pairs(self.opt) do
        if v == 'true' then
            self.opt[k] = true
        elseif v == 'false' then
            self.opt[k] = false
        end
    end
end

function OptManager:paths()
    local p2s = self.opt.path2save
    local p2l = self.opt.path2load
    self.opt.path2save_model = paths.concat(p2s, 'model.t7')
    self.opt.path2load_model = paths.concat(p2l, 'model.t7')
end
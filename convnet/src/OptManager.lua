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
    self:loads()
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

    self.opt.path2save_log   = p2s
    self.opt.path2load_log   = p2l

    self.opt.path2save_epoch = paths.concat(p2s, 'epoch.t7')
    self.opt.path2load_epoch = paths.concat(p2s, 'epoch.t7')

    self.opt.path2save_mean  = paths.concat(p2s, 'mean.t7')
    self.opt.path2load_mean  = paths.concat(p2l, 'mean.t7')

    self.opt.path2save_std   = paths.concat(p2s, 'std.t7')
    self.opt.path2load_std   = paths.concat(p2l, 'std.t7')
end

function OptManager:loads()
    self.opt.load_logger = self.opt.load_logger or self.opt.load_model
    self.opt.load_epoch  = self.opt.load_epoch  or self.opt.load_model
end
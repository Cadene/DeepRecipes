require 'torch'
require 'src/Tools'

local Logger = torch.class('Logger')

function Logger:__init(name)
    self.name = name or 'train'
    self.name_log = name..'.log'
    self.name_save = name..'.t7'
    self.rslt = {}
    self.epoch = 0
end

function Logger:save(opt)
    local path2save = paths.concat(opt.path2save_log, self.name_save)
    torch.save(path2save, self.rslt)
end

function Logger:load(opt)
    local path2load = paths.concat(opt.path2load_log, self.name_save)
    if Tools.file_exist(path2load) then
        self.rslt = torch.load(path2load)
        return true
    end
    return false
end

function Logger:maj(acc, opt, epoch)
    self:add(acc, epoch)
    self:write2csv(opt)
    self:save(opt)
end

function Logger:add(acc, epoch)
    self.epoch = epoch or (self.epoch + 1)
    self.rslt[self.epoch] = acc
end

function Logger:write2csv(opt)
    local s = ';'
    local n = '\n'
    local path2save = paths.concat(opt.path2save_log, self.name_log)
    local file = io.open(path2save, 'w') --erases any previous content
    file:write('epoch'..s..self.name..'ing_accuracy'..n)
    table.sort(self.rslt)
    for k, v in pairs(self.rslt) do
        file:write(k..s..v..n)
    end
end
        
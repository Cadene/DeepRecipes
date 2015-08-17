require 'torch'
posix = require 'posix'

local Tools = torch.class('Tools')

function Tools.display_pid()
    print("# ... lunching using pid = "..posix.getpid("pid"))
end

function Tools.manage_gpu_lib(opt)
    if opt.cuda then
        print('# ... switching to CUDA')
        require 'cutorch'
        cutorch.setDevice(opt.gpuid)
        cutorch.manualSeed(opt.seed, opt.gpuid)
        require 'cunn'
        if opt.cudnn then
            require 'cudnn'
        end
        if opt.ccn2 then
            require 'ccn2'
        end
    end
end

function Tools.file_exist(path2file)
    local f = io.open(path2file)
    if f then
        f:close()
        return true
    end
    return false
end
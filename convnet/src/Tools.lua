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
        require 'cunn'
        if opt.cudnn then
            require 'cudnn'
        end
        if opt.ccn2 then
            require 'ccn2'
        end
        cutorch.setDevice(opt.gpuid)
        cutorch.manualSeed(opt.seed, opt.gpuid)
    end
end
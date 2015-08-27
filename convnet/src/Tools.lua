require 'torch'
posix = require 'posix'

local Tools = torch.class('Tools')

function Tools.display_pid()
    local pid = posix.getpid("pid")
    print("# ... lunching using pid = "..pid)
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

function Tools.shuffle_table(t)
    local function shuffle_table(t)
        local rand = math.random 
        assert( t, "shuffleTable() expected a table, got nil" )
        local iterations = #t
        local j
        for i = iterations, 2, -1 do
            j = rand(i)
            t[i], t[j] = t[j], t[i]
        end
    end
    for i = 1, 10 do
        shuffle_table(t)
    end
end

function Tools.table2tensor(t)
    return torch.Tensor(t)
end

function Tools.copy_table(t)
    local copy = {}
    for k, v in pairs(t) do
        copy[k] = v
    end
    return copy
end
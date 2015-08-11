require 'torch'
posix = require 'posix'

local Tools = torch.class('Tools')

function Tools.display_pid()
    print("# ... lunching using pid = "..posix.getpid("pid"))
end

function Tools.convert_str2bool(opt)
    for k, v in pairs(opt) do
        if v == 'true' then
            opt[k] = true
        elseif v == 'false' then
            opt[k] = false
        end
    end
end


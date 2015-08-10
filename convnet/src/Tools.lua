require 'torch'
posix = require 'posix'

local Tools = torch.class('Tools')

function Tools.display_pid()
    print("# ... lunching using pid = "..posix.getpid("pid"))
end

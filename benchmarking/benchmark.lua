require 'torch'
require 'nn'
require 'image'


cmd = torch.CmdLine()
cmd:text()
cmd:text('Benchmark Overfeat')
cmd:text()
cmd:text('Options:')
cmd:option('-iter', 10, '')
cmd:option('-x', 221, 'dim1')
cmd:option('-y', 221, 'dim2')
cmd:option('-z', 3, 'dim3')
cmd:option('-relu_inplace', 'true', 'true use less memory?')
cmd:option('-convMM', 'true', '')
cmd:option('-cuda', 'false', 'CUDA')
cmd:option('-sync', 'false', 'sync require cuda')
cmd:option('-cudnn', 'false', 'cuDNN require cuda')
cmd:option('-relu_cudnn', 'false', 'different implementation? require cudnn')
cmd:option('-ccn2', 'false', 'ccn2 require cuda')
cmd:option('-4d_tensor', 'false', '')
cmd:option('-batch_size', 1, '')


opt = cmd:parse(arg)

for k, v in pairs(opt) do
    if v == 'true' then
        opt[k] = true
    elseif v == 'false' then
        opt[k] = false
    end
end

if opt.cuda then
    require 'cunn'
    require 'cutorch'
    cutorch.setDevice(8)
end

local SpatialConvolution
if opt.convMM then
    SpatialConvolution = nn.SpatialConvolutionMM
else
    SpatialConvolution = nn.SpatialConvolution
end
local SpatialMaxPooling = nn.SpatialMaxPooling
local ReLU = nn.ReLU

if opt.cudnn then
    require 'cudnn'
    SpatialConvolution = cudnn.SpatialConvolution
    SpatialConvolutionMM = cudnn.SpatialConvolution
    SpatialMaxPooling = cudnn.SpatialMaxPooling
    if opt.relu_cudnn then
        ReLU = cudnn.ReLU
    end
end

if opt.ccn2 then
    require 'ccn2'
    SpatialConvolution = function (...)
        local arg = {...}
        return ccn2.SpatialConvolution(arg[1], arg[2], arg[3], arg[5], arg[7])
    end
    SpatialMaxPooling = function (...)
        local arg = {...}
        return ccn2.SpatialMaxPooling(arg[1], arg[3])
    end
end

torch.setdefaulttensortype('torch.FloatTensor')
torch.setnumthreads(8)

local function cutorch_sync()
    if opt.sync then
        cutorch.synchronize()
    end
end


local model = nn.Sequential()

model:add(SpatialConvolution(3, 96, 7, 7, 2, 2, 0, 0))
model:add(ReLU(opt.relu_inplace))
model:add(SpatialMaxPooling(3, 3, 3, 3))
model:add(SpatialConvolution(96, 256, 7, 7, 1, 1, 0, 0))
model:add(ReLU(opt.relu_inplace))
model:add(SpatialMaxPooling(2, 2, 2, 2))
model:add(SpatialConvolution(256, 512, 3, 3, 1, 1, 1, 1))
model:add(ReLU(opt.relu_inplace))
model:add(SpatialConvolution(512, 512, 3, 3, 1, 1, 1, 1))
model:add(ReLU(opt.relu_inplace))
model:add(SpatialConvolution(512, 1024, 3, 3, 1, 1, 1, 1))
model:add(ReLU(opt.relu_inplace))
model:add(SpatialConvolution(1024, 1024, 3, 3, 1, 1, 1, 1))
model:add(ReLU(opt.relu_inplace))
model:add(SpatialMaxPooling(3, 3, 3, 3))
model:add(SpatialConvolution(1024, 4096, 5, 5, 1, 1, 0, 0))
model:add(ReLU(opt.relu_inplace))
model:add(SpatialConvolution(4096, 4096, 1, 1, 1, 1, 0, 0))
model:add(ReLU(opt.relu_inplace))
model:add(SpatialConvolution(4096, 1000, 1, 1, 1, 1, 0, 0))
model:add(nn.View(1000))
-- model:add(nn.SoftMax())
print(model)

local input
if opt['4d_tensor'] then
    input = torch.Tensor(opt.batch_size, opt.z, opt.x, opt.y)
else
    opt.batch_size = 1
    input = torch.Tensor(opt.z, opt.x, opt.y)
end

if opt.cuda then
    model:cuda()
    input = input:cuda()
end

local a = torch.Timer()
local time
local tf_time = 0
local tb_time = 0

-- dry-run

local tmd, tmf, tmbi, tmbg

model:zeroGradParameters()
sys.tic()
local output = model:updateOutput(input)
local gradInput = model:updateGradInput(input, output)
model:accGradParameters(input, output)
cutorch_sync()
tmd = sys.toc()/opt.batch_size
print(':dry-run():', tmd*1000)
print()

-- benchmark

collectgarbage()
sys.tic()
for t = 1, opt.iter do
    output = model:updateOutput(input)
end
cutorch_sync()
tmf = sys.toc()/opt.iter/opt.batch_size
print(':updateOutput():', tmf*1000)

collectgarbage()
sys.tic()
for t = 1,opt.iter do
    model:updateGradInput(input, output)
end
cutorch_sync()
tmbi = sys.toc()/opt.iter/opt.batch_size
print(':updateGradInput():', tmbi*1000)

collectgarbage()
sys.tic()
local ok = 1
for t = 1,opt.iter do
    ok = pcall(function() model:accGradParameters(input, output) end)
end
cutorch_sync()
tmbg = sys.toc()/opt.iter/opt.batch_size
if not ok then
    print(':accGradParameters():', 'FAILED!')
else
    print(':accGradParameters():', tmbg*1000)
end
print(':Forward:', (tmf)*1000)
print(':Backward:', (tmbi+tmbg)*1000)
print(':TOTAL:', (tmf+tmbi+tmbg)*1000)
print()






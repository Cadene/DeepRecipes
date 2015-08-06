require 'torch'
require 'nn'
require 'image'


cmd = torch.CmdLine()
cmd:text()
cmd:text('Benchmark Overfeat')
cmd:text()
cmd:text('Options:')
cmd:option('-x', 221, 'dim1')
cmd:option('-y', 221, 'dim2')
cmd:option('-z', 3, 'dim3')
cmd:option('-relu_inplace', 'true', 'true use less memory')
cmd:option('-cuda', 'false', 'CUDA')
cmd:option('-sync', 'false', 'sync require cuda')
cmd:option('-cudnn', 'false', 'cuDNN require cuda')
cmd:option('-relu_cudnn', 'false', 'different implementation?')
cmd:option('-4d_tensor', 'false', '')
cmd:option('-batch_size', 128, '')

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

local SpatialConvolution = nn.SpatialConvolution
local SpatialConvolutionMM = nn.SpatialConvolutionMM
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

torch.setdefaulttensortype('torch.FloatTensor')
torch.setnumthreads(8)

local function cutorch_sync()
    if opt.sync then
        cutorch.synchronize()
    end
end


local model = nn.Sequential()

model:add(SpatialConvolution(3, 96, 7, 7, 2, 2))
model:add(ReLU(opt.relu_inplace))
model:add(SpatialMaxPooling(3, 3, 3, 3))
model:add(SpatialConvolutionMM(96, 256, 7, 7, 1, 1))
model:add(ReLU(opt.relu_inplace))
model:add(SpatialMaxPooling(2, 2, 2, 2))
model:add(SpatialConvolutionMM(256, 512, 3, 3, 1, 1, 1, 1))
model:add(ReLU(opt.relu_inplace))
model:add(SpatialConvolutionMM(512, 512, 3, 3, 1, 1, 1, 1))
model:add(ReLU(opt.relu_inplace))
model:add(SpatialConvolutionMM(512, 1024, 3, 3, 1, 1, 1, 1))
model:add(ReLU(opt.relu_inplace))
model:add(SpatialConvolutionMM(1024, 1024, 3, 3, 1, 1, 1, 1))
model:add(ReLU(opt.relu_inplace))
model:add(SpatialMaxPooling(3, 3, 3, 3))
model:add(SpatialConvolutionMM(1024, 4096, 5, 5, 1, 1))
model:add(ReLU(opt.relu_inplace))
model:add(SpatialConvolutionMM(4096, 4096, 1, 1, 1, 1))
model:add(ReLU(opt.relu_inplace))
model:add(SpatialConvolutionMM(4096, 1000, 1, 1, 1, 1))
model:add(nn.View(1000))
model:add(nn.SoftMax())
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

-- local a = torch.Timer()
-- local output = model:forward(input)
-- print('FORWARD free run time:', a:time().real)

-- cutorch_sync()
-- a:reset()
-- output = model:forward(input)
-- cutorch_sync()
-- print('FORWARD sync time:', a:time().real)

-- cutorch_sync()
-- a:reset()
-- model:backward(input, output)
-- print('BACKWARD free run time:', a:time().real)

-- cutorch_sync()
-- a:reset()
-- model:backward(input, output)
-- cutorch_sync()
-- print('BACKWARD sync time:', a:time().real)

cutorch_sync()
local a = torch.Timer()
local output = model:forward(input)
print('FORWARD free run time:', a:time().real / opt.batch_size)
cutorch_sync()
a:reset()
model:backward(input, output)
cutorch_sync()
print('BACKWARD sync time:', a:time().real / opt.batch_size)



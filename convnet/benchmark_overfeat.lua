require 'torch'
require 'nn'
require 'image'


cmd = torch.CmdLine()
cmd:text()
cmd:text('Benchmark Overfeat')
cmd:text()
cmd:text('Options:')
cmd:option('-cuda', 'false', 'CUDA')
cmd:option('-cudnn', 'false', 'cuDNN')
cmd:option('-sync', 'false', 'sync')

opt = cmd:parse(arg)

for k, v in pairs(opt) do
    if v == 'true' then
        opt[k] = true
    elseif v == 'false' then
        opt[k] = false
    else
        error('Arg '..k..' not a boolean')
    end
end

local _cuda = false;
local _cudnn = false;
local _sync = false;

local x = 221
local y = 221
local z = 3

if _cuda then
    require 'cunn'
    require 'cutorch'
end

local SpatialConvolution = nn.SpatialConvolution
local SpatialConvolutionMM = nn.SpatialConvolutionMM
local SpatialMaxPooling = nn.SpatialMaxPooling

if _cudnn then
   require 'cudnn'
   SpatialConvolution = cudnn.SpatialConvolution
   SpatialConvolutionMM = cudnn.SpatialConvolution
   SpatialMaxPooling = cudnn.SpatialMaxPooling
end

torch.setdefaulttensortype('torch.FloatTensor')
torch.setnumthreads(8)

local function cutorch_sync()
    if sync then
        cutorch.synchronize()
    end
end


local model = nn.Sequential()

model:add(SpatialConvolution(3, 96, 7, 7, 2, 2))
model:add(nn.ReLU(true))
model:add(SpatialMaxPooling(3, 3, 3, 3))
model:add(SpatialConvolutionMM(96, 256, 7, 7, 1, 1))
model:add(nn.ReLU(true))
model:add(SpatialMaxPooling(2, 2, 2, 2))
model:add(SpatialConvolutionMM(256, 512, 3, 3, 1, 1, 1, 1))
model:add(nn.ReLU(true))
model:add(SpatialConvolutionMM(512, 512, 3, 3, 1, 1, 1, 1))
model:add(nn.ReLU(true))
model:add(SpatialConvolutionMM(512, 1024, 3, 3, 1, 1, 1, 1))
model:add(nn.ReLU(true))
model:add(SpatialConvolutionMM(1024, 1024, 3, 3, 1, 1, 1, 1))
model:add(nn.ReLU(true))
model:add(SpatialMaxPooling(3, 3, 3, 3))
model:add(SpatialConvolutionMM(1024, 4096, 5, 5, 1, 1))
model:add(nn.ReLU(true))
model:add(SpatialConvolutionMM(4096, 4096, 1, 1, 1, 1))
model:add(nn.ReLU(true))
model:add(SpatialConvolutionMM(4096, 1000, 1, 1, 1, 1))
model:add(nn.View(1000))
model:add(nn.SoftMax())
print(model)

local input = torch.Tensor(z, x, y)

if cuda then
    model:cuda()
    input:cuda()
end

local a = torch.Timer()
local output = model:forward(input)
print('FORWARD free run time:', a:time().real)

cutorch_sync()
a:reset()
output = model:forward(input)
cutorch_sync()
print('FORWARD sync time:', a:time().real)

cutorch_sync()
a:reset()
model:backward(input, output)
print('BACKWARD free run time:', a:time().real)

cutorch_sync()
a:reset()
model:backward(input, output)
cutorch_sync()
print('BACKWARD sync time:', a:time().real)



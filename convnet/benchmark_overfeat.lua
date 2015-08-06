require 'nn'
require 'image'

local cuda = false;

local x = 221
local y = 221
local Z = 3

if cuda then
   require 'cunn'
   require 'cudnn'
   SpatialConvolution = cudnn.SpatialConvolution
   SpatialConvolutionMM = cudnn.SpatialConvolution
   SpatialMaxPooling = cudnn.SpatialMaxPooling
end

torch.setdefaulttensortype('torch.FloatTensor')
torch.setnumthreads(8)


net = nn.Sequential()

net:add(SpatialConvolution(3, 96, 7, 7, 2, 2))
net:add(nn.ReLU(true))
net:add(SpatialMaxPooling(3, 3, 3, 3))
net:add(SpatialConvolutionMM(96, 256, 7, 7, 1, 1))
net:add(nn.ReLU(true))
net:add(SpatialMaxPooling(2, 2, 2, 2))
net:add(SpatialConvolutionMM(256, 512, 3, 3, 1, 1, 1, 1))
net:add(nn.ReLU(true))
net:add(SpatialConvolutionMM(512, 512, 3, 3, 1, 1, 1, 1))
net:add(nn.ReLU(true))
net:add(SpatialConvolutionMM(512, 1024, 3, 3, 1, 1, 1, 1))
net:add(nn.ReLU(true))
net:add(SpatialConvolutionMM(1024, 1024, 3, 3, 1, 1, 1, 1))
net:add(nn.ReLU(true))
net:add(SpatialMaxPooling(3, 3, 3, 3))
net:add(SpatialConvolutionMM(1024, 4096, 5, 5, 1, 1))
net:add(nn.ReLU(true))
net:add(SpatialConvolutionMM(4096, 4096, 1, 1, 1, 1))
net:add(nn.ReLU(true))
net:add(SpatialConvolutionMM(4096, 1000, 1, 1, 1, 1))
net:add(nn.View(1000))
net:add(nn.SoftMax())
print(net)

input = torch.Tensor(z, x, y)

if cuda then
    net:cuda()
    input:cuda()
end

a = torch.Timer()
output = model:forward(input)
print('FORWARD free run time:', a:time().real)

--cutorch.synchronize()
a:reset()
output = model:forward(input)
--cutorch.synchronize()
print('FORWARD sync time:', a:time().real)

--cutorch.synchronize()
a:reset()
model:backward(input, output)
print('BACKWARD free run time:', a:time().real)

--cutorch.synchronize()
a:reset()
model:backward(input, output)
--cutorch.synchronize()
print('BACKWARD sync time:', a:time().real)



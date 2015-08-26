require 'torch'
require 'nn'

local LayerFactory = torch.class('LayerFactory')

function LayerFactory.ReLU(opt)
    --[[
        :Arg: opt.relu_cudnn
        :Arg: opt.relu_inplace 
    ]]
    if opt.relu_cudnn then
        return cudnn.ReLU(opt.relu_inplace)
    end
    return nn.ReLU(opt.relu_inplace)
end

function LayerFactory.SpatialConvolution(opt, ...)
    --[[
        :Arg: opt.cudnn
        :Arg: opt.ccn2
    ]]
    local arg = {...}
    if opt.ccn2 then
        return ccn2.SpatialConvolution(arg[1], arg[2], arg[3], arg[5], arg[7])
    elseif opt.cudnn then
        return cudnn.SpatialConvolution(...)
    elseif opt.convMM then
        return nn.SpatialConvolutionMM(...)
    else
        return nn.SpatialConvolution(...)
    end
end

function LayerFactory.SpatialMaxPooling(opt, ...)
    --[[
        :Arg: opt.ccn2
    ]]
    local arg = {...}
    if opt.ccn2 then
        return ccn2.SpatialMaxPooling(arg[1], arg[3])
    end
    return nn.SpatialMaxPooling(...)
end

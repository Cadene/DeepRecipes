require 'torch'
require 'src/Model'
require 'src/LayerFactory'
local lf = LayerFactory

local ModelFactory = torch.class('ModelFactory')

function ModelFactory.generate(opt, ...)
    local model
    if opt.load_model then
        model = ModelFactory.load(opt)
    else
        local type_model = opt.type_model:lower()
        local method_name = 'generate_'..type_model
        model = ModelFactory[method_name](opt, ...)
    end
    print(model)
    return model
end

function ModelFactory.load(opt)
    print("# ... loading model from "..opt.path2load_model)
    local model = torch.load(opt.path2load_model)
    return Model(model)
end

function ModelFactory.generate_standard(opt, nb_class)
    nb_class = nb_class or opt.K
    local model = nn.Sequential()
    model:add(nn.Linear(opt.D, opt.H))
    model:add(lf.ReLU(opt))
    model:add(nn.Dropout(opt.dropout))
    model:add(nn.Linear(opt.H, nb_class))
    model:add(nn.LogSoftMax())
    return Model(model)
end

function ModelFactory.generate_overfeat(opt, nb_class)
    local model = nn.Sequential()
    -- convolution
    model:add(lf.SpatialConvolutionMM(opt, 3, 96, 7, 7, 2, 2))
    model:add(lf.ReLU(opt))
    model:add(lf.SpatialMaxPooling(opt, 3, 3, 3, 3))
    model:add(lf.SpatialConvolutionMM(opt, 96, 256, 7, 7, 1, 1))
    model:add(lf.ReLU(opt))
    model:add(lf.SpatialMaxPooling(opt, 2, 2, 2, 2))
    model:add(lf.SpatialConvolutionMM(opt, 256, 512, 3, 3, 1, 1, 1, 1))
    model:add(lf.ReLU(opt))
    model:add(lf.SpatialConvolutionMM(opt, 512, 512, 3, 3, 1, 1, 1, 1))
    model:add(lf.ReLU(opt))
    model:add(lf.SpatialConvolutionMM(opt, 512, 1024, 3, 3, 1, 1, 1, 1))
    model:add(lf.ReLU(opt))
    model:add(lf.SpatialConvolutionMM(opt, 1024, 1024, 3, 3, 1, 1, 1, 1))
    model:add(lf.ReLU(opt))
    model:add(lf.SpatialMaxPooling(opt, 3, 3, 3, 3))
    model:add(lf.SpatialConvolutionMM(opt, 1024, 4096, 5, 5, 1, 1))
    model:add(lf.ReLU(opt))
    -- classifier
    model:add(nn.Dropout(opt.dropout))
    model:add(lf.SpatialConvolutionMM(opt, 4096, 4096, 1, 1, 1, 1))
    model:add(lf.ReLU(opt))
    model:add(nn.Dropout(opt.dropout))
    model:add(lf.SpatialConvolutionMM(opt, 4096, nb_class, 1, 1, 1, 1))
    model:add(nn.View(nb_class))
    model:add(nn.LogSoftMax())

    if opt.model_pretrain then
        local m = model.modules
        local ParamBank = require 'ParamBank'
        local label = require 'overfeat_label'
        local offset = 0
        ParamBank:init("net_weight_1")
        ParamBank:read(        0, {96,3,7,7},      m[offset+1].weight)
        ParamBank:read(    14112, {96},            m[offset+1].bias)
        ParamBank:read(    14208, {256,96,7,7},    m[offset+4].weight)
        ParamBank:read(  1218432, {256},           m[offset+4].bias)
        ParamBank:read(  1218688, {512,256,3,3},   m[offset+8].weight)
        ParamBank:read(  2398336, {512},           m[offset+8].bias)
        ParamBank:read(  2398848, {512,512,3,3},   m[offset+11].weight)
        ParamBank:read(  4758144, {512},           m[offset+11].bias)
        ParamBank:read(  4758656, {1024,512,3,3},  m[offset+14].weight)
        ParamBank:read(  9477248, {1024},          m[offset+14].bias)
        ParamBank:read(  9478272, {1024,1024,3,3}, m[offset+17].weight)
        ParamBank:read( 18915456, {1024},          m[offset+17].bias)
        ParamBank:read( 18916480, {4096,1024,5,5}, m[offset+20].weight)
        ParamBank:read(123774080, {4096},          m[offset+20].bias)
        ParamBank:read(123778176, {4096,4096,1,1}, m[offset+22].weight)
        ParamBank:read(140555392, {4096},          m[offset+22].bias)
        -- ParamBank:read(140559488, {1000,4096,1,1}, m[offset+24].weight)
        -- ParamBank:read(144655488, {1000},          m[offset+24].bias)
        ParamBank:close()
    end
    return Model(model)
end

function ModelFactory.generate_medium(opt, nb_class)
    local model = nn.Sequential()
    model:add(nn.SpatialConvolutionMM(3, 8, 3, 3, 1, 1, 1, 1))
    model:add(nn.ReLU(true))
    model:add(nn.SpatialConvolutionMM(8, 8, 3, 3, 1, 1, 1, 1))
    model:add(nn.ReLU(true))
    model:add(nn.SpatialMaxPooling(2, 2, 2, 2))
    model:add(nn.SpatialConvolutionMM(8, 16, 3, 3, 1, 1, 1, 1))
    model:add(nn.ReLU(true))
    model:add(nn.SpatialConvolutionMM(16, 16, 3, 3, 1, 1, 1, 1))
    model:add(nn.ReLU(true))
    model:add(nn.SpatialMaxPooling(2, 2, 2, 2))
    model:add(nn.SpatialConvolutionMM(16, 32, 3, 3, 1, 1, 1, 1))
    model:add(nn.ReLU(true))
    model:add(nn.SpatialConvolutionMM(32, 32, 3, 3, 1, 1, 1, 1))
    model:add(nn.ReLU(true))
    model:add(nn.SpatialMaxPooling(3, 3, 3, 3))
    model:add(nn.Reshape(10368))
    model:add(nn.Linear(10368,2048))
    model:add(nn.ReLU(true))
    model:add(nn.Dropout(opt.dropout))
    model:add(nn.Linear(2048,1024))
    model:add(nn.ReLU(true))
    model:add(nn.Dropout(opt.dropout))
    model:add(nn.Linear(1024,nb_class))
    model:add(nn.LogSoftMax())
    return Model(model)
end

function ModelFactory.generate_small(opt, nb_class)
    local model = nn.Sequential()
    model:add(nn.SpatialConvolutionMM(3, 4, 3, 3, 1, 1, 1, 1))
    model:add(nn.ReLU(true))
    model:add(nn.SpatialMaxPooling(2, 2, 2, 2))
    model:add(nn.SpatialConvolutionMM(4, 8, 3, 3, 1, 1, 1, 1))
    model:add(nn.ReLU(true))
    model:add(nn.SpatialMaxPooling(2, 2, 2, 2))
    model:add(nn.SpatialConvolutionMM(8, 8, 3, 3, 1, 1, 1, 1))
    model:add(nn.ReLU(true))
    model:add(nn.SpatialMaxPooling(2, 2, 2, 2))
    model:add(nn.Reshape(5832))
    model:add(nn.Linear(5832, 1024))
    model:add(nn.ReLU(true))
    model:add(nn.Dropout(opt.dropout))
    model:add(nn.Linear(1024, 1024))
    model:add(nn.ReLU(true))
    model:add(nn.Dropout(opt.dropout))
    model:add(nn.Linear(1024, nb_class))
    model:add(nn.LogSoftMax())
    return Model(model)
end



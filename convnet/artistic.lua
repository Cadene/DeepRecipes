require 'torch'
require 'image'
require 'nn'
require 'src/Tools'
require 'src/ArtistContentCriterion'
require 'src/SpatialArtisticConvolution'

------------------------------------------------------------------------
-- Command line arguments

local cmd = torch.CmdLine()
cmd:text()
cmd:text('ArtisticNet')
cmd:text()
cmd:text('Options:')
-- settings dataset building
cmd:option('-seed', 1337, 'seed')
cmd:option('-threads', 4, 'threads')

cmd:text()
opt = cmd:parse(arg or {})

------------------------------------------------------------------------
-- Global Effects

Tools.display_pid()

torch.setdefaulttensortype('torch.FloatTensor')
torch.manualSeed(opt.seed)
torch.setnumthreads(opt.threads)


------------------------------------------------------------------------
-- Model


model = nn.Sequential()

-- 18,916,480
model:add(nn.SpatialArtisticConvolution(3, 96, 7, 7, 2, 2))
model:add(nn.ReLU(true))
-- model:add(nn.SpatialAveragePooling(3, 3, 3, 3))
-- model:add(nn.SpatialArtisticConvolution(96, 256, 7, 7, 1, 1))
-- model:add(nn.ReLU(true))
-- model:add(nn.SpatialAveragePooling(2, 2, 2, 2))
-- model:add(nn.SpatialArtisticConvolution(256, 512, 3, 3, 1, 1, 1, 1))
-- model:add(nn.ReLU(true))
-- model:add(nn.SpatialArtisticConvolution(512, 512, 3, 3, 1, 1, 1, 1))
-- model:add(nn.ReLU(true))
-- model:add(nn.SpatialArtisticConvolution(512, 1024, 3, 3, 1, 1, 1, 1))
-- model:add(nn.ReLU(true))
-- model:add(nn.SpatialArtisticConvolution(1024, 1024, 3, 3, 1, 1, 1, 1))
-- model:add(nn.ReLU(true))
-- classifier
-- model:add(nn.SpatialAveragePooling(3, 3, 3, 3))
-- model:add(lf.SpatialConvolution(opt, 1024, 4096, 5, 5, 1, 1))
-- model:add(nn.ReLU(true))
-- model:add(nn.Dropout(opt.dropout))
-- model:add(lf.SpatialConvolution(opt, 4096, 4096, 1, 1, 1, 1))
-- model:add(nn.ReLU(true))
-- model:add(nn.Dropout(opt.dropout))
-- model:add(lf.SpatialConvolution(opt, 4096, nb_class, 1, 1, 1, 1))
-- model:add(nn.View(nb_class))
-- model:add(nn.LogSoftMax())

if opt.pretrain_model then
    local m = model.modules
    local ParamBank = require 'ParamBank'
    local label = require 'overfeat_label'
    local offset = 0
    ParamBank:init("net_weight_1")
    ParamBank:read(        0, {96,3,7,7},      m[offset+1].weight)
    ParamBank:read(    14112, {96},            m[offset+1].bias)
    -- ParamBank:read(    14208, {256,96,7,7},    m[offset+4].weight)
    -- ParamBank:read(  1218432, {256},           m[offset+4].bias)
    -- ParamBank:read(  1218688, {512,256,3,3},   m[offset+7].weight)
    -- ParamBank:read(  2398336, {512},           m[offset+7].bias)
    -- ParamBank:read(  2398848, {512,512,3,3},   m[offset+9].weight)
    -- ParamBank:read(  4758144, {512},           m[offset+9].bias)
    -- ParamBank:read(  4758656, {1024,512,3,3},  m[offset+11].weight)
    -- ParamBank:read(  9477248, {1024},          m[offset+11].bias)
    -- ParamBank:read(  9478272, {1024,1024,3,3}, m[offset+13].weight)
    -- ParamBank:read( 18915456, {1024},          m[offset+13].bias)

    -- ParamBank:read( 18916480, {4096,1024,5,5}, m[offset+16].weight)
    -- ParamBank:read(123774080, {4096},          m[offset+16].bias)
    -- ParamBank:read(123778176, {4096,4096,1,1}, m[offset+18].weight)
    -- ParamBank:read(140555392, {4096},          m[offset+18].bias)
    -- ParamBank:read(140559488, {1000,4096,1,1}, m[offset+20].weight)
    -- ParamBank:read(144655488, {1000},          m[offset+20].bias)
end

prepare = function (path2img, dim_in, dim_out)
    local dim     = dim_in or 221
    local dim_out = dim_out or 221
    local img_dim
    local img_raw = image.load(path2img) -- [0,1] -> [0,255]img
    local rh = img_raw:size(2)
    local rw = img_raw:size(3)

    -- rescale to 3 * 256 * 256
    if rh < rw then
       rw = math.floor(rw / rh * dim)
       rh = dim
    else
       rh = math.floor(rh / rw * dim)
       rw = dim
    end
    local img_scale = image.scale(img_raw, rw, rh)

    print(img_scale:size())

    local offsetx = 1
    local offsety = 1
    if rh < rw then
        offsetx = offsetx + math.floor((rw-dim)/2)
    else
        offsety = offsety + math.floor((rh-dim)/2)
    end
    img = img_scale[{{},{offsety,offsety+dim-1},{offsetx,offsetx+dim-1}}]

    print(img:size())

    return img
end

layer = {1, 4, 7, 9, 11, 13}
l = layer[1]

criterion = nn.ArtistContentCriterion()

input_origin = prepare('bee.jpg')
input_gener  = prepare('fraise.jpg')
input_gener  = torch.Tensor(3,221,221):fill(1)

activ_origin = model:forward(input_origin):clone()
activ_gener  = model:forward(input_gener):clone()

-- for i=1, 96 do
--     image.save('test/bee_layer'..i..'.jpg',activ_origin[i])
-- end

loss = criterion:forward(activ_origin, activ_gener)
print('loss', loss)

df_di = criterion:backward(activ_origin, activ_gener)

g = model:updateGradInput(input_origin, df_di)

input_gener:add(g:mul(10/torch.abs(g):mean()))

image.save('bee-layer'..l..'.jpg', input_gener)





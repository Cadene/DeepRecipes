if opt.load_model == 'true' then
    print('<trainer> reloading previously trained network')
    model = torch.load(opt.path2model)

else

    if opt.model_type == 'standard' then
        model = nn.Sequential()

        model:add( nn.Linear(opt.D, opt.H) )
        model:add( nn.ReLU() )
        if opt.dropout ~= 0 then
            model:add( nn.Dropout(opt.dropout) )
        end
        model:add( nn.Linear(opt.H, opt.K) )
        model:add( nn.LogSoftMax() )

    elseif opt.model_type == 'overfeat' then
        local ParamBank = require 'ParamBank'
        local label = require 'overfeat_label'
        local offset = 0

        model = nn.Sequential()
        m = model.modules
        SpatialConvolution = nn.SpatialConvolution
        SpatialConvolutionMM = nn.SpatialConvolutionMM
        SpatialMaxPooling = nn.SpatialMaxPooling
        if opt.type == 'cuda' then
            SpatialConvolution = cudnn.SpatialConvolution
            SpatialConvolutionMM = cudnn.SpatialConvolution
            SpatialMaxPooling = cudnn.SpatialMaxPooling
        end

        model:add(SpatialConvolution(3, 96, 7, 7, 2, 2))
        model:add(nn.Threshold(0, 1e-6))
        model:add(SpatialMaxPooling(3, 3, 3, 3))
        model:add(SpatialConvolutionMM(96, 256, 7, 7, 1, 1))
        model:add(nn.Threshold(0, 1e-6))
        model:add(SpatialMaxPooling(2, 2, 2, 2))
        model:add(nn.SpatialZeroPadding(1, 1, 1, 1))
        model:add(SpatialConvolutionMM(256, 512, 3, 3, 1, 1))
        model:add(nn.Threshold(0, 1e-6))
        model:add(nn.SpatialZeroPadding(1, 1, 1, 1))
        model:add(SpatialConvolutionMM(512, 512, 3, 3, 1, 1))
        model:add(nn.Threshold(0, 1e-6))
        model:add(nn.SpatialZeroPadding(1, 1, 1, 1))
        model:add(SpatialConvolutionMM(512, 1024, 3, 3, 1, 1))
        model:add(nn.Threshold(0, 1e-6))
        model:add(nn.SpatialZeroPadding(1, 1, 1, 1))
        model:add(SpatialConvolutionMM(1024, 1024, 3, 3, 1, 1))
        model:add(nn.Threshold(0, 1e-6))
        model:add(SpatialMaxPooling(3, 3, 3, 3))
        model:add(SpatialConvolutionMM(1024, 4096, 5, 5, 1, 1))
        model:add(nn.Threshold(0, 1e-6))
        model:add(SpatialConvolutionMM(4096, 4096, 1, 1, 1, 1))
        model:add(nn.Threshold(0, 1e-6))
        -- model:add(nn.View(4096))
        model:add(SpatialConvolutionMM(4096, #class_str, 1, 1, 1, 1))
        model:add(nn.View(#class_str))
        model:add(nn.LogSoftMax())

        -- model:add(SpatialConvolutionMM(4096, 1000, 1, 1, 1, 1))
        -- model:add(nn.View(1000))
        -- model:add(nn.SoftMax())

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

    else
        error(opt.model_type..' is not a valid type')
    end
end



------------------------------------------------------------------------
-- criterion

if opt.criterion == 'NLL' then
    -- becarefull you have to add a nn.LogSoftMax()
    criterion = nn.ClassNLLCriterion()
elseif opt.criterion == 'MM' then
    criterion = nn.MultiMarginCriterion()
-- elseif opt.criterion == 'MSE' then
--     model:add(nn.Tanh())
--     criterion = nn.MSECriterion()
--     criterion.sizeAverage()
else
    error(opt.criterion..' is not a valid criterion')
end

-- Retrieve parameters and gradients:
-- this extracts and flattens all the trainable parameters of the mode
-- into a 1-dim vector
parameters, gradParameters = model:getParameters()

-----------------------------------------------------------------------
-- CUDA?

if opt.type == 'cuda' then
   model:cuda()
   criterion:cuda()
end
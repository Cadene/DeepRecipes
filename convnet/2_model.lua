if opt.load_model == 'true' then
    print('# ...reloading previously trained model')
    model = torch.load(path2.load.model)
    parameters, gradParameters = model:getParameters()
    
    function compare_param(parameters, parameters2)
        for id = 1, #parameters:size() do
            if parameters[i] ~= parameters2[i] then
                return false
            end
        end
        return true
    end

    -- print("compare_param ", compare_param(parameters, parameters2))
    -- print("compare_grad_param ", compare_param(gradParameters, gradParameters2))

else
    print('# ... building model')

    if opt.model_type == 'standard' then
        model = nn.Sequential()

        model:add( nn.Linear(opt.D, opt.H) )
        model:add( nn.ReLU() )
        model:add( nn.Dropout(opt.dropout) )
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

        if opt.type == 'cuda' and opt.cudnn == 'true' then
            require 'cudnn' -- time to train *6
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
        model:add( nn.Dropout(opt.dropout) )
        model:add(SpatialConvolutionMM(4096, 4096, 1, 1, 1, 1))
        model:add(nn.Threshold(0, 1e-6))
        model:add( nn.Dropout(opt.dropout) )
        model:add(SpatialConvolutionMM(4096, #class_str, 1, 1, 1, 1))
        model:add(nn.View(#class_str))
        model:add(nn.LogSoftMax())

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

    elseif opt.model_type == 'overfeat_scratch' then
	
	    model = nn.Sequential()
        model:add(nn.SpatialConvolutionMM(3, 96, 7, 7, 2, 2))
        model:add(nn.Threshold(0, 1e-6))
        model:add(nn.SpatialMaxPooling(3, 3, 3, 3))
        model:add(nn.SpatialConvolutionMM(96, 256, 7, 7, 1, 1))
        model:add(nn.Threshold(0, 1e-6))
        model:add(nn.SpatialMaxPooling(2, 2, 2, 2))
        model:add(nn.SpatialZeroPadding(1, 1, 1, 1))
        model:add(nn.SpatialConvolutionMM(256, 512, 3, 3, 1, 1))
        model:add(nn.Threshold(0, 1e-6))
        model:add(nn.SpatialZeroPadding(1, 1, 1, 1))
        model:add(nn.SpatialConvolutionMM(512, 512, 3, 3, 1, 1))
        model:add(nn.Threshold(0, 1e-6))
        model:add(nn.SpatialZeroPadding(1, 1, 1, 1))
        model:add(nn.SpatialConvolutionMM(512, 1024, 3, 3, 1, 1))
        model:add(nn.Threshold(0, 1e-6))
        model:add(nn.SpatialZeroPadding(1, 1, 1, 1))
        model:add(nn.SpatialConvolutionMM(1024, 1024, 3, 3, 1, 1))
        model:add(nn.Threshold(0, 1e-6))
        model:add(nn.SpatialMaxPooling(3, 3, 3, 3))
        model:add(nn.SpatialConvolutionMM(1024, 4096, 5, 5, 1, 1))
        model:add(nn.Threshold(0, 1e-6))
        model:add( nn.Dropout(opt.dropout) )
        model:add(nn.SpatialConvolutionMM(4096, 4096, 1, 1, 1, 1))
        model:add(nn.Threshold(0, 1e-6))
        model:add( nn.Dropout(opt.dropout) )
        model:add(nn.SpatialConvolutionMM(4096, #class_str, 1, 1, 1, 1))
        model:add(nn.View(#class_str))
        model:add(nn.LogSoftMax())


        model = nn.Sequential()
        model:add(nn.SpatialConvolutionMM(3, 96, 7, 7, 2, 2))
        model:add(nn.Threshold(0, 1e-6))
        model:add(nn.SpatialMaxPooling(3, 3, 3, 3))
        model:add(nn.SpatialConvolutionMM(96, 256, 7, 7, 1, 1))
        model:add(nn.Threshold(0, 1e-6))
        model:add(nn.SpatialMaxPooling(2, 2, 2, 2))
        model:add(nn.SpatialZeroPadding(1, 1, 1, 1))
        model:add(nn.SpatialConvolutionMM(256, 512, 3, 3, 1, 1))
        model:add(nn.Threshold(0, 1e-6))
        model:add(nn.SpatialZeroPadding(1, 1, 1, 1))
        model:add(nn.SpatialConvolutionMM(512, 512, 3, 3, 1, 1))
        model:add(nn.Threshold(0, 1e-6))
        model:add(nn.SpatialZeroPadding(1, 1, 1, 1))
        model:add(nn.SpatialConvolutionMM(512, 1024, 3, 3, 1, 1))
        model:add(nn.Threshold(0, 1e-6))
        model:add(nn.SpatialZeroPadding(1, 1, 1, 1))
        model:add(nn.SpatialConvolutionMM(1024, 1024, 3, 3, 1, 1))
        model:add(nn.Threshold(0, 1e-6))
        model:add(nn.SpatialMaxPooling(3, 3, 3, 3))
        model:add(nn.SpatialConvolutionMM(1024, 4096, 5, 5, 1, 1))
        model:add(nn.Threshold(0, 1e-6))
        model:add( nn.Dropout(opt.dropout) )
        model:add(nn.SpatialConvolutionMM(4096, 4096, 1, 1, 1, 1))
        model:add(nn.Threshold(0, 1e-6))
        model:add( nn.Dropout(opt.dropout) )
        model:add(nn.SpatialConvolutionMM(4096, #class_str, 1, 1, 1, 1))
        model:add(nn.View(#class_str))
        model:add(nn.LogSoftMax())

    elseif opt.model_type == 'medium' then

        --[[
            Input size 221*221*3
        ]]--

        model = nn.Sequential()

        model:add(nn.SpatialConvolutionMM(3, 8, 3, 3, 1, 1, 1, 1))
        model:add(nn.ReLU())
        model:add(nn.SpatialConvolutionMM(8, 8, 3, 3, 1, 1, 1, 1))
        model:add(nn.ReLU())
        model:add(nn.SpatialMaxPooling(2, 2, 2, 2))

        model:add(nn.SpatialConvolutionMM(8, 16, 3, 3, 1, 1, 1, 1))
        model:add(nn.ReLU())
        model:add(nn.SpatialConvolutionMM(16, 16, 3, 3, 1, 1, 1, 1))
        model:add(nn.ReLU())
        model:add(nn.SpatialMaxPooling(2, 2, 2, 2))

        model:add(nn.SpatialConvolutionMM(16, 32, 3, 3, 1, 1, 1, 1))
        model:add(nn.ReLU())
        model:add(nn.SpatialConvolutionMM(32, 32, 3, 3, 1, 1, 1, 1))
        model:add(nn.ReLU())
        model:add(nn.SpatialMaxPooling(3, 3, 3, 3))

        model:add(nn.Reshape(10368))
        model:add(nn.Linear(10368,2048))
        model:add(nn.ReLU())
        model:add( nn.Dropout(opt.dropout) )

        model:add(nn.Linear(2048,1024))
        model:add(nn.ReLU())
        model:add( nn.Dropout(opt.dropout) )
        model:add(nn.Linear(1024,#class_str))
        model:add(nn.LogSoftMax())

    elseif opt.model_type == 'small' then

        --[[
            Input size 221*221*3
        ]]--

        model = nn.Sequential()

        model:add(nn.SpatialConvolutionMM(3, 16, 3, 3, 1, 1, 1, 1))
        model:add(nn.ReLU())
        model:add(nn.SpatialMaxPooling(2, 2, 2, 2))

        model:add(nn.SpatialConvolutionMM(16, 32, 3, 3, 1, 1, 1, 1))
        model:add(nn.ReLU())
        model:add(nn.SpatialMaxPooling(2, 2, 2, 2))

        model:add(nn.SpatialConvolutionMM(32, 32, 3, 3, 1, 1, 1, 1))
        model:add(nn.ReLU())
        model:add(nn.SpatialMaxPooling(3, 3, 3, 3))

        model:add(nn.Reshape(10368))
        model:add(nn.Linear(10368,2048))
        model:add(nn.ReLU())
        model:add( nn.Dropout(opt.dropout) )

        model:add(nn.Linear(2048,1024))
        model:add(nn.ReLU())
        model:add( nn.Dropout(opt.dropout) )
        model:add(nn.Linear(1024,#class_str))
        model:add(nn.LogSoftMax())

    elseif opt.model_type == 'tiny' then

        --[[
            Input size 221*221*3
        ]]--

        model = nn.Sequential()

        model:add(nn.SpatialConvolutionMM(3, 4, 3, 3, 1, 1, 1, 1))
        model:add(nn.ReLU())
        model:add(nn.SpatialMaxPooling(2, 2, 2, 2))

        model:add(nn.SpatialConvolutionMM(4, 8, 3, 3, 1, 1, 1, 1))
        model:add(nn.ReLU())
        model:add(nn.SpatialMaxPooling(2, 2, 2, 2))

        model:add(nn.SpatialConvolutionMM(8, 8, 3, 3, 1, 1, 1, 1))
        model:add(nn.ReLU())
        model:add(nn.SpatialMaxPooling(2, 2, 2, 2))

        model:add(nn.Reshape(5832))
        model:add(nn.Linear(5832,1024))
        model:add(nn.ReLU())
        model:add( nn.Dropout(opt.dropout) )

        model:add(nn.Linear(1024,1024))
        model:add(nn.ReLU())
        model:add( nn.Dropout(opt.dropout) )
        model:add(nn.Linear(1024,#class_str))
        model:add(nn.LogSoftMax())

    elseif opt.model_type == 'verydeep_A' then

        --[[
            Input size 224*224*3 
            Convolution : kernel 3*3, step 1:1, zero padding 1:1
        ]]-- 

        -- not tested
        model = nn.Sequential()
        -- 1
        model:add(nn.SpatialConvolutionMM(3, 64, 3, 3, 1, 1, 3, 3))
        model:add(nn.ReLU())
        model:add(nn.SpatialMaxPooling(2, 2, 2, 2))
        -- 2
        model:add(nn.SpatialConvolutionMM(64, 128, 3, 3, 1, 1, 1, 1))
        model:add(nn.ReLU())
        model:add(nn.SpatialMaxPooling(2, 2, 2, 2))
        -- 3 & 4
        model:add(nn.SpatialConvolutionMM(128, 256, 3, 3, 1, 1, 1, 1))
        model:add(nn.ReLU())
        model:add(nn.SpatialConvolutionMM(256, 256, 3, 3, 1, 1, 1, 1))
        model:add(nn.ReLU())
        model:add(nn.SpatialMaxPooling(2, 2, 2, 2))
        -- 5 & 6
        model:add(nn.SpatialConvolutionMM(256, 512, 3, 3, 1, 1, 1, 1))
        model:add(nn.ReLU())
        model:add(nn.SpatialConvolutionMM(512, 512, 3, 3, 1, 1, 1, 1))
        model:add(nn.ReLU())
        model:add(nn.SpatialMaxPooling(2, 2, 2, 2))
        -- 7 & 8
        model:add(nn.SpatialConvolutionMM(512, 512, 3, 3, 1, 1, 1, 1))
        model:add(nn.ReLU())
        model:add(nn.SpatialConvolutionMM(512, 512, 3, 3, 1, 1, 1, 1))
        model:add(nn.ReLU())
        model:add(nn.SpatialMaxPooling(2, 2, 2, 2))
        -- 9
        model:add(nn.Reshape(25088)) -- (224/2^5)^2 * 512
        model:add(nn.Linear(25088,4096))
        model:add(nn.ReLU())
        model:add( nn.Dropout(opt.dropout) )
        -- 10
        model:add(nn.Linear(4096,4096))
        model:add(nn.ReLU())
        model:add( nn.Dropout(opt.dropout) )
        -- 11
        model:add(nn.Linear(4096,#class_str))
        model:add(nn.LogSoftMax())

    elseif opt.model_type == 'verydeep_D' then

        --[[
            Input size 224*224*3 
            Convolution : kernel 3*3, step 1:1, zero padding 1:1
        ]]-- 

        -- not tested
        model = nn.Sequential()
        -- 1
        model:add(nn.SpatialConvolutionMM(3, 64, 3, 3, 1, 1, 1, 1))
        model:add(nn.ReLU())
        model:add(nn.SpatialConvolutionMM(64, 64, 3, 3, 1, 1, 1, 1))
        model:add(nn.ReLU())
        model:add(nn.SpatialMaxPooling(2, 2, 2, 2))
        -- 2
        model:add(nn.SpatialConvolutionMM(64, 128, 3, 3, 1, 1, 1, 1))
        model:add(nn.ReLU())
        model:add(nn.SpatialConvolutionMM(128, 128, 3, 3, 1, 1, 1, 1))
        model:add(nn.ReLU())
        model:add(nn.SpatialMaxPooling(2, 2, 2, 2))
        -- 3 & 4
        model:add(nn.SpatialConvolutionMM(128, 256, 3, 3, 1, 1, 1, 1))
        model:add(nn.ReLU())
        model:add(nn.SpatialConvolutionMM(256, 256, 3, 3, 1, 1, 1, 1))
        model:add(nn.ReLU())
        model:add(nn.SpatialConvolutionMM(256, 256, 3, 3, 1, 1, 1, 1))
        model:add(nn.ReLU())
        model:add(nn.SpatialMaxPooling(2, 2, 2, 2))
        -- 5 & 6
        model:add(nn.SpatialConvolutionMM(256, 512, 3, 3, 1, 1, 1, 1))
        model:add(nn.ReLU())
        model:add(nn.SpatialConvolutionMM(512, 512, 3, 3, 1, 1, 1, 1))
        model:add(nn.ReLU())
        model:add(nn.SpatialConvolutionMM(512, 512, 3, 3, 1, 1, 1, 1))
        model:add(nn.ReLU())
        model:add(nn.SpatialMaxPooling(2, 2, 2, 2))
        -- 7 & 8
        model:add(nn.SpatialConvolutionMM(512, 512, 3, 3, 1, 1, 1, 1))
        model:add(nn.ReLU())
        model:add(nn.SpatialConvolutionMM(512, 512, 3, 3, 1, 1, 1, 1))
        model:add(nn.ReLU())
        model:add(nn.SpatialConvolutionMM(512, 512, 3, 3, 1, 1, 1, 1))
        model:add(nn.ReLU())
        model:add(nn.SpatialMaxPooling(2, 2, 2, 2))
        -- 9
        model:add(nn.Reshape(25088)) -- (224/2^5)^2 * 512
        model:add(nn.Linear(25088,4096))
        model:add(nn.ReLU())
        model:add( nn.Dropout(opt.dropout) )
        -- 10
        model:add(nn.Linear(4096,4096))
        model:add(nn.ReLU())
        model:add( nn.Dropout(opt.dropout) )
        -- 11
        model:add(nn.Linear(4096,#class_str))
        model:add(nn.LogSoftMax())

    else
        error(opt.model_type..' is not a valid type')
    end
end



------------------------------------------------------------------------
-- criterion

if opt.criterion == 'NLL' then
    -- becareful you have to add a nn.LogSoftMax() to the model
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



-----------------------------------------------------------------------
-- CUDA?

if opt.type == 'cuda' then
   model:cuda()
   criterion:cuda()
else
    model = model:float()
end

-- Retrieve parameters and gradients:
-- this extracts and flattens all the trainable parameters of the model
-- into a 1-dim vector
parameters, gradParameters = model:getParameters()

print("# Model")
print(model)
print("Number of parameters "..parameters:size(1))

print("# Criterion")
print(criterion)



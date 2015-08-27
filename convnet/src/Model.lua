require 'torch'
require 'optim'

require 'src/ConfusionMatrixMonitored'

local Model = torch.class('Model')

function Model:__init(m)
    self.m = m
    local parameters, gradParameters = m:getParameters()
    self.parameters = parameters
    self.gradParameters = gradParameters
end

function Model:__tostring__()
    return '\nModel :\n'
        ..self.m:__tostring__()..'\n'
        ..self.parameters:size(1)..' parameters'
end

function Model:add(layer)
    self.m:add(layer)
end

function Model:cuda()
    self.m:cuda()
end

function Model:train(database, criterion, optimizer, logger, opt, epoch)
    --[[
        :Arg: opt.batch_size
    ]]
    if not opt.train_model then
        do return end
    end

    collectgarbage()

    epoch = epoch or 0
    local timer = torch.Timer()
    local trainset = database:get_trainset()
    local confusion = ConfusionMatrixMonitored(database:nb_class())
    local nb_batch = 1
    local nb_batch_max = math.ceil(trainset:size() / opt.batch_size)
    local pc_max = {0, 0}
    local s

    local ti = {}

    trainset:shuffle()
    self.m:training()
    local parameters = self.parameters --beware of the cuda runtime error - out of memory
    local gradParameters = self.gradParameters

    for t = 1, trainset:size(), opt.batch_size do

        local batch_to = t+opt.batch_size-1
        if batch_to > trainset:size() then
            batch_to = trainset:size()
        end
        local pc_done = math.floor(nb_batch / nb_batch_max * 100 + .5)
        if pc_done >= pc_max[1] then
            print(".:. Batch "..t.." to "..batch_to.." on "..trainset:size().." images")
            pc_max[1] = pc_max[1] + 5
        end

        collectgarbage()
        local inputs, targets = trainset:get_batch(t, opt)

        print('inputs size', inputs:size())

        local conf_outputs = torch.CudaTensor(trainset:size())
        local conf_targets = torch.CudaTensor(trainset:size())

        local feval
        if opt['4d_tensor'] then
            feval = function(x)
                local t1 = torch.Timer()
                if x ~= parameters then -- optim
                    parameters:copy(x)
                end
                print('feval')
                print('t1 '.. t1:time().real .. ' seconds')
                local t2 = torch.Timer()
                self.m:zeroGradParameters()
                print('t2 '.. t2:time().real .. ' seconds')
                local t3 = torch.Timer()
                local outputs = self.m:forward(inputs)
                print('t3 '.. t3:time().real .. ' seconds')
                local t4 = torch.Timer()
                local f = criterion:forward(outputs, targets)
                print('t4 '.. t4:time().real .. ' seconds')
                local t5 = torch.Timer()
                local df_do = criterion:backward(outputs, targets)
                print('t5 '.. t5:time().real .. ' seconds')
                local t6 = torch.Timer()
                gradInput = self.m:backward(inputs, df_do)
                print('t6 '.. t6:time().real .. ' seconds')

                local t7 = torch.Timer()

                local t70 = torch.Timer()
                local _, argmax_outputs = outputs:max(2)
                print('t70 '.. t70:time().real .. ' seconds')
                local t71 = torch.Timer()
                argmax_outputs:resize(targets:size())
                print('t71 '.. t71:time().real .. ' seconds')

                print(torch.type(argmax_outputs))
                print(torch.type(conf_outputs))
                print(torch.type(conf_targets))

                local t72 = torch.Timer()
                for i = 1, argmax_outputs:size(1) do
                    local t700 = torch.Timer()
                    conf_outputs[t+i-1] = argmax_outputs[i]
                    conf_targets[t+i-1] = targets[i]
                    print('>     t700 '.. t700:time().real .. ' seconds')
                end
                print('t72 '.. t72:time().real .. ' seconds')

                -- confusion:batchAdd(outputs, targets)
                print('t7 '.. t7:time().real .. ' seconds')

                -- gradParameters:div(#inputs) ???
                -- f = f / inputs:size(1) ???
                return f, gradParameters
            end
        else
            feval = function(x)
                if x ~= parameters then -- optim
                    parameters:copy(x)
                end
                self.m:zeroGradParameters()
                local f = 0
                for i = 1, #inputs do
                    local output = self.m:forward(inputs[i])
                    local err = criterion:forward(output, targets[i])
                    f = f + err
                    local df_do = criterion:backward(output, targets[i])
                    gradInput = self.m:backward(inputs[i], df_do)
                    confusion:add(output, targets[i]:squeeze())
                end
                gradParameters:div(#inputs)
                f = f / #inputs
                return f, gradParameters -- f and df/dX
            end
        end

        --sys.tic()
        optimizer:optimize(feval, parameters)
        --print("time to optimize", sys.toc())

        if pc_done > pc_max[2] then
            s = timer:time().real / batch_to * (trainset:size() - batch_to)
            print(": "..pc_done.."% done",
                string.format("%.2d:%.2d:%.2d", s/(60*60), s/60%60, s%60).." left")
            pc_max[2] = pc_max[2] + 5
            collectgarbage()
        end

        nb_batch = nb_batch + 1
    end

    print(".:. End of Epoch n° "..epoch)
    s = timer:time().real / nb_batch_max
    print(": Real time to learn 1 batch = "..string.format("%.2d:%.2d:%.2d", s/(60*60), s/60%60, s%60))
    s = timer:time().real
    print(": Real time to learn full batch = "..string.format("%.2d:%.2d:%.2d", s/(60*60), s/60%60, s%60))

    confusion:zero()
    for i = 1, trainset:size() do
        local output = torch.Tensor(database:nb_class()):fill(0)
        local target = torch.Tensor(database:nb_class()):fill(0)
        output[conf_outputs[i]] = 1
        target[conf_targets[i]] = 1
        confusion:add(ouput, target)
    end

    confusion:updateValids()
    print("# Confusion Matrix")
    print(": average row correct: "..(confusion.averageValid*100).."%")
    print(": average rowUcol correct (VOC measure): "..(confusion.averageUnionValid*100).."%")
    print(": > global correct: "..(confusion.totalValid*100).."%")
    logger:maj(confusion.totalValid * 100, opt, epoch)
    
    parameters = nil
    gradParameters = nil
    -- if not opt.cuda and opt.data_type ~= 'Recipe101' and epoch % opt.plot_every == 0 then
    --     -- require 'src/Ploter'
    --     -- Ploter.decision_region(self.m, trainset:get_data(), database:get_classname(), 'epoch_'..epoch..'.png')
    -- end

    -- if opt.plot then
    --     logger:style{['% mean class accuracy (train set)'] = '-'}
    --     logger:plot()
    -- end
end

function Model:test(database, criterion, optimizer, logger, opt, epoch)
    --[[
    ]]
    if not opt.test_model then
        do return end
    end

    epoch = epoch or 0
    local timer = torch.Timer()
    local testset = database:get_testset()
    local confusion = optim.ConfusionMatrix(database:nb_class())
    local pc_max = 0
    local s

    self.m:evaluate()

    for t = 1, testset:size() do
        local input, target = testset:get(t)
        if opt.double then
            input = input:double()
        elseif opt.cuda then
            input = input:cuda()
        end

        local pred = self.m:forward(input)
        confusion:add(pred, target:squeeze())

        local pc_done = math.floor(t / testset:size() * 100 + .5)
        if pc_done >= pc_max then
            -- print(time_mean)
            s = timer:time().real / t * (testset:size() - t)
            print(": "..pc_done.."% done ", string.format("%.2d:%.2d:%.2d", s/(60*60), s/60%60, s%60).." left")
            pc_max = pc_max + 5
            collectgarbage()
        end
    end

    s = timer:time().real
    print(": Time to test all samples = "..string.format("%.2d:%.2d:%.2d", s/(60*60), s/60%60, s%60))

    confusion:updateValids()
    print("# Confusion Matrix")
    print(": average row correct: "..(confusion.averageValid*100).."%")
    print(": average rowUcol correct (VOC measure): "..(confusion.averageUnionValid*100).."%")
    print(": > global correct: "..(confusion.totalValid*100).."%")
    logger:maj(confusion.totalValid * 100, opt, epoch)
    confusion:zero()

    -- if opt.plot then
    --     logger:style{['% mean class accuracy (test set)'] = '-'}
    --     logger:plot()
    -- end

end

function Model:save(opt, epoch)
    --[[
    ]]
    if not opt.save_model then
        do return end
    end
    epoch = epoch or 0
    print('# ... saving model to '..opt.path2save_model)
    torch.save(opt.path2save_model, self.m)
    torch.save(opt.path2save_epoch, epoch)
end

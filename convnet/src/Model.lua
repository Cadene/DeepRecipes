require 'torch'
require 'optim'

-- require 'src/ConfusionMatrixMonitored'

local Model = torch.class('Model')

function Model:__init(m)
    self.m = m
    self.parameters, self.gradParameters = self.m:getParameters()
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

    epoch = epoch or 0
    local timer = torch.Timer()
    local trainset = database:get_trainset()
    local confusion = optim.ConfusionMatrix(database:nb_class())
    local nb_batch = 1
    local nb_batch_max = math.ceil(trainset:size() / opt.batch_size)
    local pc_max = {0, 0}
    local s

    local ti = {}

    trainset:shuffle()
    self.m:training()
    local parameters     = self.parameters --beware of the cuda runtime error - out of memory
    local gradParameters = self.gradParameters

    local inputs_table  = {}
    local targets_table = {}

    collectgarbage('collect')
    collectgarbage('stop')

    local conf_outputs = {}
    local conf_targets = {}

    for t = 1, trainset:size(), opt.batch_size do

        local batch_to = t+opt.batch_size-1
        if batch_to > trainset:size() then
            batch_to = trainset:size()
        end
        local pc_done = math.floor(nb_batch / nb_batch_max * 100 + .5)
        if pc_done >= pc_max[1] then
            print(".:. Batch "..t.." to "..batch_to.." on "..trainset:size().." images")
            pc_max[1] = pc_max[1] + 5
            print('Memory usage')
            print('CPU', collectgarbage("count"))
            if opt.cuda then
                local freeMemory, totalMemory = cutorch.getMemoryUsage(opt.gpuid)
                print('GPU', freeMemory .. ' / ' .. totalMemory)
            end
        end

        local inputs, targets = trainset:get_batch(t, opt)
        local loss

        local feval
        if opt['4d_tensor'] then
            feval = function(x)

                if x ~= parameters then -- optim
                    parameters:copy(x)
                end

                print('gradParam t-1', gradParameters[1])
                print('gradParam t-1', self.gradParameters[1])

                self.m:zeroGradParameters()

                gradParameters:fill(0)

                print('gradParam t0', gradParameters[1])
                print('gradParam t0', self.gradParameters[1])

                local outputs = self.m:forward(inputs)

                local f = criterion:forward(outputs, targets)
                loss = f

                local df_do = criterion:backward(outputs, targets)  
                
                self.m:backward(inputs, df_do)

                local _, argmax_outputs = outputs:max(2)
                argmax_outputs:resize(targets:size())

                table.insert(conf_outputs, argmax_outputs)
                table.insert(conf_targets, targets)

                print('gradParam t1', gradParameters[1])
                print('gradParam t1', self.gradParameters[1])

                -- local tbatchadd = torch.Timer()
                -- confusion:batchAdd(argmax_outputs, targets)
                -- print('tbatchadd '.. tbatchadd:time().real .. ' seconds')

                -- gradParameters:div(#inputs) ???
                -- f = f / inputs:size(1) ???
                return f, self.gradParameters
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

                    table.insert(conf_outputs, output)
                    table.insert(conf_targets, targets[i])
                end
                self.gradParameters:div(#inputs)
                f = f / #inputs
                return f, self.gradParameters -- f and df/dX
            end
        end

        print('param t0', parameters[1], parameters[{{1,10}}]:mean())
        optimizer:optimize(feval, parameters)
        print('param t1', parameters[1], parameters[{{1,10}}]:mean())

        if pc_done > pc_max[2] then
            s = timer:time().real / batch_to * (trainset:size() - batch_to)
            print(": "..pc_done.."% done",
                string.format("%.2d:%.2d:%.2d", s/(60*60), s/60%60, s%60).." left")
            print('loss:', loss)
            pc_max[2] = pc_max[2] + 5
        end

        nb_batch = nb_batch + 1
    end

    collectgarbage('restart')

    print(".:. End of Epoch n° "..epoch)
    s = timer:time().real / nb_batch_max
    print(": Real time to learn 1 batch = "..string.format("%.2d:%.2d:%.2d", s/(60*60), s/60%60, s%60))
    s = timer:time().real
    print(": Real time to learn full batch = "..string.format("%.2d:%.2d:%.2d", s/(60*60), s/60%60, s%60))

    if opt['4d_tensor'] then
        for i = 1, nb_batch_max do
            confusion:batchAdd(conf_outputs[i], conf_targets[i])
        end
    else
        for i = 1, #conf_outputs do
            confusion:add(conf_outputs[i], conf_targets[i])
        end
    end

    confusion:updateValids()
    print("# Confusion Matrix")
    print(": average row correct: "..(confusion.averageValid*100).."%")
    print(": average rowUcol correct (VOC measure): "..(confusion.averageUnionValid*100).."%")
    print(": > global correct: "..(confusion.totalValid*100).."%")
    logger:maj(confusion.totalValid * 100, opt, epoch)
    confusion:zero()

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

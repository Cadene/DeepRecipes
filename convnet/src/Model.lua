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

    local inputs_table  = {}
    local targets_table = {}

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

        local t0 = torch.Timer()

        print('###############')
        print('t', t)

        local inputs, targets
        if inputs_table[t] then
            inputs = inputs_table[t]
            targets = targets_table[t]
        else
            for i = 1, 10 do
                local inputs, targets = trainset:get_batch(t, opt)
                local index = t + (i-1) * opt.batch_size
                inputs_table[index]  = inputs
                targets_table[index] = targets
                print('index', index)
            end
            inputs = inputs_table[t]
            targets = targets_table[t]
        end
        print(torch.type(inputs))
        print(torch.type(targets))

        print('t0 '.. t0:time().real .. ' seconds')

        local conf_outputs = {}
        local conf_targets = {}

        local feval
        if opt['4d_tensor'] then
            feval = function(x)
                local t1 = torch.Timer()
                if x ~= parameters then -- optim
                    parameters:copy(x)
                end
                print('feval')
                self.m:zeroGradParameters()
                local t10 = torch.Timer()
                local outputs = self.m:forward(inputs)
                print('t10 '.. t10:time().real .. ' seconds')

                local t11 = torch.Timer()
                local t110 = torch.Timer()
                local f = criterion:forward(outputs, targets)
                print('t110 '.. t110:time().real .. ' seconds')
                local t111 = torch.Timer()
                local df_do = criterion:backward(outputs, targets)  
                print('t111 '.. t111:time().real .. ' seconds')
                local t112 = torch.Timer()
                gradInput = self.m:backward(inputs, df_do)
                print('t112 '.. t112:time().real .. ' seconds')
                print('t11 '.. t11:time().real .. ' seconds')

                local _, argmax_outputs = outputs:max(2)
                argmax_outputs:resize(targets:size())

                local t12 = torch.Timer()
                table.insert(conf_outputs, argmax_outputs)
                table.insert(conf_outputs, targets)
                print('t12 '.. t12:time().real .. ' seconds')

                -- confusion:batchAdd(outputs, targets)

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
    for i = 1, nb_batch_max do
        confusion:batchAdd(conf_outputs[i], conf_targets[i])
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

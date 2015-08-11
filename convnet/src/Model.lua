require 'torch'
require 'optim'

local Model = torch.class('Model')

function Model:__init(m)
    self.m = m
end

function Model:__tostring__()
    local parameters, gradParameters = self.m:getParameters()
    return '\nModel :\n'
        ..self.m:__tostring__()..'\n'
        ..parameters:size(1)..' parameters'
end

function Model:add(layer)
    self.m:add(layer)
end

function Model:train(database, criterion, optimizer, opt, epoch)
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
    local logger = optim.Logger(opt.path2save..'train.log')
    local nb_batch = 1
    local nb_batch_max = math.ceil(trainset:size() / opt.batch_size)
    local pc_max = {0, 0}
    local s

    trainset:shuffle()
    self.m:training()
    local parameters, gradParameters = self.m:getParameters()

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

        local inputs = {}
        local targets = {}
        for i = t, math.min(t+opt.batch_size-1, trainset:size()) do
            local input, target = trainset:get(i)
            if opt.cuda then
                input = input:cuda()
            end
            table.insert(inputs, input)
            table.insert(targets, target)
        end

        local feval = function(x)
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

        optimizer:optimize(feval, parameters)

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

    confusion:updateValids()
    print("# Confusion Matrix")
    print(": average row correct: "..(confusion.averageValid*100).."%")
    print(": average rowUcol correct (VOC measure): "..(confusion.averageUnionValid*100).."%")
    print(": > global correct: "..(confusion.totalValid*100).."%")
    logger:add{['% mean class accuracy (train set)'] = confusion.totalValid * 100}
    confusion:zero()

    if not opt.cuda and opt.data_type ~= 'Recipe101' and epoch % opt.plot_every == 0 then
        require 'src/Ploter'
        -- Ploter.decision_region(self.m, trainset:get_data(), database:get_classname(), 'epoch_'..epoch..'.png')
    end

    if opt.plot then
        logger:style{['% mean class accuracy (train set)'] = '-'}
        logger:plot()
    end
end

function Model:test(database, criterion, optimizer, opt, epoch)
    --[[
    ]]
    if not opt.test_model then
        do return end
    end

    epoch = epoch or 0
    local timer = torch.Timer()
    local testset = database:get_testset()
    local confusion = optim.ConfusionMatrix(database:nb_class())
    local logger = optim.Logger(opt.path2save..'test.log')
    local pc_max = 0
    local s

    self.m:evaluate()

    for t = 1, testSet:size() do
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

    s = time['test']:time().real
    print(": Time to test all samples = "..string.format("%.2d:%.2d:%.2d", s/(60*60), s/60%60, s%60))

    confusion:updateValids()
    print("# Confusion Matrix")
    print(": average row correct: "..(confusion.averageValid*100).."%")
    print(": average rowUcol correct (VOC measure): "..(confusion.averageUnionValid*100).."%")
    print(": > global correct: "..(confusion.totalValid*100).."%")
    logger:add{['% mean class accuracy (test set)'] = confusion.totalValid * 100}
    confusion:zero()

    if opt.plot then
        logger:style{['% mean class accuracy (test set)'] = '-'}
        logger:plot()
    end

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
end

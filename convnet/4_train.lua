table_f = {}

function train(epoch)

    print("\n# ... train model")
    model:training()

    time['train'] = torch.Timer()
    
    local time_mean = {}
    local limit = 0

    local shuffle = torch.randperm(trainSet:size())

    local nb_batch = 1
    local nb_batch_max = math.ceil(trainSet:size() / opt.batch_size)

    local pc_max = {0,0}

    for t = 1, trainSet:size(), opt.batch_size do
        
        time['batch'] = torch.Timer()

        local batch_to = t+opt.batch_size-1
        if batch_to > trainSet:size() then
            batch_to = trainSet:size()
        end

        local pc_done = math.floor(nb_batch / nb_batch_max * 100 + .5)

        if(pc_done >= pc_max[1]) then
            print(".:. Batch "..t.." to "..batch_to.." on "..trainSet:size().." images")
            pc_max[1] = pc_max[1] + 5
        end

        local inputs = {}
        local targets = {}
        for i = t, math.min(t+opt.batch_size-1, trainSet:size()) do
            local input, target = trainSet:get(shuffle[i])
            if opt.type == 'cuda' then
                input = input:cuda()
            end
            table.insert(inputs, input)
            table.insert(targets, target)
        end

        local feval = function(x)
            if x ~= parameters then -- optim
                parameters:copy(x)
            end
            
            model:zeroGradParameters()

            local f = 0
            for i = 1, #inputs do
                local output = model:forward(inputs[i])
                local err = criterion:forward(output, targets[i])
                f = f + err
               	local df_do = criterion:backward(output, targets[i])
                gradInput = model:backward(inputs[i], df_do)
                confusion:add(output, targets[i]:squeeze())
            end

            gradParameters:div(#inputs)
            f = f / #inputs

            collectgarbage()

            return f, gradParameters -- f and df/dX
        end

       
        _,_,_,state = optimfunc.method(feval, parameters, optimfunc.config, optimfunc.state)


        if pc_done > pc_max[2] then
            s = time['train']:time().real / batch_to * (trainSet:size() - batch_to)
            print(": "..pc_done.."% done",
                string.format("%.2d:%.2d:%.2d", s/(60*60), s/60%60, s%60).." left")
            pc_max[2] = pc_max[2] + 5
            collectgarbage()
        end

        nb_batch = nb_batch + 1
    end

    --[[ time taken ]]
    print(".:. End of Epoch n° "..epoch)
    s = time['train']:time().real / nb_batch_max
    print(": Real time to learn 1 batch = "
        ..string.format("%.2d:%.2d:%.2d", s/(60*60), s/60%60, s%60))
    s = time['train']:time().real
    print(": Real time to learn full batch = "
        ..string.format("%.2d:%.2d:%.2d", s/(60*60), s/60%60, s%60))

    --[[ confusion ]]
    -- print(confusion)
    confusion:updateValids()
    print("# Confusion Matrix")
    print(": average row correct: "..(confusion.averageValid*100).."%")
    print(": average rowUcol correct (VOC measure): "..(confusion.averageUnionValid*100).."%")
    print(": > global correct: "..(confusion.totalValid*100).."%")
    --[[ trainLogger ]]
    if opt.save == 'true' then
        trainLogger:add{['% mean class accuracy (train set)'] = confusion.totalValid * 100}
    end
    confusion:zero()

    --[[ plot decision region ]]
    if  opt.type ~= 'cuda' and opt.data_type ~= 'Recipe101' and epoch % opt.plot_every == 0 then
        Ploter.decision_region(model, trainSet:getData(), class, 'epoch_'..epoch..'.png')
    end

end

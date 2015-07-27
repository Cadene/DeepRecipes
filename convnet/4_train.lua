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
        -- xlua.progress(t-1, trainSet:size())
        local batch_to = t+opt.batch_size-1
        if batch_to > trainSet:size() then
            batch_to = trainSet:size()
        end

        local pc_done = math.floor(nb_batch / nb_batch_max * 100 + .5)

        if(pc_done >= pc_max[1]) then
            print(".:. Batch "..t.." to "..batch_to.." on "..trainSet:size().." images")
            pc_max[1] = pc_max[1] + 5
        end

	    -- time['inputs'] = torch.Timer()
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
	    -- print("# Time to load inputs = "..(time['inputs']:time().real/opt.batch_size).." sec")

        local feval = function(x)
            if x ~= parameters then -- optim
                parameters:copy(x)
            end
            
            model:zeroGradParameters()

            -- time['model_f'] = torch.Timer()
            -- time['criterion_f'] = torch.Timer()
            -- time['criterion_b'] = torch.Timer()
            -- time['model_b'] = torch.Timer()
            -- time['confusion_add'] = torch.Timer()

            local f = 0
            for i = 1, #inputs do
                --time['model_f']:resume()
                local output = model:forward(inputs[i])
                --time['model_f']:stop()
                --time['criterion_f']:resume()
                local err = criterion:forward(output, targets[i])
                --time['criterion_f']:stop()
                f = f + err
                --time['criterion_b']:resume()
               	local df_do = criterion:backward(output, targets[i])
                --time['criterion_b']:stop()
                --time['model_b']:resume()
                gradInput = model:backward(inputs[i], df_do)
                --time['model_b']:stop()
                --time['confusion_add']:resume()
                confusion:add(output, targets[i]:squeeze())
                --time['confusion_add']:stop()
            end

            -- print("# Time to model_f = "..(time['model_f']:time().real/#inputs).." sec")
            -- print("# Time to criterion_f = "..(time['criterion_f']:time().real/#inputs).." sec")
            -- print("# Time to criterion_b = "..(time['criterion_b']:time().real/#inputs).." sec")
            -- print("# Time to model_b = "..(time['model_b']:time().real/#inputs).." sec")
            -- print("# Time to confusion_add = "..(time['confusion_add']:time().real/#inputs).." sec")

            -- time['gradParam_div'] = torch.Timer()
            gradParameters:div(#inputs)
            f = f / #inputs
            -- print("# Time to gradParam_div = "..(time['gradParam_div']:time().real).." sec")

            -- training curve
            -- if _log['err'][epoch] then
            --     _log['err'][epoch] = _log['err'][epoch] + f
            -- else
            --     _log['err'][epoch] = f
            -- end

            --print('loss total: ', f)
            --print('sum gradParameters: ', torch.sum(gradParameters))
            --print('sum gradInput: ', torch.sum(gradInput))

            collectgarbage()

            return f, gradParameters -- f and df/dX
        end

        if optimfunc.method == optim.asgd then
            _,_,average = optimMethod(feval, parameters, optimfunc.config, optimfunc.state)
        else
            _,_,_,state = optimfunc.method(feval, parameters, optimfunc.config, optimfunc.state)
            optimfunc.state = state
            
        end

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
    confusion:zero()

    --[[ trainLogger ]]
    trainLogger:add{['% mean class accuracy (train set)'] = confusion.totalValid * 100}
    
    --print("# Time to print confusion and log = "..(time['confusion']:time().real).." sec")

    --[[ plot decision region ]]
    if  opt.type ~= 'cuda' and opt.data_type ~= 'Recipe101' and epoch % opt.plot_every == 0 then
        Ploter.decision_region(model, trainSet:getData(), class, 'epoch_'..epoch..'.png')
    end

end

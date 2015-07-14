
local time = {}

table_f = {}

function train()
    epoch = epoch or 1
    time['train'] = torch.Timer()
    model:training()
    shuffle = torch.randperm(trainSet:size())

    print('# Epoch n° '..epoch)

    for t = 1, trainSet:size(), opt.batch_size do
        time['batch'] = torch.Timer()
        -- xlua.progress(t-1, trainSet:size())
        local batch_to = t+opt.batch_size-1
        if batch_to > trainSet:size() then
            batch_to = trainSet:size()
        end
        print("# Batch "..t.." to "..batch_to.." on "..trainSet:size().." images")
        
	    time['inputs'] = torch.Timer()
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
	    print("# Time to load inputs = "..(time['inputs']:time().real/opt.batch_size).." sec")

        local feval = function(x)
            if x ~= parameters then -- optim
                parameters:copy(x)
            end
            
            model:zeroGradParameters()

            time['model_f'] = torch.Timer()
            time['criterion_f'] = torch.Timer()
            time['criterion_b'] = torch.Timer()
            time['model_b'] = torch.Timer()
            time['confusion_add'] = torch.Timer()

            local f = 0
            for i = 1, #inputs do
                time['model_f']:resume()
                local output = model:forward(inputs[i])
                time['model_f']:stop()
                time['criterion_f']:resume()
                local err = criterion:forward(output, targets[i])
                time['criterion_f']:stop()
                f = f + err
                time['criterion_b']:resume()
               	local df_do = criterion:backward(output, targets[i])
                time['criterion_b']:stop()
                time['model_b']:resume()
                gradInput = model:backward(inputs[i], df_do)
                time['model_b']:stop()
                time['confusion_add']:resume()
                confusion:add(output, targets[i]:squeeze())
                time['confusion_add']:stop()
            end

            print("# Time to model_f = "..(time['model_f']:time().real/#inputs).." sec")
            print("# Time to criterion_f = "..(time['criterion_f']:time().real/#inputs).." sec")
            print("# Time to criterion_b = "..(time['criterion_b']:time().real/#inputs).." sec")
            print("# Time to model_b = "..(time['model_b']:time().real/#inputs).." sec")
            print("# Time to confusion_add = "..(time['confusion_add']:time().real/#inputs).." sec")

            time['gradParam_div'] = torch.Timer()
            gradParameters:div(#inputs)
            f = f / #inputs
            print("# Time to gradParam_div = "..(time['gradParam_div']:time().real).." sec")

            -- training curve
            -- if _log['err'][epoch] then
            --     _log['err'][epoch] = _log['err'][epoch] + f
            -- else
            --     _log['err'][epoch] = f
            -- end

            --print('loss total: ', f)
            --print('sum gradParameters: ', torch.sum(gradParameters))
            --print('sum gradInput: ', torch.sum(gradInput))

            return f, gradParameters -- f and df/dX
        end

        if optimMethod == optim.asgd then
            _,_,average = optimMethod(feval, parameters, optimState)
        else
            optimMethod(feval, parameters, optimState)
        end

        print("# Time to learn "..opt.batch_size.." samples = "..(time['batch']:time().real).." sec = "..(time['batch']:time().user).." user = "..(time['batch']:time().sys).." sys")
        print("# Time left to train the all dataset "..(time['batch']:time().real*trainSet:size()/opt.batch_size).." sec")
    end

    -- time taken
    print("# Time to learn 1 sample = "..(time['train']:time().real/trainSet:size()).." sec")

    -- print confusion matrix
    time['confusion'] = torch.Timer()
    print(confusion)
    trainLogger:add{['% mean class accuracy (train set)'] = confusion.totalValid * 100}
    confusion:zero()
    print("# Time to print confusion and log = "..(time['confusion']:time().real).." sec")

    -- plot decision region
    if  opt.type ~= 'cuda' and opt.data_type ~= 'Recipe101' and epoch % opt.plot_every == 0 then
        Ploter.decision_region(model, trainSet:getData(), class, 'epoch_'..epoch..'.png')
    end

    -- save/log current net
    if epoch % opt.save_every == 0 then
        time['save_every'] = torch.Timer()
        local filename = paths.concat(opt.path2save, 'cade.net')
        print('# Saving model to '..filename)
        os.execute('mkdir -p ' .. sys.dirname(filename))
        torch.save(filename, model)
        print("# Time to save model = "..(time['save_every']:time().real).." sec")
    end

    epoch = epoch + 1
end

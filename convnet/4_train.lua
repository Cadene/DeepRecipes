
table_f = {}

function train()
    epoch = epoch or 1
    local time = sys.clock()
    model:training()
    shuffle = torch.randperm(trainSet:size())

    print('\nepoch n'..epoch)
    for t = 1, trainSet:size(), opt.batch_size do
        xlua.progress(t+opt.batch_size-1, trainSet:size())

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
            if x ~= parameters then -- ?
                parameters:copy(x)
            end
            
            gradParameters:zero()

            local f = 0
            for i = 1, #inputs do
                local output = model:forward(inputs[i])
                -- print('\n', output, targets, '\n')
                local err = criterion:forward(output, targets[i])
                f = f + err
		print('1] ',gradParameters[1])
                local df_do = criterion:backward(output, targets[i])
                model:backward(inputs[i], df_do)
                print('2] ',gradParameters[1])
		confusion:add(output, targets[i]:squeeze())
		print('3] ',gradParameters[1])
            end

            gradParameters:div(#inputs)
            f = f / #inputs

            -- training curve
            if _log['err'][epoch] then
                _log['err'][epoch] = _log['err'][epoch] + f
            else
                _log['err'][epoch] = f
            end

	    print(f)
            print('4] ',gradParameters[1])

            return f, gradParameters -- f and df/dX
        end

        if optimMethod == optim.asgd then
            _,_,average = optimMethod(feval, parameters, optimState)
        else
            optimMethod(feval, parameters, optimState)
        end
    end

    -- time taken
    time = sys.clock() - time
    time = time / trainSet:size()
    print("\ntime to learn 1 sample = "..(time*1000).."ms")

    -- print confusion matrix
    print(confusion)
    trainLogger:add{['% mean class accuracy (train set)'] = confusion.totalValid * 100}
    confusion:zero()

    -- plot decision region
    if  opt.type ~= 'cuda'
        and opt.data_type ~= 'Recipe101'
        and epoch % opt.plot_every == 0
    then
        Ploter.decision_region(model, trainSet:getData(), class, 'epoch_'..epoch..'.png')
    end

    -- save/log current net
    if epoch % opt.save_every == 0 then
        local filename = paths.concat(opt.path2save, 'cade.net')
        os.execute('mkdir -p ' .. sys.dirname(filename))
        print('<trainer> saving network to '..filename)
        torch.save(filename, model)
    end

    epoch = epoch + 1
end

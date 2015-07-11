local time = {}

table_f = {}

function train()
    epoch = epoch or 1
    time['train'] = sys.clock()
    model:training()
    shuffle = torch.randperm(trainSet:size())

    print('\nepoch n'..epoch)
    for t = 1, trainSet:size(), opt.batch_size do
        -- xlua.progress(t+opt.batch_size-1, trainSet:size())
        print("batch: "..(t+opt.batch_size-1).." / "..trainSet:size())
	time['inputs'] = sys.clock()
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
	time['inputs'] = sys.clock() - time['inputs']

        local feval = function(x)
            if x ~= parameters then -- optim
                parameters:copy(x)
            end
            
            model:zeroGradParameters()

            local f = 0
            for i = 1, #inputs do
		local time_m_f = sys.clock()
                local output = model:forward(inputs[i])
                local err = criterion:forward(output, targets[i])
                f = f + err
               	local df_do = criterion:backward(output, targets[i])
                gradInput = model:backward(inputs[i], df_do)
                -- confusion:add(output, targets[i]:squeeze())
            end

            gradParameters:div(#inputs)
            f = f / #inputs

            -- training curve
            if _log['err'][epoch] then
                _log['err'][epoch] = _log['err'][epoch] + f
            else
                _log['err'][epoch] = f
            end

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
    end

    -- time taken
    time['train'] = sys.clock() - time['train']
    time['train'] = time['train'] / trainSet:size()
    print("time to learn 1 sample = "..(time['train']*1000).."ms")

    -- print confusion matrix
    -- print(confusion)
    -- trainLogger:add{['% mean class accuracy (train set)'] = confusion.totalValid * 100}
    -- confusion:zero()

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

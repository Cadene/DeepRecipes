local time = {}

function test(epoch)

    print('')
    print('#####################')
    print('# Test n° '..epoch)

    time['test'] = torch.Timer()

    model:evaluate()

    local time_mean = {}

    for t = 1, testSet:size() do

        local input, target = testSet:get(t)
        if opt.type == 'double' then input = input:double()
        elseif opt.type == 'cuda' then input = input:cuda() end

        --[[ test sample ]]
        local pred = model:forward(input)
        confusion:add(pred, target:squeeze())

        table.insert(time_mean, time['test']:time().real)

        local pc_done = math.floor(t / testSet:size() * 100 + .5)

        if(pc_done % 10 == 0) then
            -- print(time_mean)
            local mean = 0
            for i = 1, #time_mean do
                mean = mean + time_mean[i]
            end
            mean = mean / #time_mean
            s = mean * (testSet:size() - t)
            print(": ", pc_done, "% done ", "\t", string.format("%.2d:%.2d:%.2d", s/(60*60), s/60%60, s%60), " left")
        end

        if t % 50 == 0 then
            collectgarbage()
        end
    end

    --[[ time taken ]]
    s = time['test']:time().real/testSet:size()
    print(": Time to test 1 sample = "
        ..string.format("%.2d:%.2d:%.2d", s/(60*60), s/60%60, s%60))
    s = time['test']:time().real
    print(": Time to test all samples = "
        ..string.format("%.2d:%.2d:%.2d", s/(60*60), s/60%60, s%60))


    --[[ confusion & log ]]
    print(confusion)
    testLogger:add{['% mean class accuracy (test set)'] = confusion.totalValid * 100}
    if opt.plot == 'true' then
        testLogger:style{['% mean class accuracy (test set)'] = '-'}
        testLogger:plot()
    end
    confusion:zero()

end
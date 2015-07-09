function test()
    local time = sys.clock()
    model:evaluate()

    for t = 1, testSet:size() do
        xlua.progress(t, testSet:size())

        local input, target = testSet:get(t)
        if opt.type == 'double' then input = input:double()
        elseif opt.type == 'cuda' then input = input:cuda() end

        -- test sample
        local pred = model:forward(input)
        confusion:add(pred, target:squeeze())
    end

    time = sys.clock() - time
    time = time / testSet:size()
    print("\n==> time to test 1 sample = " .. (time*1000) .. 'ms')

    print(confusion)

    testLogger:add{['% mean class accuracy (test set)'] = confusion.totalValid * 100}
    if opt.plot then
        testLogger:style{['% mean class accuracy (test set)'] = '-'}
        testLogger:plot()
    end

    confusion:zero()
end
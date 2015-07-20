local time = {}

function test(epoch)

    print('')
    print('#####################')
    print('# Test n° '..epoch)

    time['test'] = torch.Timer()

    model:evaluate()

    for t = 1, testSet:size() do

        -- xlua.progress(t, testSet:size())

        local input, target = testSet:get(t)
        if opt.type == 'double' then input = input:double()
        elseif opt.type == 'cuda' then input = input:cuda() end

        --[[ test sample ]]
        local pred = model:forward(input)
        confusion:add(pred, target:squeeze())
    end

    --[[ time taken ]]
    s = time['test']:time().real/testSet:size()
    print("# Time to test 1 sample = "
        ..string.format("%.2d:%.2d:%.2d", s/(60*60), s/60%60, s%60))
    s = time['test']:time().real
    print("# Time to test all samples = "
        ..string.format("%.2d:%.2d:%.2d", s/(60*60), s/60%60, s%60))


    --[[ confusion & log ]]
    print(confusion)
    testLogger:add{['% mean class accuracy (test set)'] = confusion.totalValid * 100}
    if opt.plot then
        testLogger:style{['% mean class accuracy (test set)'] = '-'}
        testLogger:plot()
    end
    confusion:zero()

end
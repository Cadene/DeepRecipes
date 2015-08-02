local time = {}

function test(epoch)

    print("\n# ... test model")
    model:evaluate()

    time['test'] = torch.Timer()

    local pc_max = 0

    for t = 1, testSet:size() do

        local input, target = testSet:get(t)
        if opt.type == 'double' then input = input:double()
        elseif opt.type == 'cuda' then input = input:cuda() end

        --[[ test sample ]]
        local pred = model:forward(input)
        confusion:add(pred, target:squeeze())

        local pc_done = math.floor(t / testSet:size() * 100 + .5)
        if pc_done >= pc_max then
            -- print(time_mean)
            s = time['test']:time().real / t * (testSet:size() - t)
            print(": "..pc_done.."% done ",
                string.format("%.2d:%.2d:%.2d", s/(60*60), s/60%60, s%60).." left")
            pc_max = pc_max + 5
            collectgarbage()
        end

    end

    --[[ time taken ]]
    s = time['test']:time().real
    print(": Time to test all samples = "
        ..string.format("%.2d:%.2d:%.2d", s/(60*60), s/60%60, s%60))


    --[[ confusion ]]
    --print(confusion)
    confusion:updateValids()
    print("# Confusion Matrix")
    print(": average row correct: "..(confusion.averageValid*100).."%")
    print(": average rowUcol correct (VOC measure): "..(confusion.averageUnionValid*100).."%")
    print(": > global correct: "..(confusion.totalValid*100).."%")
    --[[ trainLogger ]]
    if opt.save == 'true' then
        testLogger:add{['% mean class accuracy (test set)'] = confusion.totalValid * 100}
    end
    confusion:zero()
    
    if opt.plot == 'true' then
        testLogger:style{['% mean class accuracy (test set)'] = '-'}
        testLogger:plot()
    end
    

end

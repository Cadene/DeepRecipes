require 'torch'

local Dataset = torch.class('Dataset')

function Dataset:__init(X, y)
    self.X = X
    self.y = y
    self:shuffle()
end

function Dataset:get_index(id)
   if self.shuf then
        return self.shuf[id]
    else
        return id
    end 
end

function Dataset:get(id)
    local Xi, yi
    local index = self:get_index(id)
    Xi = self.X[index]
    yi = self.y[{ {index} }]
    return Xi, yi
end

function Dataset:get_batch(index_batch, opt)
    if opt['4d_tensor'] then
        return self:get_batch_4D(index_batch, opt)
    else
        return self:get_batch_3D(index_batch, opt)
    end
end

function Dataset:get_batch_3D(index_batch, opt)
    local inputs  = {}
    local targets = {}
    for i = index_batch, math.min(index_batch+opt.batch_size-1, self:size()) do
        local input, target = self:get(i)
        if opt.cuda then
            input  = input:cuda()
            target = target:cuda()
        end
        table.insert(inputs, input)
        table.insert(targets, target)
    end
    return inputs, targets
end

function Dataset:get_batch_4D(index_batch, opt)
    local batch_size = math.min(opt.batch_size, self:size() - index_batch + 1)
    local inputs  = torch.Tensor(batch_size, 3, 221, 221)
    local targets = torch.Tensor(batch_size)
    local i_batch = 1
    local t000 = torch.Timer()
    for i = index_batch, math.min(index_batch+opt.batch_size-1, self:size()) do
        local input, target = self:get(i)
        -- print(input:size(), target:size())
        inputs[i_batch]  = input
        targets[i_batch] = target
        i_batch = i_batch + 1
    end
    print('t000 '.. t000:time().real .. ' seconds')
    if opt.cuda then
        local t001 = torch.Timer()
        inputs  = inputs:cuda()
        targets = targets:cuda()
        print('t001 '.. t001:time().real .. ' seconds')
    end
    -- print(inputs:size(), targets:size())
    return inputs, targets
end

function Dataset:size()
    return self.X:size(1)
end

function Dataset:size_X()
    return self.X:size()
end

function Dataset:get_data()
    return self.X
end

function Dataset:get_label()
    return self.y
end

function Dataset:shuffle()
    self.shuf = torch.randperm(self:size())
end

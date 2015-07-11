require 'torch'

local Dataset = torch.class('Dataset')

function Dataset:__init(X, y)
    self.X = X
    self.y = y
end

function Dataset:get(index)
    return self.X[index], self.y[{ {index} }]
end

function Dataset:size()
    return self.X:size(1)
end

function Dataset:getData()
    return self.X
end

function Dataset:getLabel()
    return self.y
end
require 'torch'

local Dataset = torch.class('Dataset')

function Dataset:__init(X, y)
    self.X = X
    self.y = y
    self.shuf = nil
end

function Dataset:get(index)
    local Xi, yi
    if self.shuf then
        Xi = self.X[self.shuf[index]]
        yi = self.y[{ {self.shuf[index]} }]
    else
        Xi = self.X[index]
        yi = self.y[{ {index} }]
    end
    return Xi, yi
end

function Dataset:size()
    return self.X:size(1)
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

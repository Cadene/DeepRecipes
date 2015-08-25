require 'torch'

local Queue = torch.class('Queue')

function Queue:__init(t)
    self.q = {first = 0, last = -1}
    if t then
        self:init_queue(t)
    end
end

function Queue:init_queue(t)
    for i = 1, #t do
        self:pushleft(t[i])
    end
end

function Queue:pushleft(value)
    local first = self.q.first - 1
    self.q.first = first
    self.q[first] = value
end

function Queue:popright() 
    local last = self.q.last
    if self.q.first > last then error("queue is empty") end
    local value = self.q[last]
    self.q[last] = nil         -- to allow garbage collection
    self.q.last = last - 1
    return value
end

function Queue:__len()
    local size = 0
    for k, v in pairs(self.q) do
        size = size + 1
    end
    return size - 2
end

function Queue:__tostring()
    local str = '{\n'
    for k, v in pairs(self.q) do
        str = str .. '  ' .. k .. ': ' .. v .. '\n'
    end
    return str .. '}'
end
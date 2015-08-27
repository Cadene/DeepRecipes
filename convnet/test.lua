local t0 = torch.Timer()
require 'cutorch'
print('t0 '.. t0:time().real .. ' seconds')

a = torch.FloatTensor(60)

local t1 = torch.Timer()
a:cuda()
print('t1 '.. t1:time().real .. ' seconds')

local t2 = torch.Timer()
a:float()
print('t2 '.. t2:time().real .. ' seconds')
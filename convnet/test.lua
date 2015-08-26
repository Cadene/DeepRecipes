require 'src/ModelFactory'

model = ModelFactory.generate_overfeat({}, 101)

parameters, _ = model.m:getParameters()

print(model.m)

print(parameters:size())

lr_classif = 5e-2
lr_convo = lr_classif / 10

lrs = torch.Tensor(parameters:size())

for i = 1, 123778176 do
    lrs[i] = lr_convo
end
for i = 123778177, 140973285 do
    lrs[i] = lr_classif
end


-- convolutions   123,778,176
-- classification 17,195,109
-- total          140,973,285

-- a = torch.Tensor(144000000)
-- for i=1, a:size(1)/2 do
--   a[i] = 1
-- end
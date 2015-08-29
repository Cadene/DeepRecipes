require 'src/ModelFactory'

model = ModelFactory.generate_overfeat({}, 101)

parameters, gradParameters = model.m:getParameters()

print(parameters:size())

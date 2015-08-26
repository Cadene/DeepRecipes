require 'torch'

local Database = torch.class('Database')

function Database:__init(trainset, testset, classname)
    self.trainset  = trainset
    self.testset   = testset
    self.classname = classname
end

function Database:get_trainset()
    return self.trainset
end 

function Database:get_testset()
    return self.testset
end 

function Database:get_classname()
    return self.classname
end 

function Database:nb_class()
    return #self:get_classname()
end

function Database:__tostring__()
    return '\nDatabase :\n'
        ..self:nb_class()..' classes'
end


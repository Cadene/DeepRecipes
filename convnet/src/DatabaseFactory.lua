require 'torch'
require 'src/Database'
require 'src/DatasetFactory'
require 'src/ImgLoader'

local DatabaseFactory = torch.class('DatabaseFactory')

function DatabaseFactory.generate(opt)
    --[[
        :Arg: opt.type_data
        :Opt: opt.N
        :Opt: opt.D
        :Opt: opt.K
    ]]
    local database
    local type_data = opt.type_data:lower()
    local method_name = 'generate_'..type_data

    if type_data == 'spiral' or type_data == 'gauss' then
        local classname = {}
        for i = 1, opt.K do
            classname[i] = tostring(i)
        end
        local N_train = opt.N * opt.pc_train
        local N_test  = opt.N * (1 - opt.pc_train)
        trainset = DatasetFactory.generate(opt, N_train, opt.D, opt.K)
        testset  = DatasetFactory.generate(opt, N_test,  opt.D, opt.K)
        database = Database(trainset, testset, classname)

    elseif type_data == 'recipe101' then
        database = DatabaseFactory[method_name](opt)

    else
        error(opt.type_data..' is not a valid type')
    end
    print(database)
    return database
end

function DatabaseFactory.generate_recipe101(opt)
    --[[
        :Arg: opt.path2load_data
        :Arg: opt.pc_train
    ]]
    loader = ImgLoader(opt.path2load_data)
    loader:load()
    classname = loader:make_classname()
    trainset, testset = loader:make_train_test(opt.pc_train)
    return Database(trainset, testset, classname)
end




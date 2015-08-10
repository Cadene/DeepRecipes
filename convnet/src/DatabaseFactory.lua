require 'torch'
require 'src/Database'
require 'src/DatasetFactory'

local DatabaseFactory = torch.class('DatabaseFactory')

function DatabaseFactory.generate(opt)
    --[[
        :Arg: opt.data_type
        :Opt: opt.N
        :Opt: opt.D
        :Opt: opt.K
    ]]
    local data_type = opt.data_type:lower()
    local method_name = 'generate_'..data_type

    if data_type == 'spiral' or data_type == 'gauss' then
        local classname = {}
        for i = 1, opt.K do
            classname[i] = tostring(i)
        end
        local N_train = opt.N * opt.pc_train
        local N_test  = opt.N * (1 - opt.pc_train)
        trainset = DatasetFactory.generate(opt, N_train, opt.D, opt.K)
        testset  = DatasetFactory.generate(opt, N_test,  opt.D, opt.K)
        return Database(trainset, testset, classname)

    elseif data_type == 'recipe101' then
        return DatasetFactory[method_name](opt)

    else
        error(opt.data_type..' is not a valid type')
        return nil
    end
end

function DatabaseFactory.generate_recipe101(opt)
    --[[
        :Arg: opt.path2dir
        :Arg: opt.pc_train
    ]]
    require 'ImgLoader'
    loader = ImgLoader()
    loader:load(opt.path2dir)
    classname = loader:make_classname()
    trainset, testset = loader:make_train_test(opt.pc_train)
    return Dataset(trainset, testset, classname)
end




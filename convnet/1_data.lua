
class_str = {}

if opt.data_type == 'Spiral' or opt.data_type == 'Gauss' then
    require 'DatasetBuilder'
    class = {}
    class_str = {}
    for i = 1, opt.K do
        class[i] = i
        class_str[i] = tostring(i)
    end

    N_train = opt.N * opt.pc_train
    N_test  = opt.N * (1 - opt.pc_train)

    trainSet = DatasetBuilder.generate(opt.data_type, N_train, opt.D, opt.K)
    testSet  = DatasetBuilder.generate(opt.data_type, N_test,  opt.D, opt.K)

elseif opt.data_type == 'Recipe101' then
    require 'ImgLoader'
    loader = ImgLoader(opt.path2dir, opt.path2save)
    loader:load()
    class_str = loader:class_str()
    trainSet, testSet = loader:make_train_test(opt.pc_train)

else
    error(opt.data_type..' is not a valid type')
end 
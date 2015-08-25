require 'src/DatabaseFactory'
require 'image'

opt = {}
--opt.path2load_data = '/Users/remicadene/data/recipe_101_low/'
opt.path2load_data = '/Users/remicadene/Dropbox/_Docs/UPMC/LIP6/Torch/DeepRecipes/data/test/'
opt.pc_train = 0.8

database = DatabaseFactory.generate_recipe101_augmented(opt)
trainset = database:get_trainset()

print(trainset:size())
print(trainset.path2img)
print(trainset.label)


mean, std = trainset:process_mean_std()
print(mean[{1,1,1}])
image.save('mean.jpg', mean)


-- mean:mul(255)
-- print(trainset:size())
-- print(mean:size())
-- print(mean[{1,1,1}])
-- print(std:size())
-- print(std[{1,1,1}])


-- for i = 1, trainset:size() do
--     img, label = trainset:get(i)
-- end


-- itorch.image(img)
-- img2 = img:clone()
-- img2:cmul(mean)
-- img2:cdiv(std)


require 'torch'

require 'ImgLoader'
require 'ImgDataset'

loader = ImgLoader.new('/home/cadene/data/recipe_101/','/home/cadene/data/recipe_101_clean_224/')
loader:loadCsv('/home/cadene/doc/DeepRecipes/convnet/save/success.log')

loader:process(ImgDataset.__prepare_img, 224)
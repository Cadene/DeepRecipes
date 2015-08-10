require 'torch'

require 'src/ImgLoader'
require 'src/ImgDataset'

loader = ImgLoader.new('/home/cadene/data/recipe_101/recipe_101/','/home/cadene/data/recipe_101_clean_224/')
loader:loadCsv('/home/cadene/data/recipe_101/success.log')

loader:process(ImgDataset.__prepare_img, 224)

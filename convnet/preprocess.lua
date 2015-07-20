require 'torch'

require 'ImgLoader'
require 'ImgDataset'

--[[ create success.log ]]

loader = ImgLoader.new('/home/cadene/data/recipe_101/recipe_101/',
					   '/home/cadene/data/recipe_101/recipe_101_clean/',
                       '/home/cadene/data/recipe_101/')
loader:load()

loader:preprocess()

--[[ process ]]

loader = ImgLoader.new('/home/cadene/data/recipe_101/recipe_101_clean/',
                        '/home/cadene/data/recipe_101/recipe_101_clean_224/')

loader:loadCsv('/home/cadene/data/recipe_101/success.log')

loader:process(ImgDataset.__prepare_img, 224)
require 'torch'

require 'ImgLoader'

loader = ImgLoader.new('/local/cadene/recipe_101/recipe_101/',
					   '/local/cadene/recipe_101/recipe_101_clean/')
loader:load()

loader:preprocess()
--loader.path2img = {}
--loader.path2img['apple_pie'] = {}
--loader.path2img['apple_pie'][1] = 'apple_pie_390.jpg'

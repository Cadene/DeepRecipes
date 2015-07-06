require 'torch'
require 'ImgDataset'

local ImgLoader = torch.class('ImgLoader')

function ImgLoader:__init(path2dir, path2esc)
    self.path2dir = path2dir or '../data/recipe_101/'
    self.path2esc = path2esc or {'.', '..', '.DS_Store'}
    self.classes = {}
    self.path2img = {}
end

function ImgLoader:load()
    for _, dir_class in pairs(paths.dir(self.path2dir)) do
        if not ImgLoader.__is_in(dir_class, self.path2esc) then
            self.path2img[dir_class] = {}
            for _, path_img in pairs(paths.dir(self.path2dir..dir_class)) do
                if not ImgLoader.__is_in(path_img, self.path2esc) then
                   table.insert(self.path2img[dir_class], self.path2dir..dir_class..'/'..path_img)
                end
            end
        end
    end
end

function ImgLoader:make_train_test(pc_train)
    local trainSet = ImgDataset()
    local testSet = ImgDataset()
    local label = 1
    for class, path2img in pairs(self.path2img) do
        trainSet.class_label[class] = label
        trainSet.class_label[label] = class
        testSet.class_label[class] = label
        testSet.class_label[label] = class
        shuffle = torch.randperm(#self.path2img[class])
        limit = #self.path2img[class] * pc_train 
        for i = 1, #self.path2img[class] do
            if i < limit then
                set = trainSet
            else
                set = testSet
            end
            table.insert(set.path2img, path2img[shuffle[i]])
            table.insert(set.label, label)
        end
        label = label + 1
    end
    return trainSet, testSet
end

function ImgLoader.__is_in(string, path2esc)
    for k, name in pairs(path2esc) do
        if string == name then
            return true
        end
    end
    return false
end


loader = ImgLoader.new('../data/recipe_101/')
loader:load()
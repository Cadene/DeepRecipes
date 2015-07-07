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
    --[ Load all the images ]--
    for _, dir_class in pairs(paths.dir(self.path2dir)) do
        if not ImgLoader.__is_in(dir_class, self.path2esc) then
            self.path2img[dir_class] = {}
            for _, path_img in pairs(paths.dir(self.path2dir..dir_class)) do
                if not ImgLoader.__is_in(path_img, self.path2esc) then
                   table.insert(self.path2img[dir_class], dir_class..'/'..path_img)
                end
            end
        end
    end
end

function ImgLoader:make_train_test(pc_train)
    --[ Once prepreoccesed, build the train and test sets]
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

function ImgLoader:preproccess()
    --[ Once loaded, convert or remove the images ]--
    local img
    status, err = pcall(function ()
        img = ImgLoader.__prepare_img(self.path2dir..self.path2img[index])
        if img:size(1) ~= 3 then
            error('e101: invalid image [path='..self.path2dir..self.path2img[index]..']')
        end
    end)
    if status then
        return self.label[index], img
    else
        print(err)
        return false
    end
end

function ImgLoader.__prepare_img(path2img, dim)
    dim = dim or 221
    local img_dim
    local img_raw = image.load(path2img):mul(255) -- [0,1] -> [0,255]img
    local rh = img_raw:size(2)
    local rw = img_raw:size(3)
    if rh < rw then
       rw = math.floor(rw / rh * dim)
       rh = dim
    else
       rh = math.floor(rh / rw * dim)
       rw = dim
    end
    local img_scale = image.scale(img_raw, rw, rh)
    local offsetx = 1
    local offsety = 1
    if rh < rw then
        offsetx = offsetx + math.floor((rw-dim)/2)
    else
        offsety = offsety + math.floor((rh-dim)/2)
    end
    img = img_scale[{{},{offsety,offsety+dim-1},{offsetx,offsetx+dim-1}}]:floor()
    img:add(-118.380948):div(61.896913) -- fixed distn ~ N(118.380948, 61.896913^2) [0,255] -> [0,1]
    return img
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
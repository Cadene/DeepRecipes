require 'torch'
require 'src/Queue'
require 'src/Tools'
require 'src/ImgDataset'

local ImgAugmentedDataset = torch.class('ImgAugmentedDataset', 'ImgDataset')

function ImgAugmentedDataset:__init(path2dir, path2img, label, class_label, label_class, dim_in, dim_out, transform_queue)
    ImgDataset:__init(path2dir, path2img, label, class_label, label_class, dim_in, dim_out) 
    if transform_queue then
        self.transform_queue = transform_queue
    else
        self.transform_queue = {}
        self:init_transform_queue()
        -- print(self.transform_queue)
    end
    self.augmented_size = #self.transform_queue[1] -- facteur d'augmentation
end

function ImgAugmentedDataset:get_augmented_size()
    return self.augmented_size
end

function ImgAugmentedDataset:get_index(id)
    local normal_size = self:normal_size()
    if id % normal_size == 0 then
        id = normal_size
    else 
        id = id % normal_size
    end
    if self.shuf then
        id = self.shuf[id]
    end
    return id
end

function ImgAugmentedDataset:get(id)
    if id % 50 == 0 then
        collectgarbage()
    end
    prepare = prepare or true
    local img
    local index = self:get_index(id)
    status, err = pcall(function ()
        local class_name = self.label_class[self.label[index]]
        local path2img = self.path2dir..class_name..'/'..self.path2img[index]
        if self.prepare then
            local tr_queue = self.transform_queue[index]
            local tr_id = tr_queue:popright()
            tr_queue:pushleft(tr_id)
            local crop_type, flip
            if tr_id > 5 then
                flip = true
                crop_type = tr_id - 5
            else
                flip = false
                crop_type = tr_id
            end
            img = ImgDataset.__prepare_img(path2img, self.dim_in, self.dim_out, crop_type, flip)
        else
            img = image.load(path2img)
        end
        if img:size(1) ~= 3 then
            error('e101: invalid image [path='..path2img..']')
        end
    end)
    if status then
        return img, self.label[{ {index} }]
    else
        print(err)
        return false
    end
end

function ImgAugmentedDataset:init_transform_queue()
    local t = {1,2,3,4,5,6,7,8,9,10}
    for i = 1, self:normal_size() do
        t = Tools.copy_table(t)
        Tools.shuffle_table(t)
        self.transform_queue[i] = Queue(t)
    end
end

function ImgAugmentedDataset:size()
    return self:normal_size() * self:get_augmented_size()
end

function ImgAugmentedDataset:normal_size()
    return #self.path2img
end

function ImgAugmentedDataset:shuffle()
    self.shuf = torch.randperm(self:normal_size())
end

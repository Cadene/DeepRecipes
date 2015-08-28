require 'torch'
require 'image'
require 'src/Dataset'
require 'src/Tools'

local ImgDataset = torch.class('ImgDataset', 'Dataset')

function ImgDataset:__init(path2dir, path2img, label, class_label, label_class, dim_in, dim_out, mean, std, prepare)
    self.path2dir = path2dir or '/Users/remicadene/data/recipe_101_tiny/'
    self.path2img = path2img or {}
    self.label = label or {}
    self.label = Tools.table2tensor(self.label)
    self.class_label = class_label or {}
    self.label_class = label_class or {}
    self.dim_in  = dim_in or 221
    self.dim_out = dim_out or 221
    self.prepare = prepare or true
    self.mean = mean
    self.std = std
end

function ImgDataset:get(id)
    -- if id % 50 == 0 then
    --     collectgarbage()
    -- end
    local img
    local index = self:get_index(id)
    status, err = pcall(function ()
        local class_name = self.label_class[self.label[index]]
        local path2img = self.path2dir..class_name..'/'..self.path2img[index]
        if self.prepare then
            img = ImgDataset.__prepare_img(path2img, self.dim_in, self.dim_out, nil, nil, self.mean, self.std)
        else
            local t000 = torch.Timer()
            img = image.load(path2img)
            print('t000 '.. t000:time().real .. ' seconds')
            if img:size(1) ~= 3 then
                error('e101: invalid image [path='..path2img..']')
            end
        end
    end)
    if status then
        return img, self.label[{ {index} }]
    else
        print(err)
        return false
    end
end

function ImgDataset:size()
    return #self.path2img 
end

function ImgDataset:image_size()
    local img, label = self:get(1)
    return img:size()
end

function ImgDataset.__prepare_img(path2img, dim_in, dim_out, crop_type, flip, mean, std)
    local dim     = dim_in
    local dim_out = dim_out
    local img_dim
    local img_raw = image.load(path2img) -- [0,1] -> [0,255]img
    local rh = img_raw:size(2)
    local rw = img_raw:size(3)

    -- rescale to 3 * 256 * 256
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

    if crop_type then
        local w1, h1
        if crop_type == 1 then -- center
            w1 = math.ceil((dim - dim_out) / 2)
            h1 = math.ceil((dim - dim_out) / 2)
        elseif crop_type == 2 then -- top-left
            w1 = 1
            h1 = 1
        elseif crop_type == 3 then -- top-right
            w1 = dim - dim_out
            h1 = 1
        elseif crop_type == 4 then -- bottom-left
            w1 = 1
            h1 = dim - dim_out
        elseif crop_type == 5 then -- bottom-right
            w1 = dim - dim_out
            h1 = dim - dim_out
        else
            error('crop_type error')
        end
        img = image.crop(img, w1, h1, w1 + dim_out, h1 + dim_out)
    end
    
    if flip then
        img = image.hflip(img)
    end

    -- add mean and div std
    if mean and std then 
        img:add(mean)
        img:cdiv(std)
    end

    --img:add(-118.380948):div(61.896913) -- fixed distn ~ N(118.380948, 61.896913^2) [0,255] -> [0,1]

    return img
end

function ImgDataset:equal(img_dataset)
    -- print(#self.path2img)
    for id = 1, self:size() do
        -- print(self.path2img[id], img_dataset.path2img[id], self.path2img[id] = img_dataset.path2img[id])
        if self.path2img[id] ~= img_dataset.path2img[id] then
            return false
        end
    end
    return true
end

function ImgDataset:process_mean_std(opt)
    local img, label = self:get(1)
    local mean = img:clone():fill(0)
    local std  = img:clone():fill(0)
    for i = 1, self:size() do
        local img, label = self:get(i)
        mean:add(img)
    end
    mean = mean / self:size()
    for i = 1, self:size() do
        local img, label = self:get(i)
        local tmp = img - mean
        tmp:pow(2)
        std:add(tmp)
    end
    std = std:sqrt()
    torch.save(opt.path2save_mean, mean)
    torch.save(opt.path2save_std, std)
    self.mean = mean
    self.std  = std
    return mean, std
end

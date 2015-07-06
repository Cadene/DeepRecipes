require 'torch'
require 'image'
require 'Dataset'

local ImgDataset = torch.class('ImgDataset', 'Dataset')

function ImgDataset:__init(path2img, label, class_label, label_class)
    self.path2img = path2img or {}
    self.label = label or {}
    self.class_label = class_label or {}
    self.label_class = label_class or {}
end

function ImgDataset:get(index)
    local img
    status, err = pcall(function ()
        img = ImgLoader.__prepare_img(self.path2img[index])
        if img:size(1) ~= 3 then
            error('e101: invalid image [path='..self.path2img[index]..']')
        end
    end)
    if status then
        return self.label[index], img
    else
        print(err)
        return false
    end
end

function ImgDataset:size()
    return #self.path2img
end

function ImgDataset.__prepare_img(path2img, dim)
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
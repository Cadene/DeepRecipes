require 'torch'
require 'ImgDataset'
require 'image'
require 'string'

local ImgLoader = torch.class('ImgLoader')

function ImgLoader:__init(path2dir, path2save, path2esc)
    self.path2dir  = path2dir or '../data/recipe_101/'
    self.path2save = path2save or '../data/recipe_101_clean/' 
    self.path2esc  = path2esc or {'.', '..', '.DS_Store'}
    self.classes = {}
    self.path2img = {}
end

function ImgLoader:load()
    --[[ Load all the images ]]--
    for _, dir_class in pairs(paths.dir(self.path2dir)) do
        if not ImgLoader.__is_in(dir_class, self.path2esc) then
            self.path2img[dir_class] = {}
            for _, path_img in pairs(paths.dir(self.path2dir..dir_class)) do
                if not ImgLoader.__is_in(path_img, self.path2esc) then
                   table.insert(self.path2img[dir_class], path_img)
                end
            end
        end
    end
end

function ImgLoader:loadCsv(path2csv)
    function ParseCSVLine (line,sep) 
        local res = {}
        local pos = 1
        sep = sep or ','
        while true do 
            local c = string.sub(line,pos,pos)
            if (c == "") then break end
            if (c == '"') then
                -- quoted value (ignore separator within)
                local txt = ""
                repeat
                    local startp,endp = string.find(line,'^%b""',pos)
                    txt = txt..string.sub(line,startp+1,endp-1)
                    pos = endp + 1
                    c = string.sub(line,pos,pos) 
                    if (c == '"') then txt = txt..'"' end 
                    -- check first char AFTER quoted string, if it is another
                    -- quoted string without separator, then append it
                    -- this is the way to "escape" the quote char in a quote. example:
                    --   value1,"blub""blip""boing",value3  will result in blub"blip"boing  for the middle
                until (c ~= '"')
                table.insert(res,txt)
                assert(c == sep or c == "")
                pos = pos + 1
            else    
                -- no quotes used, just look for the first separator
                local startp,endp = string.find(line,sep,pos)
                if (startp) then 
                    table.insert(res,string.sub(line,pos,startp-1))
                    pos = endp + 1
                else
                    -- no separator found -> use rest of string and terminate
                    table.insert(res,string.sub(line,pos))
                    break
                end 
            end
        end
        return res
    end

    for line in io.lines('error.log') do
        col = ParseCSVLine(line, ';')
        class_name = col[1]
        img_name = col[2]
        if not self.path2img[class_name] then
            self.path2img[class_name] = {}
        end
        table.insert(self.path2img[class_name], img_name)
    end
end

function ImgLoader:make_train_test(pc_train)
    --[[ Once prepreoccesed, build the train and test sets ]]--
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

function ImgLoader:preprocess()
    --[[ Once loaded, convert or remove the images ]]--
    local path2img, last_img
    --os.execute('mkdir -p '..sys.dirname(self.path2save))
    
    local log_success = io.open(self.path2save..'success.log', 'w')
    local log_error   = io.open(self.path2save..'error.log', 'w')
    local log_convert   = io.open(self.path2save..'convert.log', 'w')
    
    function load_img(path2img)
		img = image.load(path2img)
		if img:size(1) ~= 3 then
			error('e101: grey image')
		end
		img = nil
	end
    
    local iter = 1
    for class_name, path2class in pairs(self.path2img) do
		for img_id, img_name in pairs(path2class) do
			path2img = self.path2dir..class_name..'/'..img_name
			::redo::
			status, err = pcall(load_img, path2img)
			
			if iter % 50 == 0 then
				collectgarbage()
			end
			
			if status then
				log_success:write(class_name..';'..img_name..'\n')
			else
				print('\n> '..class_name..' '..img_id)
				if string.find(err, "Not a JPEG file") then
					print(path2img, err)
					os.execute('convert "'..path2img..'" "'..path2img..'"')
					if not last_img or last_img ~= img_name then
						log_convert:write(class_name..';'..img_name..';Not a JPEG file\n')
						last_img = img_name
						goto redo
					else
						log_error:write(class_name..';'..img_name..';Image broken\n')
					end
				elseif string.find(err, "e101") then
					print(path2img, err)
					log_error:write(class_name..';'..img_name..';Grey image\n')
				else
					print("unusual error\n", path2img, err)
					log_error:write(class_name..';'..img_name..';'..err..'\n')
				end
				
			end
			
			iter = iter + 1
		end
	end
    log_success:close()
    log_error:close()
    log_convert:close()
end

function ImgLoader:process(func, ...)
    func = func or ImgDataset.__prepare_img
    for class_name, path2class in pairs(self.path2img) do
        for img_id, img_name in pairs(path2class) do
            path2img = self.path2dir..class_name..'/'..img_name
            img = func(path2img, ...)
            path2save = self.path2save..class_name
            os.execute('mkdir -p '..path2save)
            image.save(path2save..'/'..img_name, img)
        end
    end
end

function ImgLoader.__is_in(string, path2esc)
    for k, name in pairs(path2esc) do
        if string == name then
            return true
        end
    end
    return false
end




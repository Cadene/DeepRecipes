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

local path2img = {}
local count = 0
for line in io.lines('success.log') do
    col = ParseCSVLine(line, ';')
    class_name = col[1]
    img_name = col[2]
    if not path2img[class_name] then
        path2img[class_name] = {}
    end
    table.insert(path2img[class_name], img_name)
    count = count + 1
end

local count2 = 0
for class_name, path2class in pairs(path2img) do
    for img_id, img_name in pairs(path2class) do
        count2 = count2 + 1
    end
end


require 'ImgLoader'

loader = ImgLoader()
loader:loadCsv('success.log')

local count3 = 0
for class_name, path2class in pairs(loader.path2img) do
    for img_id, img_name in pairs(path2class) do
        count3 = count3 + 1
    end
end
print(count, count2, count3)

-- print(path2img)
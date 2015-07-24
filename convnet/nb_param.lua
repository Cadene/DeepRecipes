layers = {}
layers[1] = 3 * 3 * 3 * 16
layers[2] = 16 * 3 * 3 * 32
layers[3] = 32 * 3 * 3 * 32
layers[4] = math.floor(221 / 2 / 2 / 3)^2 * 2048
layers[5] = 2048 * 1024
layers[6] = 1024 * 101

sum = 0
for a, b in pairs(layers) do
    print("Layer "..a.." nb_param "..b)
    sum = sum + b
end
print("Nb_param total "..sum)

layers = {}
layers[1] = 3 * 3 * 3 * 64 + 64
layers[2] = 64 * 3 * 3 * 64 + 64
layers[3] = 64 * 3 * 3 * 128 + 128
layers[4] = 128 * 3 * 3 * 128 + 128
layers[5] = 128 * 3 * 3 * 256 + 256
layers[6] = 256 * 3 * 3 * 256 + 256
layers[7] = 256 * 3 * 3 * 256 + 256
layers[8] = 256 * 3 * 3 * 512 + 512
layers[9] = 512 * 3 * 3 * 512 + 512
layers[10] = 512 * 3 * 3 * 512 + 512
layers[11] = 512 * 3 * 3 * 512 + 512
layers[12] = 512 * 3 * 3 * 512 + 512
layers[13] = 512 * 3 * 3 * 512 + 512
layers[14] = 512 * math.floor(224 / 2 / 2 / 2 / 2 / 2)^2 * 4096 + 4096
layers[15] = 4096 * 4096 + 4096
layers[16] = 4096 * 1000 + 1000

sum = 0
for a, b in pairs(layers) do
    print("Layer "..a.." nb_param "..b)
    sum = sum + b
end
print("Nb_param total "..sum)

-- 138357544
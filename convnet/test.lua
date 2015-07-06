status, err = pcall(function()
    print('test1')
    error({code=121})
    print('test2')
end)

if status then
    print('success')
else
    print(err)
end
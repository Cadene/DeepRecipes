require 'torch'
require 'gnuplot'

local Plot = torch.class('Plot')

function Plot.plot(model, X_train, class, string)
    model:evaluate()

    local x = torch.linspace(-1, 1, 100)

    local decision_region = {}
    local iter = {}
    for i = 1, #class do
        decision_region[class[i]] = {}
        iter[class[i]] = 1
    end

    local X, max, indice, class_i
    for i = 1, x:size(1) do
        for j = 1, x:size(1) do
            X = torch.Tensor({x[i], x[j]})
            max, indice = torch.max(model:forward(X), 1)
            class_i = indice:squeeze()
            decision_region[class_i][iter[class_i]] = {x[i], x[j]}
            iter[class_i] = iter[class_i] + 1
        end
    end

    -- print(#decision_region[1]..' + '..#decision_region[2]..' + '..#decision_region[3]..' = '..(#decision_region[1]+#decision_region[2]+#decision_region[3]))

    local th_region = {}
    for i = 1, #class do
        th_region[i] = torch.Tensor(decision_region[i]) 
    end

    to_plot = {}
    
    color = {'"red"', '"blue"', '"green"', '"brown"'}

    -- plot points
    for i = 1, #class   do
        local x1i = 1 + (i-1) * (X_train:size(1) / #class)
        local x2i = i * (X_train:size(1) / #class)
        to_plot[i] = {'class'..i, X_train[{{x1i,x2i},1}], X_train[{{x1i,x2i},2}], 'p ls 1 lc rgb '..color[i]}
    end

    -- plot dots
    id_to_plot = #class + 1
    for i = 1, #class do
        if th_region[i]:nElement() ~= 0 then 
            to_plot[id_to_plot] = {'region'..i, th_region[i][{{},1}], th_region[i][{{},2}], 'p ls 7 ps 0.1 lc rgb '..color[i]}
            id_to_plot = id_to_plot + 1
        end
    end


    gnuplot.pngfigure(string)
    gnuplot.plot(to_plot)
    gnuplot.plotflush()

    model:training()
end
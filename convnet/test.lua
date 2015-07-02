require 'torch'
require 'nn'
require 'xlua'
require 'optim'
require 'gnuplot'

function generateDataSpiral(N, D, K)
    -- local N = 1000 -- Number of points per class
    -- local D = 2 -- dimensionality
    -- local K = 3 -- number of classes
    local X = torch.zeros(N*K,D)
    local y = torch.ones(N*K,K) * -1

    local ix, r, t, X1, X2

    for j = 1, K do
        r  = torch.linspace(0.0, 1, N)
        t  = torch.linspace((j-1)*4, j*4, N) + torch.randn(N)*0.2
        X1 = torch.sin(t)
        X2 = torch.cos(t)
        for i = 1, N do
            xi = N*(j-1)+i
            X[{xi,1}] = r[i]*X1[i]
            X[{xi,2}] = r[i]*X2[i]
            y[{xi,j}] = 1
        end
    end

    return X, y
end

function generateDataGauss(N, D, K)
    local X = torch.zeros(N*K,D)
    local y = torch.ones(N*K,K) * -1

    local ix, X1, X2

    local y_label = {{0.5, 0.5}, {-0.5, -0.5}, {0.5, -0.5}, {-0.5, 0.5}}
    for j = 1, K do
        X1 = torch.randn(N) * 0.2 + y_label[j][1]
        X2 = torch.randn(N) * 0.2 + y_label[j][2]
        for i = 1, N do
            xi = N*(j-1)+i
            X[{xi,1}] = X1[i]
            X[{xi,2}] = X2[i]
            y[{xi,j}] = 1
        end
    end

    return X, y
end


function gradUpdate(model, X, y, criterion, learningRate)
    local pred = model:forward(X)
    local err = criterion:forward(pred, y)
    local gradCriterion = criterion:backward(pred, y)
    --model:zeroGradParameters()            -- reinit gradParameters
    model:backward(X, gradCriterion)
    model:updateParameters(learningRate)
    -- print('--')
    -- print(pred)
    -- print(err)
    -- print(gradCriterion)
    return err
end

function plot(model, X_train, class, string)
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
    for i = 1, K do
        th_region[i] = torch.Tensor(decision_region[i]) 
    end

    to_plot = {}
    
    color = {'"red"', '"blue"', '"green"'}

    -- plot points
    for i = 1, K do
        local x1i = 1+(i-1)*N_train
        local x2i = i*N_train
        to_plot[i] = {'class'..i, X_train[{{x1i,x2i},1}], X_train[{{x1i,x2i},2}], 'p ls 1 lc rgb '..color[i]}
    end

    -- plot dots
    id_to_plot = K+1
    for i = 1, K do
        if th_region[i]:nElement() ~= 0 then 
            to_plot[id_to_plot] = {'region'..i, th_region[i][{{},1}], th_region[i][{{},2}], 'p ls 7 ps 0.3 lc rgb '..color[i]}
            id_to_plot = id_to_plot + 1
        end
    end


    gnuplot.pngfigure(string)
    gnuplot.plot(to_plot)
    gnuplot.plotflush()
end


function train(model, X_train, class, criterion, learningRate, maxIter, saveEvery, printEvery)
    local errors = {}
    local sumErr = 0
    local ix, X, y, err
    for i = 1, maxIter do
        if i % saveEvery == 0 then
            torch.save("./model_" .. i .. ".model", model)
        end
        if i % printEvery == 0 then
            -- print('----------------')
            print('sumErr '..sumErr/printEvery)
            plot(model, X_train, class, 'plot'..i..'.png')
            -- print(model:forward(torch.Tensor({1,1})))
            -- print(model:forward(torch.Tensor({-1,-1})))
            -- print(model:get(1).weight)
            -- print(model:get(1).bias)
            sumErr = 0
        end
        ix = torch.random(N_train * #class) 
        -- print(ix)
        X = X_train[ix]
        y = y_train[ix]
        err = gradUpdate(model, X, y, criterion, learningRate)
        -- print('err '..err)
        sumErr = sumErr + err
        table.insert(errors, err)
    end
end



class = {1, 2}
N = 50 -- Number of points per class
D = 2 -- dimensionality
K = #class -- number of classes
N_train = N*0.8
N_test  = N*0.2

X_train, y_train = generateDataGauss(N_train, D, K)
X_test,  y_test  = generateDataGauss(N_test,  D, K)

-- Model

model = nn.Sequential()
model:add( nn.Linear(D, K) )
-- model:add( nn.SoftMax() )
-- model:add(nn.Tanh())
-- model:add( nn.Linear(3, 3) )
-- model:add( nn.SoftMax() )
-- model:add( nn.LogSoftMax() )
-- model:add( nn.SoftMax() )

--local criterion = nn.CrossEntropyCriterion()

local criterion = nn.MSECriterion()

-- criterion = nn.ClassNLLCriterion()
-- criterion.sizeAverage = false

learningRate = 1e-2
maxIter = 190
saveEvery = 100000
printEvery = 50

train(model, X_train, class, criterion, learningRate, maxIter, saveEvery, printEvery)





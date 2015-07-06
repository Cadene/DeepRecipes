require 'torch'
require 'Dataset'

local DatasetBuilder = torch.class('DatasetBuilder')

function DatasetBuilder.generate(type_data, ...)
    local method_name = 'generate'..type_data
    return DatasetBuilder[method_name](...)
end

function DatasetBuilder.generateSpiral(N, D, K)
    --[[N: Number of points per class
        D: dimensionality
        K: number of classes]]
    local X = torch.zeros(N*K,D)
    local y = torch.ones(N*K)
    
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
            y[xi] = j
        end
    end

    return Dataset(X, y)
end

function DatasetBuilder.generateGauss(N, D, K)
    local X = torch.zeros(N*K,D)
    local y = torch.ones(N*K)
    
    local ix, X1, X2
    
    local y_label = {{0.5, 0.5}, {-0.5, -0.5}, {0.5, -0.5}, {-0.5, 0.5}}
    for j = 1, K do
        X1 = torch.randn(N) * 0.2 + y_label[j][1]
        X2 = torch.randn(N) * 0.2 + y_label[j][2]
        for i = 1, N do
            xi = N*(j-1)+i
            X[{xi,1}] = X1[i]
            X[{xi,2}] = X2[i]
            y[xi] = j
        end
    end
    
    return Dataset(X, y)
end



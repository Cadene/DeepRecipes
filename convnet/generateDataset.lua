local N = 100 -- Number of points per class
local D = 2 -- dimensionality
local K = 3 -- number of classes
local X = torch.zeros(N*K,D)
local y = torch.zeros(N*K)

local ix, r, t

for j = 1, K do
	ix = torch.linspace(N*j, N*(j+1), N*j+1)
	r  = torch.linspace(0.0, 1, N)
	t  = torch.linspace(j*4, (j+1)*4, N) + torch.randn(N)*0.2 -- theta
	-- X[ix] = { r*torch.sin(t), r*torch.cos(t) }
	-- y[ix] = j
end


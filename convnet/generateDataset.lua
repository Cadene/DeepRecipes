require 'torch'
require 'nn'
require 'xlua'
require 'optim'
require 'gnuplot'

function generateData(N, D, K)
	-- local N = 1000 -- Number of points per class
	-- local D = 2 -- dimensionality
	-- local K = 3 -- number of classes
	local X = torch.zeros(N*K,D)
	local y = torch.zeros(N*K)

	local ix, r, t, X1, X2

	for j = 1, K do
		r  = torch.linspace(0.0, 1, N)
		t  = torch.linspace((j-1)*4, j*4, N) + torch.randn(N)*0.2
		X1 = torch.sin(t)
		X2 = torch.cos(t)
		for i = 1, N do
			xi = N*(j-1)+i
			X[xi][1] = r[i]*X1[i]
			X[xi][2] = r[i]*X2[i]
			y[xi]    = j
		end
	end

	return X, y
end

--------------------------------------------------------
-- Main
--------------------------------------------------------

--------------------------------------------------------
-- Init

N = 900 -- Number of points per class
D = 2 -- dimensionality
K = 3 -- number of classes
classes = {'1', '2', '3'}

X_train, y_train = generateData(N, D, K)
X_test,  y_test  = generateData(1000-N, D, K)

--------------------------------------------------------
-- Model

model = nn.Sequential()
model:add( nn.Linear(K, 1) )
model:add( nn.LogSoftMax() )

--------------------------------------------------------
-- Loss Function

criterion = nn.MultiMarginCriterion()

--------------------------------------------------------
-- Training

confusion = optim.ConfusionMatrix(classes)

trainLogger = optim.Logger(paths.concat('./', 'train.log'))
testLogger  = optim.Logger(paths.concat('./', 'test.log'))

gradParameters = model:getParameters()

optimState = {
	maxIter = 2
}
optimMethod = optim.cg

batchSize_ = 2

function train()
	epoch = epoch or 1
	local time = sys.clock()
	model:training()
	shuffle = torch.randperm(N)
	print("==> online epoch # " .. epoch .. ' [batchSize = ' .. batchSize_ .. ']')

	for t = 1, N, batchSize_ do

		xlua.progress(t, N)

		local inputs = {}
		local targets = {}
		for i = t, math.min(t+batchSize_-1, N) do
			local input  = X_train[shuffle[i]]
			local target = y_train[shuffle[i]]
			input = input:double()
			table.insert(inputs, input)
			table.insert(targets, target)
		end
	end

	local feval = function(X)
		if X ~= parameters then
			paramters:copy(X)
		end

		gradParameters:zero()

		local f = 0

		for i = 1, #inputs do
			local output = model:forward(inputs[i])
			local err = criterion:forward(output, targets[i])
			f = f + err

			local df_do = criterion:backward(ouput, targets[i])
			model:backward(inputs[i], df_do)

			confusion:add(ouput, targets[i])
		end

		gradParameters:div(#inputs)
		f = f / #inputs

		return f, gradParameters
	end

	optimMethod(feval, parameters, optimState)

	time = sys.clock() - time
	time = time / N
	print("\n==> time to learn 1 sample = " .. (time*1000) .. 'ms')

	print(confusion)

	trainLogger:add{['% mean class accuracy (train set)'] = confusion.totalValid * 100}
	trainLogger:style{['% mean class accuracy (train set)'] = '-'}
	trainLogger:plot()

	local filename = paths.concat(opt.save, 'model.net')
	os.execute('mkdir -p ' .. sys.dirname(filename))
	print('==> saving model to '..filename)
	torch.save(filename, model)

	confusion:zero()
	epoch = epoch + 1
end

function test()
	-- local vars
	local time = sys.clock()

	-- averaged param use?
	if average then
		cachedparams = parameters:clone()
		parameters:copy(average)
	end

	-- set model to evaluate mode (for modules that differ in training and testing, like Dropout)
	model:evaluate()

	-- test over test data
	print('==> testing on test set:')
	for t = 1,testData:size() do
		-- disp progress
		xlua.progress(t, testData:size())

		-- get new sample
		local input = testData.data[t]
		if opt.type == 'double' then input = input:double()
		elseif opt.type == 'cuda' then input = input:cuda() end
		local target = testData.labels[t]

		-- test sample
		local pred = model:forward(input)
		confusion:add(pred, target)
	end

	-- timing
	time = sys.clock() - time
	time = time / testData:size()
	print("\n==> time to test 1 sample = " .. (time*1000) .. 'ms')

	-- print confusion matrix
	print(confusion)

	-- update log/plot
	testLogger:add{['% mean class accuracy (test set)'] = confusion.totalValid * 100}
	
	testLogger:style{['% mean class accuracy (test set)'] = '-'}
	testLogger:plot()

	-- averaged param use?
	if average then
		-- restore parameters
		parameters:copy(cachedparams)
	end

	-- next iteration:
	confusion:zero()
end



--------------------------------------------------------
-- Ploting

-- gnuplot.plot(
-- 	{'1', X[{{1,N},1}],  	  X[{{1,N},2}],       '.'},
-- 	{'2', X[{{1+N,2*N},1}],   X[{{1+N,N+N},2}],   '.'},
-- 	{'3', X[{{1+2*N,3*N},1}], X[{{1+2*N,3*N},2}], '.'}
-- )








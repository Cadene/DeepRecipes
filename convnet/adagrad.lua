return function (opfunc, x, config, state)
   -- (0) get/update state
   if config == nil and state == nil then
      print('no state table, ADAGRAD initializing')
   end
   local config = config or {}
   local state = state or config
   local lr = config.learningRate or 1e-3
   local lrd = config.learningRateDecay or 0
   state.evalCounter = state.evalCounter or 0
   local nevals = state.evalCounter

   -- (1) evaluate f(x) and df/dx
   local fx,dfdx = opfunc(x)

   -- (3) learning rate decay (annealing)
   local clr = lr / (1 + nevals*lrd)
      
   -- (4) parameter update with single or individual learning rates
   if not state.paramVariance then
      state.paramVariance = torch.Tensor():typeAs(x):resizeAs(dfdx):zero()
      state.paramStd = torch.Tensor():typeAs(x):resizeAs(dfdx)
   end
   state.paramVariance:addcmul(1,dfdx,dfdx)
   state.paramStd:resizeAs(state.paramVariance):copy(state.paramVariance):sqrt()
   x:addcdiv(-clr, dfdx,state.paramStd:add(1e-10))

   -- (5) update evaluation counter
   state.evalCounter = state.evalCounter + 1

   -- return x*, f(x) before optimization
   return x,{fx},config,state
end
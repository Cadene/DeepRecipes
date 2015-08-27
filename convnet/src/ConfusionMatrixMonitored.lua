--[[ A Confusion Matrix class

Example:

    conf = optim.ConfusionMatrixMonitored( {'cat','dog','person'} )   -- new matrix
    conf:zero()                                              -- reset matrix
    for i = 1,N do
        conf:add( neuralnet:forward(sample), label )         -- accumulate errors
    end
    print(conf)                                              -- print matrix
    image.display(conf:render())                             -- render matrix
]]
local ConfusionMatrixMonitored = torch.class('ConfusionMatrixMonitored')

function ConfusionMatrixMonitored:__init(nclasses, classes)
   if type(nclasses) == 'table' then
      classes = nclasses
      nclasses = #classes
   end
   self.mat = torch.LongTensor(nclasses,nclasses):zero()
   self.valids = torch.FloatTensor(nclasses):zero()
   self.unionvalids = torch.FloatTensor(nclasses):zero()
   self.nclasses = nclasses
   self.totalValid = 0
   self.averageValid = 0
   self.classes = classes or {}
   -- buffers
   self._target = torch.FloatTensor()
   self._prediction = torch.FloatTensor()
   self._max = torch.FloatTensor()
   self._pred_idx = torch.LongTensor()
   self._targ_idx = torch.LongTensor()
end

-- takes scalar prediction and target as input
function ConfusionMatrixMonitored:_add(p, t)
   -- non-positive values are considered missing
   -- and therefore ignored
   if t > 0 then 
      self.mat[t][p] = self.mat[t][p] + 1
   end
end

function ConfusionMatrixMonitored:add(prediction, target)
   if type(prediction) == 'number' then
      -- comparing numbers
      self:_add(prediction, target)
   else
      self._prediction:resize(prediction:size()):copy(prediction)
      if type(target) == 'number' then
         -- prediction is a vector, then target assumed to be an index
         self._max:max(self._pred_idx, self._prediction, 1)
         self:_add(self._pred_idx[1], target)
      else
         -- both prediction and target are vectors
         self._target:resize(target:size()):copy(target)
         self._max:max(self._targ_idx, self._target, 1)
         self._max:max(self._pred_idx, self._prediction, 1)
         self:_add(self._pred_idx[1], self._targ_idx[1])
      end
   end
end

function ConfusionMatrixMonitored:batchAdd(predictions, targets)
   local t20 = torch.Timer()
   local preds, targs, __
   local t30 = torch.Timer()

   print('')
   print(predictions:size())
   print(targets:size())
   print('')

   local t21 = torch.Timer()   
   self._target:resize(targets:size()):copy(targets)
   if targets:dim() == 1 then
      print('targets is a vector of classes')
      targs = self._target
   elseif targets:dim() == 2 then
      print('targets is a matrix of one-hot rows')
      if targets:size(2) == 1 then
         print('or targets just needs flattening')
         targs = self._target:select(2,1)
      else
         self._max:max(self._targ_idx, self._target, 2)
         targs = self._targ_idx:select(2,1)
      end
   else
      error("targets has invalid number of dimensions")
   end
   print('t21 '.. t21:time().real .. ' seconds')

   local t40 = torch.Timer()
   self._prediction:resize(predictions:size())
   print('> > t40 '.. t40:time().real .. ' seconds')

   local t41 = torch.Timer()
   self._prediction:copy(predictions)
   print('> > t41 '.. t41:time().real .. ' seconds')
   
   print('>t30 '.. t30:time().real .. ' seconds')
   if predictions:dim() == 1 then
      print('predictions is a vector of classes')
      preds = self._prediction
   elseif predictions:dim() == 2 then
      print('prediction is a matrix of class likelihoods')
      if predictions:size(2) == 1 then
         print('or prediction just needs flattening')
         preds = self._prediction:select(2,1)
      else
         local t31 = torch.Timer()
         self._max:max(self._pred_idx, self._prediction, 2)
         print('>t31 '.. t31:time().real .. ' seconds')
         local t32 = torch.Timer()
         preds = self._pred_idx:select(2,1)
         print('>t32 '.. t32:time().real .. ' seconds')
      end
   else
      error("predictions has invalid number of dimensions")
   end
   print('t20 '.. t20:time().real .. ' seconds')
   
   local t22 = torch.Timer()
   --loop over each pair of indices
   for i = 1,preds:size(1) do
      self:_add(preds[i], targs[i])
   end
   print('t22 '.. t22:time().real .. ' seconds')
end

function ConfusionMatrixMonitored:zero()
   self.mat:zero()
   self.valids:zero()
   self.unionvalids:zero()
   self.totalValid = 0
   self.averageValid = 0
end

local function isNaN(number)
  return number ~= number
end

function ConfusionMatrixMonitored:updateValids()
   local total = 0
   for t = 1,self.nclasses do
      self.valids[t] = self.mat[t][t] / self.mat:select(1,t):sum()
      self.unionvalids[t] = self.mat[t][t] / (self.mat:select(1,t):sum()+self.mat:select(2,t):sum()-self.mat[t][t])
      total = total + self.mat[t][t]
   end
   self.totalValid = total / self.mat:sum()
   self.averageValid = 0
   self.averageUnionValid = 0
   local nvalids = 0
   local nunionvalids = 0
   for t = 1,self.nclasses do
      if not isNaN(self.valids[t]) then
         self.averageValid = self.averageValid + self.valids[t]
         nvalids = nvalids + 1
      end
      if not isNaN(self.valids[t]) and not isNaN(self.unionvalids[t]) then
         self.averageUnionValid = self.averageUnionValid + self.unionvalids[t]
         nunionvalids = nunionvalids + 1
      end
   end
   self.averageValid = self.averageValid / nvalids
   self.averageUnionValid = self.averageUnionValid / nunionvalids
end

-- Calculating FAR/FRR associated with the confusion matrix

function ConfusionMatrixMonitored:farFrr()
   local cmat = self.mat
   local noOfClasses = cmat:size()[1]
   self._frrs = self._frrs or torch.zeros(noOfClasses)
   self._frrs:zero()
   self._classFrrs = self._classFrrs or torch.zeros(noOfClasses)
   self._classFrrs:zero()
   self._classFrrs:add(-1)
   self._fars = self._fars or torch.zeros(noOfClasses)
   self._fars:zero()
   self._classFars = self._classFars or torch.zeros(noOfClasses)
   self._classFars:zero()
   self._classFars:add(-1)
   local classSamplesCount = cmat:sum(2)
   local indx = 1
   for i=1,noOfClasses do
      if classSamplesCount[i][1] ~= 0 then
         self._frrs[indx] = 1 - cmat[i][i]/classSamplesCount[i][1]
         self._classFrrs[i] = self._frrs[indx]
         -- Calculating FARs
         local farNumerator = 0
         local farDenominator = 0
         for j=1, noOfClasses do
            if i ~= j then
               if classSamplesCount[j][1] ~= 0 then
                  farNumerator = farNumerator + cmat[j][i]/classSamplesCount[j][1]
                  farDenominator  = farDenominator + 1
               end
            end
         end
         self._fars[indx] = farNumerator/farDenominator
         self._classFars[i] = self._fars[indx]
         indx = indx + 1
      end
   end
   indx = indx - 1
   local returnFrrs = self._frrs[{{1, indx}}]
   local returnFars = self._fars[{{1, indx}}]
   return self._classFrrs, self._classFars, returnFrrs, returnFars
end

function ConfusionMatrixMonitored:__tostring__()
   self:updateValids()
   local str = {'ConfusionMatrixMonitored:\n'}
   local nclasses = self.nclasses
   table.insert(str, '[')
   for t = 1,nclasses do
      local pclass = self.valids[t] * 100
      pclass = string.format('%2.3f', pclass)
      if t == 1 then
         table.insert(str, '[')
      else
         table.insert(str, ' [')
      end
      for p = 1,nclasses do
         table.insert(str, string.format('%8d', self.mat[t][p]))
      end
      if self.classes and self.classes[1] then
         if t == nclasses then
            table.insert(str, ']]  ' .. pclass .. '% \t[class: ' .. (self.classes[t] or '') .. ']\n')
         else
            table.insert(str, ']   ' .. pclass .. '% \t[class: ' .. (self.classes[t] or '') .. ']\n')
         end
      else
         if t == nclasses then
            table.insert(str, ']]  ' .. pclass .. '% \n')
         else
            table.insert(str, ']   ' .. pclass .. '% \n')
         end
      end
   end
   table.insert(str, ' + average row correct: ' .. (self.averageValid*100) .. '% \n')
   table.insert(str, ' + average rowUcol correct (VOC measure): ' .. (self.averageUnionValid*100) .. '% \n')
   table.insert(str, ' + global correct: ' .. (self.totalValid*100) .. '%')
   return table.concat(str)
end

function ConfusionMatrixMonitored:render(sortmode, display, block, legendwidth)
   -- args
   local confusion = self.mat
   local classes = self.classes
   local sortmode = sortmode or 'score' -- 'score' or 'occurrence'
   local block = block or 25
   local legendwidth = legendwidth or 200
   local display = display or false

   -- legends
   local legend = {
      ['score'] = 'Confusion matrix [sorted by scores, global accuracy = %0.3f%%, per-class accuracy = %0.3f%%]',
      ['occurrence'] = 'Confusiong matrix [sorted by occurences, accuracy = %0.3f%%, per-class accuracy = %0.3f%%]'
   }

   -- parse matrix / normalize / count scores
   local diag = torch.FloatTensor(#classes)
   local freqs = torch.FloatTensor(#classes)
   local unconf = confusion
   local confusion = confusion:clone()
   local corrects = 0
   local total = 0
   for target = 1,#classes do
      freqs[target] = confusion[target]:sum()
      corrects = corrects + confusion[target][target]
      total = total + freqs[target]
      confusion[target]:div( math.max(confusion[target]:sum(),1) )
      diag[target] = confusion[target][target]
   end

   -- accuracies
   local accuracy = corrects / total * 100
   local perclass = 0
   local total = 0
   for target = 1,#classes do
      if confusion[target]:sum() > 0 then
         perclass = perclass + diag[target]
         total = total + 1
      end
   end
   perclass = perclass / total * 100
   freqs:div(unconf:sum())

   -- sort matrix
   if sortmode == 'score' then
      _,order = torch.sort(diag,1,true)
   elseif sortmode == 'occurrence' then
      _,order = torch.sort(freqs,1,true)
   else
      error('sort mode must be one of: score | occurrence')
   end

   -- render matrix
   local render = torch.zeros(#classes*block, #classes*block)
   for target = 1,#classes do
      for prediction = 1,#classes do
         render[{ { (target-1)*block+1,target*block }, { (prediction-1)*block+1,prediction*block } }] = confusion[order[target]][order[prediction]]
      end
   end

   -- add grid
   for target = 1,#classes do
      render[{ {target*block},{} }] = 0.1
      render[{ {},{target*block} }] = 0.1
   end

   -- create rendering
   require 'image'
   require 'qtwidget'
   require 'qttorch'
   local win1 = qtwidget.newimage( (#render)[2]+legendwidth, (#render)[1] )
   image.display{image=render, win=win1}

   -- add legend
   for i in ipairs(classes) do
      -- background cell
      win1:setcolor{r=0,g=0,b=0}
      win1:rectangle((#render)[2],(i-1)*block,legendwidth,block)
      win1:fill()
      
      -- %
      win1:setfont(qt.QFont{serif=false, size=fontsize})
      local gscale = freqs[order[i]]/freqs:max()*0.9+0.1 --3/4
      win1:setcolor{r=gscale*0.5+0.2,g=gscale*0.5+0.2,b=gscale*0.8+0.2}
      win1:moveto((#render)[2]+10,i*block-block/3)
      win1:show(string.format('[%2.2f%% labels]',math.floor(freqs[order[i]]*10000+0.5)/100))

      -- legend
      win1:setfont(qt.QFont{serif=false, size=fontsize})
      local gscale = diag[order[i]]*0.8+0.2
      win1:setcolor{r=gscale,g=gscale,b=gscale}
      win1:moveto(120+(#render)[2]+10,i*block-block/3)
      win1:show(classes[order[i]])

      for j in ipairs(classes) do
         -- scores
         local score = confusion[order[j]][order[i]]
         local gscale = (1-score)*(score*0.8+0.2)
         win1:setcolor{r=gscale,g=gscale,b=gscale}
         win1:moveto((i-1)*block+block/5,(j-1)*block+block*2/3)
         win1:show(string.format('%02.0f',math.floor(score*100+0.5)))
      end
   end

   -- generate tensor
   local t = win1:image():toTensor()

   -- display
   if display then
      image.display{image=t, legend=string.format(legend[sortmode],accuracy,perclass)}
   end

   -- return rendering
   return t
end
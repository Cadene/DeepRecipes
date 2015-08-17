convnet-benchmarks
==================


Machine MBP: `Intel(R) Core(TM) i7-5557U CPU @ 3.10GHz` + `OS X 10.10.4 (14E46)`

Machine Kepler: `24 * Intel(R) Xeon(R) CPU E5-2640 0 @ 2.50GHz` + ` 8 * Tesla K20m` + `Linux 4.1.0 x86_64`

##Imagenet Winners Benchmarking
I pick some popular imagenet models, and I clock the time for a full forward + backward pass. I average my times over 10 runs. I ignored dropout and softmax layers.

**[Overfeat [accurate]](http://arxiv.org/abs/1312.6229)** - Input 3x221x221

```th benchmark.lua 
:updateOutput():    342.78500080109 
:updateGradInput(): 349.49679374695 
:accGradParameters():   79.268622398376 
:Forward:   342.78500080109 
:Backward:  428.76541614532 
:TOTAL: 771.55041694641 ```

```th benchmark.lua -cuda true -convMM true
free :updateOutput():   0.59740543365479    
:updateOutput():    20.451903343201 
free :updateGradInput():    0.69580078125   
free :accGradParameters():  0.37429332733154    
:updateGradInput(): 0.66800117492676    
:accGradParameters():   18.177700042725 
:Forward:   20.451903343201 
:Backward:  18.845701217651 
:TOTAL: 39.297604560852 ```

```th benchmark.lua -cuda true -convMM false
free :updateOutput():   1.2835025787354 
:updateOutput():    20.397782325745 
free :updateGradInput():    1.3585805892944 
free :accGradParameters():  1.0042190551758 
:updateGradInput(): 1.3797044754028 
:accGradParameters():   18.18060874939  
:Forward:   20.397782325745 
:Backward:  19.560313224792 
:TOTAL: 39.958095550537 ```

```th benchmark.lua -cuda true -convMM false -cudnn true
free :updateOutput():   1.7310857772827 
:updateOutput():    41.896796226501 
free :updateGradInput():    1.1646032333374 
free :accGradParameters():  1.0838985443115 
:updateGradInput(): 1.1409044265747 
:accGradParameters():   328.67240905762 
:Forward:   41.896796226501 
:Backward:  329.81331348419 
:TOTAL: 371.71010971069 ```

```th benchmark.lua -cuda true -4d_tensor true -batch_size 64 -cudnn true
free :updateOutput():   0.023290514945984   
:updateOutput():    6.4391922205687 
free :updateGradInput():    0.014150142669678   
free :accGradParameters():  0.013917312026024   
:updateGradInput(): 0.014584138989449   
:accGradParameters():   33.726999908686 
:Forward:   6.4391922205687 
:Backward:  33.741584047675 
:TOTAL: 40.180776268244 ```

```th benchmark.lua -cuda true -4d_tensor true -batch_size 128 -cudnn true
free :updateOutput():   0.011540576815605   
:updateOutput():    6.3072735443711 
free :updateGradInput():    0.0073984265327454  
free :accGradParameters():  0.0068860128521919  
:updateGradInput(): 0.0072460621595383  
:accGradParameters():   31.415093690157 
:Forward:   6.3072735443711 
:Backward:  31.422339752316 
:TOTAL: 37.729613296688 ```



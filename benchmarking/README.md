convnet-benchmarks
==================


Machine MBP: `Intel(R) Core(TM) i7-5557U CPU @ 3.10GHz` + `OS X 10.10.4 (14E46)`

Machine Kepler: `24 * Intel(R) Xeon(R) CPU E5-2640 0 @ 2.50GHz` + ` 8 * Tesla K20m` + `Linux 4.1.0 x86_64`

##Imagenet Winners Benchmarking
I pick some popular imagenet models, and I clock the time for a full forward + backward pass. I average my times over 10 runs. I ignored dropout and softmax layers.

**[Overfeat [accurate]](http://arxiv.org/abs/1312.6229)** - Input 128x3x231x231

| Library                  | Class                                                                                                                    | Time (ms)         | forward (ms)            | backward (ms)            |
|:------------------------:|:------------------------------------------------------------------------------------------------------------------------:| -----------------:| -----------------------:| ------------------------:|
| fbfft                    | [SpatialConvolutionCuFFT](https://github.com/facebook/fbcunn/tree/sync/src/fft)                                          |         407       |  139                    |   268                    |
| cudaconvnet2*            | [ConvLayer](https://github.com/soumith/cuda-convnet2.torch/blob/master/cudaconv3/src/filter_acts.cu)                     |         723       |  176                    |   547                    |
| CuDNN (R2) *             | [cudnn.SpatialConvolution](https://github.com/soumith/cudnn.torch/blob/master/SpatialConvolution.lua)                    |         810       |  234                    |   576                    |
| Caffe                    | [ConvolutionLayer](https://github.com/BVLC/caffe/blob/master/src/caffe/layers/conv_layer.cu)                             |         823       |  355                    |   468                    |
| Torch-7 (native)         | [SpatialConvolutionMM](https://github.com/torch/cunn/blob/master/SpatialConvolutionMM.cu)                                |         878       |  379                    |   499                    |


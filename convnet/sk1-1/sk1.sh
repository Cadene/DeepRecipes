[0m# ... lunching using pid = 32345[0m	
[0m# ... loading seed in ./sk1/seed.save[0m	
[0m# ... switching to CUDA[0m	
[0m# ... loading Dataset[0m	
[0m# ...reloading previously trained model[0m	
[0m# Model[0m	
nn.Sequential {
  [input -> (1) -> (2) -> (3) -> (4) -> (5) -> (6) -> (7) -> (8) -> (9) -> (10) -> (11) -> (12) -> (13) -> (14) -> (15) -> (16) -> (17) -> (18) -> output]
  (1): nn.SpatialConvolutionMM(in: 3, out: 16, kW: 3, kH: 3, padding: 1)
  (2): nn.ReLU
  (3): nn.SpatialMaxPooling(kW: 2, kH: 2, dW: 2, dH: 2)
  (4): nn.SpatialConvolutionMM(in: 16, out: 32, kW: 3, kH: 3, padding: 1)
  (5): nn.ReLU
  (6): nn.SpatialMaxPooling(kW: 2, kH: 2, dW: 2, dH: 2)
  (7): nn.SpatialConvolutionMM(in: 32, out: 32, kW: 3, kH: 3, padding: 1)
  (8): nn.ReLU
  (9): nn.SpatialMaxPooling(kW: 3, kH: 3, dW: 3, dH: 3)
  (10): nn.Reshape(10368)
  (11): nn.Linear(10368 -> 2048)
  (12): nn.ReLU
  (13): nn.Dropout(0.600000)
  (14): nn.Linear(2048 -> 1024)
  (15): nn.ReLU
  (16): nn.Dropout(0.600000)
  (17): nn.Linear(1024 -> 101)
  (18): nn.LogSoftMax
}
[0mNumber of parameters 23451749[0m	
[0m# Criterion[0m	
nn.ClassNLLCriterion
[0m# ... building optimizer[0m	
[0m# ...reloading previously trained optimfunc.state[0m	
[0m# Optimizer[0m	
{
  name : [1;30m"[0m[0;32mSGD[0m[1;30m"[0m
  method : [0;35mfunction: 0x40d31800[0m
  config : 
    {
      learningRateDecay : [0;36m0[0m
      learningRate : [0;36m0.01[0m
      weightDecay : [0;36m1e-05[0m
      momentum : [0;36m0[0m
    }
  state : 
    {
      evalCounter : [0;36m0[0m
    }
}
[0m
#####################[0m	
[0m# Epoch n° 1[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:14:11 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:13:51 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:13:12 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:12:29 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:11:44 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:11:01 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:10:17 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:09:33 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:08:47 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:03 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:07:19 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:06:33 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:05:49 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:05 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:19 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:03:35 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:02:51 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:07 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:21 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:37 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 1[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:14:50[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 47.866839731094%[0m	
[0m: average rowUcol correct (VOC measure): 31.653594719892%[0m	
[0m: > global correct: 47.816889724588%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:01:54 left[0m	
[0m: 5% done [0m	[0m00:01:35 left[0m	
[0m: 10% done [0m	[0m00:01:34 left[0m	
[0m: 15% done [0m	[0m00:01:31 left[0m	
[0m: 20% done [0m	[0m00:01:27 left[0m	
[0m: 25% done [0m	[0m00:01:22 left[0m	
[0m: 30% done [0m	[0m00:01:17 left[0m	
[0m: 35% done [0m	[0m00:01:11 left[0m	
[0m: 40% done [0m	[0m00:01:06 left[0m	
[0m: 45% done [0m	[0m00:01:01 left[0m	
[0m: 50% done [0m	[0m00:00:55 left[0m	
[0m: 55% done [0m	[0m00:00:50 left[0m	
[0m: 60% done [0m	[0m00:00:44 left[0m	
[0m: 65% done [0m	[0m00:00:39 left[0m	
[0m: 70% done [0m	[0m00:00:33 left[0m	
[0m: 75% done [0m	[0m00:00:28 left[0m	
[0m: 80% done [0m	[0m00:00:22 left[0m	
[0m: 85% done [0m	[0m00:00:17 left[0m	
[0m: 90% done [0m	[0m00:00:11 left[0m	
[0m: 95% done [0m	[0m00:00:06 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:01:50[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 18.200329632157%[0m	
[0m: average rowUcol correct (VOC measure): 10.249964227107%[0m	
[0m: > global correct: 18.125240953902%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.3109691143036 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.3800711631775 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.4482560157776 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 2[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:14:57 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:14:05 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:13:17 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:12:33 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:11:46 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:11:03 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:10:18 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:09:34 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:08:48 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:04 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:07:20 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:06:34 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:05:50 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:06 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:20 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:03:36 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:02:52 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:07 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:22 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:37 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 2[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:14:51[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 59.086764655491%[0m	
[0m: average rowUcol correct (VOC measure): 42.1424704318%[0m	
[0m: > global correct: 59.025550270988%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:01:55 left[0m	
[0m: 5% done [0m	[0m00:01:31 left[0m	
[0m: 10% done [0m	[0m00:01:32 left[0m	
[0m: 15% done [0m	[0m00:01:28 left[0m	
[0m: 20% done [0m	[0m00:01:24 left[0m	
[0m: 25% done [0m	[0m00:01:19 left[0m	
[0m: 30% done [0m	[0m00:01:14 left[0m	
[0m: 35% done [0m	[0m00:01:09 left[0m	
[0m: 40% done [0m	[0m00:01:04 left[0m	
[0m: 45% done [0m	[0m00:00:59 left[0m	
[0m: 50% done [0m	[0m00:00:53 left[0m	
[0m: 55% done [0m	[0m00:00:48 left[0m	
[0m: 60% done [0m	[0m00:00:43 left[0m	
[0m: 65% done [0m	[0m00:00:37 left[0m	
[0m: 70% done [0m	[0m00:00:32 left[0m	
[0m: 75% done [0m	[0m00:00:27 left[0m	
[0m: 80% done [0m	[0m00:00:21 left[0m	
[0m: 85% done [0m	[0m00:00:16 left[0m	
[0m: 90% done [0m	[0m00:00:11 left[0m	
[0m: 95% done [0m	[0m00:00:05 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:01:47[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 22.618627238392%[0m	
[0m: average rowUcol correct (VOC measure): 12.877973062125%[0m	
[0m: > global correct: 22.53676268106%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.3817698955536 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.4490308761597 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.520740032196 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 3[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:14:49 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:14:05 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:13:22 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:12:38 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:11:50 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:11:05 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:10:21 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:09:36 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:08:50 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:05 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:07:20 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:06:34 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:05:50 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:06 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:20 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:03:36 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:02:52 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:07 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:22 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:37 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 3[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:14:52[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 60.727521865675%[0m	
[0m: average rowUcol correct (VOC measure): 43.799734735253%[0m	
[0m: > global correct: 60.679128414998%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:01:53 left[0m	
[0m: 5% done [0m	[0m00:01:31 left[0m	
[0m: 10% done [0m	[0m00:01:32 left[0m	
[0m: 15% done [0m	[0m00:01:29 left[0m	
[0m: 20% done [0m	[0m00:01:25 left[0m	
[0m: 25% done [0m	[0m00:01:20 left[0m	
[0m: 30% done [0m	[0m00:01:15 left[0m	
[0m: 35% done [0m	[0m00:01:09 left[0m	
[0m: 40% done [0m	[0m00:01:04 left[0m	
[0m: 45% done [0m	[0m00:00:59 left[0m	
[0m: 50% done [0m	[0m00:00:54 left[0m	
[0m: 55% done [0m	[0m00:00:49 left[0m	
[0m: 60% done [0m	[0m00:00:43 left[0m	
[0m: 65% done [0m	[0m00:00:38 left[0m	
[0m: 70% done [0m	[0m00:00:33 left[0m	
[0m: 75% done [0m	[0m00:00:27 left[0m	
[0m: 80% done [0m	[0m00:00:22 left[0m	
[0m: 85% done [0m	[0m00:00:16 left[0m	
[0m: 90% done [0m	[0m00:00:11 left[0m	
[0m: 95% done [0m	[0m00:00:05 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:01:49[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 22.43231205952%[0m	
[0m: average rowUcol correct (VOC measure): 12.799320015872%[0m	
[0m: > global correct: 22.355014594922%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.6132409572601 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.6772768497467 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.7434320449829 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 4[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:14:39 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:14:02 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:13:21 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:12:38 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:11:51 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:11:07 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:10:22 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:09:38 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:08:51 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:06 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:07:22 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:06:36 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:05:51 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:07 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:21 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:03:37 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:02:52 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:08 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:22 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:38 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 4[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:14:55[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 62.406183793993%[0m	
[0m: average rowUcol correct (VOC measure): 45.596725692843%[0m	
[0m: > global correct: 62.354828005752%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:02:03 left[0m	
[0m: 5% done [0m	[0m00:01:31 left[0m	
[0m: 10% done [0m	[0m00:01:31 left[0m	
[0m: 15% done [0m	[0m00:01:28 left[0m	
[0m: 20% done [0m	[0m00:01:23 left[0m	
[0m: 25% done [0m	[0m00:01:19 left[0m	
[0m: 30% done [0m	[0m00:01:14 left[0m	
[0m: 35% done [0m	[0m00:01:09 left[0m	
[0m: 40% done [0m	[0m00:01:04 left[0m	
[0m: 45% done [0m	[0m00:00:59 left[0m	
[0m: 50% done [0m	[0m00:00:53 left[0m	
[0m: 55% done [0m	[0m00:00:48 left[0m	
[0m: 60% done [0m	[0m00:00:43 left[0m	
[0m: 65% done [0m	[0m00:00:38 left[0m	
[0m: 70% done [0m	[0m00:00:32 left[0m	
[0m: 75% done [0m	[0m00:00:27 left[0m	
[0m: 80% done [0m	[0m00:00:22 left[0m	
[0m: 85% done [0m	[0m00:00:16 left[0m	
[0m: 90% done [0m	[0m00:00:11 left[0m	
[0m: 95% done [0m	[0m00:00:05 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:01:48[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 19.131243092441%[0m	
[0m: average rowUcol correct (VOC measure): 11.011799695985%[0m	
[0m: > global correct: 19.105579115493%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.3976459503174 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.4616940021515 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.5295739173889 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 5[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:14:48 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:14:07 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:13:18 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:12:33 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:11:46 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:11:01 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:10:17 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:09:33 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:08:47 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:04 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:07:19 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:06:34 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:05:50 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:06 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:20 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:03:36 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:02:52 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:07 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:22 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:37 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 5[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:14:50[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 63.676501559739%[0m	
[0m: average rowUcol correct (VOC measure): 46.937608305771%[0m	
[0m: > global correct: 63.632341555138%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:01:58 left[0m	
[0m: 5% done [0m	[0m00:01:30 left[0m	
[0m: 10% done [0m	[0m00:01:31 left[0m	
[0m: 15% done [0m	[0m00:01:28 left[0m	
[0m: 20% done [0m	[0m00:01:24 left[0m	
[0m: 25% done [0m	[0m00:01:19 left[0m	
[0m: 30% done [0m	[0m00:01:14 left[0m	
[0m: 35% done [0m	[0m00:01:09 left[0m	
[0m: 40% done [0m	[0m00:01:04 left[0m	
[0m: 45% done [0m	[0m00:00:58 left[0m	
[0m: 50% done [0m	[0m00:00:53 left[0m	
[0m: 55% done [0m	[0m00:00:48 left[0m	
[0m: 60% done [0m	[0m00:00:43 left[0m	
[0m: 65% done [0m	[0m00:00:37 left[0m	
[0m: 70% done [0m	[0m00:00:32 left[0m	
[0m: 75% done [0m	[0m00:00:27 left[0m	
[0m: 80% done [0m	[0m00:00:21 left[0m	
[0m: 85% done [0m	[0m00:00:16 left[0m	
[0m: 90% done [0m	[0m00:00:11 left[0m	
[0m: 95% done [0m	[0m00:00:05 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:01:47[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 19.003221853682%[0m	
[0m: average rowUcol correct (VOC measure): 10.906176446098%[0m	
[0m: > global correct: 18.951368618164%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.4343819618225 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.4945478439331 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.5585899353027 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 6[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:14:54 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:13:55 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:13:17 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:12:34 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:11:48 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:11:03 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:10:19 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:09:34 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:08:48 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:04 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:07:19 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:06:34 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:05:53 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:08 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:22 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:03:37 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:02:53 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:08 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:22 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:38 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 6[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:14:56[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 63.792604709616%[0m	
[0m: average rowUcol correct (VOC measure): 47.082495689392%[0m	
[0m: > global correct: 63.742948788851%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:02:03 left[0m	
[0m: 5% done [0m	[0m00:01:29 left[0m	
[0m: 10% done [0m	[0m00:01:31 left[0m	
[0m: 15% done [0m	[0m00:01:27 left[0m	
[0m: 20% done [0m	[0m00:01:22 left[0m	
[0m: 25% done [0m	[0m00:01:17 left[0m	
[0m: 30% done [0m	[0m00:01:13 left[0m	
[0m: 35% done [0m	[0m00:01:08 left[0m	
[0m: 40% done [0m	[0m00:01:03 left[0m	
[0m: 45% done [0m	[0m00:00:57 left[0m	
[0m: 50% done [0m	[0m00:00:52 left[0m	
[0m: 55% done [0m	[0m00:00:47 left[0m	
[0m: 60% done [0m	[0m00:00:42 left[0m	
[0m: 65% done [0m	[0m00:00:37 left[0m	
[0m: 70% done [0m	[0m00:00:32 left[0m	
[0m: 75% done [0m	[0m00:00:27 left[0m	
[0m: 80% done [0m	[0m00:00:22 left[0m	
[0m: 85% done [0m	[0m00:00:16 left[0m	
[0m: 90% done [0m	[0m00:00:11 left[0m	
[0m: 95% done [0m	[0m00:00:05 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:01:48[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 21.428295638007%[0m	
[0m: average rowUcol correct (VOC measure): 12.306774876053%[0m	
[0m: > global correct: 21.336123808999%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.3957200050354 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.4561059474945 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.5181901454926 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 7[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:15:40 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:14:17 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:13:41 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:04 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:18 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:11:31 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:10:47 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:02 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:14 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:27 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:07:42 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:06:54 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:08 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:21 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:34 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:03:47 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:01 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:14 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:26 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:39 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 7[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:15:38[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 65.162312984467%[0m	
[0m: average rowUcol correct (VOC measure): 48.525681619597%[0m	
[0m: > global correct: 65.113095896472%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:01:59 left[0m	
[0m: 5% done [0m	[0m00:01:29 left[0m	
[0m: 10% done [0m	[0m00:01:36 left[0m	
[0m: 15% done [0m	[0m00:01:33 left[0m	
[0m: 20% done [0m	[0m00:01:30 left[0m	
[0m: 25% done [0m	[0m00:01:25 left[0m	
[0m: 30% done [0m	[0m00:01:20 left[0m	
[0m: 35% done [0m	[0m00:01:14 left[0m	
[0m: 40% done [0m	[0m00:01:09 left[0m	
[0m: 45% done [0m	[0m00:01:03 left[0m	
[0m: 50% done [0m	[0m00:00:57 left[0m	
[0m: 55% done [0m	[0m00:00:52 left[0m	
[0m: 60% done [0m	[0m00:00:46 left[0m	
[0m: 65% done [0m	[0m00:00:40 left[0m	
[0m: 70% done [0m	[0m00:00:35 left[0m	
[0m: 75% done [0m	[0m00:00:29 left[0m	
[0m: 80% done [0m	[0m00:00:23 left[0m	
[0m: 85% done [0m	[0m00:00:17 left[0m	
[0m: 90% done [0m	[0m00:00:12 left[0m	
[0m: 95% done [0m	[0m00:00:06 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:01:56[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 18.581880597711%[0m	
[0m: average rowUcol correct (VOC measure): 10.657614804251%[0m	
[0m: > global correct: 18.494244643939%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.4001359939575 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.472265958786 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.5387539863586 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 8[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:15:55 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:14:41 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:13:58 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:11 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:23 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:11:35 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:10:49 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:03 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:14 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:29 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:07:43 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:06:56 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:08 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:22 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:34 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:03:47 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:01 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:14 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:26 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:39 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 8[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:15:39[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 65.857503142687%[0m	
[0m: average rowUcol correct (VOC measure): 49.343872512921%[0m	
[0m: > global correct: 65.804391107178%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:01:53 left[0m	
[0m: 5% done [0m	[0m00:01:34 left[0m	
[0m: 10% done [0m	[0m00:01:39 left[0m	
[0m: 15% done [0m	[0m00:01:34 left[0m	
[0m: 20% done [0m	[0m00:01:30 left[0m	
[0m: 25% done [0m	[0m00:01:25 left[0m	
[0m: 30% done [0m	[0m00:01:20 left[0m	
[0m: 35% done [0m	[0m00:01:14 left[0m	
[0m: 40% done [0m	[0m00:01:09 left[0m	
[0m: 45% done [0m	[0m00:01:03 left[0m	
[0m: 50% done [0m	[0m00:00:57 left[0m	
[0m: 55% done [0m	[0m00:00:52 left[0m	
[0m: 60% done [0m	[0m00:00:47 left[0m	
[0m: 65% done [0m	[0m00:00:41 left[0m	
[0m: 70% done [0m	[0m00:00:35 left[0m	
[0m: 75% done [0m	[0m00:00:29 left[0m	
[0m: 80% done [0m	[0m00:00:23 left[0m	
[0m: 85% done [0m	[0m00:00:17 left[0m	
[0m: 90% done [0m	[0m00:00:12 left[0m	
[0m: 95% done [0m	[0m00:00:06 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:01:56[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 18.042181478352%[0m	
[0m: average rowUcol correct (VOC measure): 10.442165182074%[0m	
[0m: > global correct: 18.020598116429%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.4364798069 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.5049638748169 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.5665309429169 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 9[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:15:42 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:14:47 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:13:57 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:08 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:19 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:11:34 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:10:50 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:03 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:15 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:28 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:07:41 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:06:53 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:07 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:20 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:33 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:03:47 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:01 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:14 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:26 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:40 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 9[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:15:44[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 66.902059316635%[0m	
[0m: average rowUcol correct (VOC measure): 50.500637883007%[0m	
[0m: > global correct: 66.857925008296%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:01:41 left[0m	
[0m: 5% done [0m	[0m00:01:36 left[0m	
[0m: 10% done [0m	[0m00:01:43 left[0m	
[0m: 15% done [0m	[0m00:01:40 left[0m	
[0m: 20% done [0m	[0m00:01:33 left[0m	
[0m: 25% done [0m	[0m00:01:29 left[0m	
[0m: 30% done [0m	[0m00:01:24 left[0m	
[0m: 35% done [0m	[0m00:01:17 left[0m	
[0m: 40% done [0m	[0m00:01:11 left[0m	
[0m: 45% done [0m	[0m00:01:06 left[0m	
[0m: 50% done [0m	[0m00:01:00 left[0m	
[0m: 55% done [0m	[0m00:00:54 left[0m	
[0m: 60% done [0m	[0m00:00:48 left[0m	
[0m: 65% done [0m	[0m00:00:42 left[0m	
[0m: 70% done [0m	[0m00:00:36 left[0m	
[0m: 75% done [0m	[0m00:00:30 left[0m	
[0m: 80% done [0m	[0m00:00:24 left[0m	
[0m: 85% done [0m	[0m00:00:18 left[0m	
[0m: 90% done [0m	[0m00:00:12 left[0m	
[0m: 95% done [0m	[0m00:00:06 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:02:00[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 20.125382150164%[0m	
[0m: average rowUcol correct (VOC measure): 11.896266356701%[0m	
[0m: > global correct: 20.069394723798%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.350574016571 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.4113318920135 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.4735748767853 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 10[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:15:13 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:15:00 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:14:17 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:27 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:35 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:11:45 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:10:58 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:10 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:21 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:34 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:07:47 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:07:02 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:15 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:27 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:38 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:03:51 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:03 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:16 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:27 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:40 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 10[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:15:53[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 69.03518934061%[0m	
[0m: average rowUcol correct (VOC measure): 52.978671777366%[0m	
[0m: > global correct: 68.992644618958%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:02:22 left[0m	
[0m: 5% done [0m	[0m00:01:45 left[0m	
[0m: 10% done [0m	[0m00:01:42 left[0m	
[0m: 15% done [0m	[0m00:01:40 left[0m	
[0m: 20% done [0m	[0m00:01:34 left[0m	
[0m: 25% done [0m	[0m00:01:28 left[0m	
[0m: 30% done [0m	[0m00:01:23 left[0m	
[0m: 35% done [0m	[0m00:01:17 left[0m	
[0m: 40% done [0m	[0m00:01:11 left[0m	
[0m: 45% done [0m	[0m00:01:05 left[0m	
[0m: 50% done [0m	[0m00:00:59 left[0m	
[0m: 55% done [0m	[0m00:00:54 left[0m	
[0m: 60% done [0m	[0m00:00:48 left[0m	
[0m: 65% done [0m	[0m00:00:42 left[0m	
[0m: 70% done [0m	[0m00:00:36 left[0m	
[0m: 75% done [0m	[0m00:00:30 left[0m	
[0m: 80% done [0m	[0m00:00:24 left[0m	
[0m: 85% done [0m	[0m00:00:18 left[0m	
[0m: 90% done [0m	[0m00:00:12 left[0m	
[0m: 95% done [0m	[0m00:00:06 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:02:01[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 23.223762922358%[0m	
[0m: average rowUcol correct (VOC measure): 13.42051441938%[0m	
[0m: > global correct: 23.153604670375%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.4369277954102 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.4980108737946 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.5592248439789 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 11[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:16:00 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:15:13 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:14:22 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:32 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:46 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:12:32 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:11:39 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:47 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:57 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:09:11 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:08:22 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:07:31 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:41 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:52 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:05:07 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:04:14 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:21 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:35 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:39 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:45 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 11[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:17:45[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 69.294534697391%[0m	
[0m: average rowUcol correct (VOC measure): 53.248068100155%[0m	
[0m: > global correct: 69.262249751134%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:02:04 left[0m	
[0m: 5% done [0m	[0m00:01:36 left[0m	
[0m: 10% done [0m	[0m00:01:36 left[0m	
[0m: 15% done [0m	[0m00:01:34 left[0m	
[0m: 20% done [0m	[0m00:01:30 left[0m	
[0m: 25% done [0m	[0m00:01:23 left[0m	
[0m: 30% done [0m	[0m00:01:18 left[0m	
[0m: 35% done [0m	[0m00:01:12 left[0m	
[0m: 40% done [0m	[0m00:01:07 left[0m	
[0m: 45% done [0m	[0m00:01:01 left[0m	
[0m: 50% done [0m	[0m00:00:56 left[0m	
[0m: 55% done [0m	[0m00:00:50 left[0m	
[0m: 60% done [0m	[0m00:00:45 left[0m	
[0m: 65% done [0m	[0m00:00:39 left[0m	
[0m: 70% done [0m	[0m00:00:34 left[0m	
[0m: 75% done [0m	[0m00:00:28 left[0m	
[0m: 80% done [0m	[0m00:00:23 left[0m	
[0m: 85% done [0m	[0m00:00:17 left[0m	
[0m: 90% done [0m	[0m00:00:11 left[0m	
[0m: 95% done [0m	[0m00:00:06 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:01:54[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 22.458177118903%[0m	
[0m: average rowUcol correct (VOC measure): 13.054937456209%[0m	
[0m: > global correct: 22.371537148207%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.4208011627197 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.4816770553589 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.5432629585266 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 12[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:15:17 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:14:51 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:14:07 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:19 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:30 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:11:41 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:10:54 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:07 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:18 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:31 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:07:45 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:06:56 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:10 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:23 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:34 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:03:48 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:01 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:14 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:26 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:40 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 12[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:15:41[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 69.828141148728%[0m	
[0m: average rowUcol correct (VOC measure): 53.854205909342%[0m	
[0m: > global correct: 69.790399292114%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:01:45 left[0m	
[0m: 5% done [0m	[0m00:01:36 left[0m	
[0m: 10% done [0m	[0m00:01:38 left[0m	
[0m: 15% done [0m	[0m00:01:33 left[0m	
[0m: 20% done [0m	[0m00:01:30 left[0m	
[0m: 25% done [0m	[0m00:01:24 left[0m	
[0m: 30% done [0m	[0m00:01:19 left[0m	
[0m: 35% done [0m	[0m00:01:13 left[0m	
[0m: 40% done [0m	[0m00:01:08 left[0m	
[0m: 45% done [0m	[0m00:01:02 left[0m	
[0m: 50% done [0m	[0m00:00:57 left[0m	
[0m: 55% done [0m	[0m00:00:51 left[0m	
[0m: 60% done [0m	[0m00:00:46 left[0m	
[0m: 65% done [0m	[0m00:00:40 left[0m	
[0m: 70% done [0m	[0m00:00:35 left[0m	
[0m: 75% done [0m	[0m00:00:29 left[0m	
[0m: 80% done [0m	[0m00:00:23 left[0m	
[0m: 85% done [0m	[0m00:00:17 left[0m	
[0m: 90% done [0m	[0m00:00:12 left[0m	
[0m: 95% done [0m	[0m00:00:06 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:01:55[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 23.132166023007%[0m	
[0m: average rowUcol correct (VOC measure): 13.489442097374%[0m	
[0m: > global correct: 23.026931761855%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.4564900398254 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.5174288749695 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.5805158615112 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 13[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:15:26 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:14:57 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:14:07 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:20 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:31 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:11:42 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:10:56 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:09 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:21 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:34 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:07:48 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:07:00 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:12 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:25 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:36 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:03:49 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:03 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:16 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:27 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:40 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 13[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:15:48[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 70.666669973052%[0m	
[0m: average rowUcol correct (VOC measure): 54.889407429365%[0m	
[0m: > global correct: 70.626866497069%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:01:58 left[0m	
[0m: 5% done [0m	[0m00:01:31 left[0m	
[0m: 10% done [0m	[0m00:01:35 left[0m	
[0m: 15% done [0m	[0m00:01:31 left[0m	
[0m: 20% done [0m	[0m00:01:28 left[0m	
[0m: 25% done [0m	[0m00:01:24 left[0m	
[0m: 30% done [0m	[0m00:01:19 left[0m	
[0m: 35% done [0m	[0m00:01:13 left[0m	
[0m: 40% done [0m	[0m00:01:07 left[0m	
[0m: 45% done [0m	[0m00:01:02 left[0m	
[0m: 50% done [0m	[0m00:00:56 left[0m	
[0m: 55% done [0m	[0m00:00:51 left[0m	
[0m: 60% done [0m	[0m00:00:45 left[0m	
[0m: 65% done [0m	[0m00:00:39 left[0m	
[0m: 70% done [0m	[0m00:00:34 left[0m	
[0m: 75% done [0m	[0m00:00:28 left[0m	
[0m: 80% done [0m	[0m00:00:23 left[0m	
[0m: 85% done [0m	[0m00:00:17 left[0m	
[0m: 90% done [0m	[0m00:00:11 left[0m	
[0m: 95% done [0m	[0m00:00:06 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:01:53[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 22.674611314098%[0m	
[0m: average rowUcol correct (VOC measure): 13.035380301794%[0m	
[0m: > global correct: 22.597345376439%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.4033761024475 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.4699051380157 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.5377540588379 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 14[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:15:30 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:14:56 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:14:07 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:25 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:36 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:11:47 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:10:57 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:09 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:20 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:32 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:07:45 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:06:57 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:11 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:24 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:35 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:03:48 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:01 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:14 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:26 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:40 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 14[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:15:40[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 71.183989543726%[0m	
[0m: average rowUcol correct (VOC measure): 55.477292909481%[0m	
[0m: > global correct: 71.143955314678%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:01:53 left[0m	
[0m: 5% done [0m	[0m00:01:38 left[0m	
[0m: 10% done [0m	[0m00:01:36 left[0m	
[0m: 15% done [0m	[0m00:01:35 left[0m	
[0m: 20% done [0m	[0m00:01:30 left[0m	
[0m: 25% done [0m	[0m00:01:25 left[0m	
[0m: 30% done [0m	[0m00:01:20 left[0m	
[0m: 35% done [0m	[0m00:01:14 left[0m	
[0m: 40% done [0m	[0m00:01:09 left[0m	
[0m: 45% done [0m	[0m00:01:04 left[0m	
[0m: 50% done [0m	[0m00:00:58 left[0m	
[0m: 55% done [0m	[0m00:00:52 left[0m	
[0m: 60% done [0m	[0m00:00:47 left[0m	
[0m: 65% done [0m	[0m00:00:41 left[0m	
[0m: 70% done [0m	[0m00:00:35 left[0m	
[0m: 75% done [0m	[0m00:00:29 left[0m	
[0m: 80% done [0m	[0m00:00:23 left[0m	
[0m: 85% done [0m	[0m00:00:18 left[0m	
[0m: 90% done [0m	[0m00:00:12 left[0m	
[0m: 95% done [0m	[0m00:00:06 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:01:57[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 21.378806805109%[0m	
[0m: average rowUcol correct (VOC measure): 12.226050059394%[0m	
[0m: > global correct: 21.264526078097%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.4133229255676 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.4838209152222 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.5515909194946 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 15[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:17:19 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:14:53 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:14:12 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:18 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:29 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:11:44 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:10:56 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:13 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:24 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:38 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:07:51 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:07:03 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:16 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:29 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:40 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:03:52 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:05 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:17 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:29 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:41 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 15[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:16:14[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 71.323891677479%[0m	
[0m: average rowUcol correct (VOC measure): 55.631031081228%[0m	
[0m: > global correct: 71.279449175976%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:02:24 left[0m	
[0m: 5% done [0m	[0m00:02:07 left[0m	
[0m: 10% done [0m	[0m00:02:14 left[0m	
[0m: 15% done [0m	[0m00:01:58 left[0m	
[0m: 20% done [0m	[0m00:01:48 left[0m	
[0m: 25% done [0m	[0m00:01:43 left[0m	
[0m: 30% done [0m	[0m00:01:35 left[0m	
[0m: 35% done [0m	[0m00:01:27 left[0m	
[0m: 40% done [0m	[0m00:01:20 left[0m	
[0m: 45% done [0m	[0m00:01:13 left[0m	
[0m: 50% done [0m	[0m00:01:06 left[0m	
[0m: 55% done [0m	[0m00:00:59 left[0m	
[0m: 60% done [0m	[0m00:00:52 left[0m	
[0m: 65% done [0m	[0m00:00:46 left[0m	
[0m: 70% done [0m	[0m00:00:39 left[0m	
[0m: 75% done [0m	[0m00:00:33 left[0m	
[0m: 80% done [0m	[0m00:00:27 left[0m	
[0m: 85% done [0m	[0m00:00:20 left[0m	
[0m: 90% done [0m	[0m00:00:13 left[0m	
[0m: 95% done [0m	[0m00:00:07 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:02:14[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 22.911573142403%[0m	
[0m: average rowUcol correct (VOC measure): 13.088329103176%[0m	
[0m: > global correct: 22.828661122432%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.4115250110626 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.4692060947418 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.5376670360565 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 16[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:17:30 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:16:37 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:15:44 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:14:49 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:13:55 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:13:54 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:12:44 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:11:40 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:10:37 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:10:24 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:09:18 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:08:13 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:07:13 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:06:14 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:05:15 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:04:20 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:25 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:32 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:36 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:44 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 16[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:17:23[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 72.05805117541%[0m	
[0m: average rowUcol correct (VOC measure): 56.542574887228%[0m	
[0m: > global correct: 72.014987280168%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:02:06 left[0m	
[0m: 5% done [0m	[0m00:01:36 left[0m	
[0m: 10% done [0m	[0m00:01:40 left[0m	
[0m: 15% done [0m	[0m00:01:37 left[0m	
[0m: 20% done [0m	[0m00:01:30 left[0m	
[0m: 25% done [0m	[0m00:01:26 left[0m	
[0m: 30% done [0m	[0m00:01:20 left[0m	
[0m: 35% done [0m	[0m00:01:14 left[0m	
[0m: 40% done [0m	[0m00:01:09 left[0m	
[0m: 45% done [0m	[0m00:01:03 left[0m	
[0m: 50% done [0m	[0m00:00:57 left[0m	
[0m: 55% done [0m	[0m00:00:52 left[0m	
[0m: 60% done [0m	[0m00:00:46 left[0m	
[0m: 65% done [0m	[0m00:00:40 left[0m	
[0m: 70% done [0m	[0m00:00:35 left[0m	
[0m: 75% done [0m	[0m00:00:29 left[0m	
[0m: 80% done [0m	[0m00:00:23 left[0m	
[0m: 85% done [0m	[0m00:00:17 left[0m	
[0m: 90% done [0m	[0m00:00:12 left[0m	
[0m: 95% done [0m	[0m00:00:06 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:01:56[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 16.474391949723%[0m	
[0m: average rowUcol correct (VOC measure): 9.1912492501116%[0m	
[0m: > global correct: 16.439940518808%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.4158918857574 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.4834909439087 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.5507140159607 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 17[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:17:07 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:14:53 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:14:01 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:16 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:23 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:11:36 left[0m	

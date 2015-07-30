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
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:10:50 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:05 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:16 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:31 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:07:44 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:06:57 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:11 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:24 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:36 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:03:49 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:02 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:15 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:27 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:40 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 17[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:15:44[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 71.789196458193%[0m	
[0m: average rowUcol correct (VOC measure): 56.206683593221%[0m	
[0m: > global correct: 71.750912509678%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:01:52 left[0m	
[0m: 5% done [0m	[0m00:01:38 left[0m	
[0m: 10% done [0m	[0m00:01:37 left[0m	
[0m: 15% done [0m	[0m00:01:34 left[0m	
[0m: 20% done [0m	[0m00:01:31 left[0m	
[0m: 25% done [0m	[0m00:01:27 left[0m	
[0m: 30% done [0m	[0m00:01:20 left[0m	
[0m: 35% done [0m	[0m00:01:15 left[0m	
[0m: 40% done [0m	[0m00:01:10 left[0m	
[0m: 45% done [0m	[0m00:01:04 left[0m	
[0m: 50% done [0m	[0m00:00:58 left[0m	
[0m: 55% done [0m	[0m00:00:53 left[0m	
[0m: 60% done [0m	[0m00:00:47 left[0m	
[0m: 65% done [0m	[0m00:00:41 left[0m	
[0m: 70% done [0m	[0m00:00:35 left[0m	
[0m: 75% done [0m	[0m00:00:30 left[0m	
[0m: 80% done [0m	[0m00:00:24 left[0m	
[0m: 85% done [0m	[0m00:00:18 left[0m	
[0m: 90% done [0m	[0m00:00:12 left[0m	
[0m: 95% done [0m	[0m00:00:06 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:02:00[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 22.918466917507%[0m	
[0m: average rowUcol correct (VOC measure): 13.181381768519%[0m	
[0m: > global correct: 22.839676157956%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.4356489181519 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.5111439228058 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.5754749774933 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 18[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:17:21 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:15:09 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:14:15 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:28 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:36 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:11:44 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:10:57 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:10 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:22 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:34 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:07:47 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:06:59 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:12 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:25 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:36 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:03:49 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:02 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:16 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:27 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:40 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 18[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:15:50[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 72.786571719859%[0m	
[0m: average rowUcol correct (VOC measure): 57.434653557173%[0m	
[0m: > global correct: 72.74084725141%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:02:01 left[0m	
[0m: 5% done [0m	[0m00:01:31 left[0m	
[0m: 10% done [0m	[0m00:01:38 left[0m	
[0m: 15% done [0m	[0m00:01:37 left[0m	
[0m: 20% done [0m	[0m00:01:32 left[0m	
[0m: 25% done [0m	[0m00:01:27 left[0m	
[0m: 30% done [0m	[0m00:01:22 left[0m	
[0m: 35% done [0m	[0m00:01:17 left[0m	
[0m: 40% done [0m	[0m00:01:10 left[0m	
[0m: 45% done [0m	[0m00:01:05 left[0m	
[0m: 50% done [0m	[0m00:00:59 left[0m	
[0m: 55% done [0m	[0m00:00:53 left[0m	
[0m: 60% done [0m	[0m00:00:47 left[0m	
[0m: 65% done [0m	[0m00:00:41 left[0m	
[0m: 70% done [0m	[0m00:00:35 left[0m	
[0m: 75% done [0m	[0m00:00:29 left[0m	
[0m: 80% done [0m	[0m00:00:24 left[0m	
[0m: 85% done [0m	[0m00:00:18 left[0m	
[0m: 90% done [0m	[0m00:00:12 left[0m	
[0m: 95% done [0m	[0m00:00:06 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:01:59[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 12.656289186919%[0m	
[0m: average rowUcol correct (VOC measure): 7.633614766015%[0m	
[0m: > global correct: 12.650768298728%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.3647201061249 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.4412000179291 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.5137650966644 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 19[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:16:45 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:15:30 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:14:21 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:26 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:35 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:11:46 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:10:56 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:09 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:19 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:31 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:07:44 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:06:56 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:09 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:22 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:34 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:03:47 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:02 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:15 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:27 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:40 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 19[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:15:46[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 70.217619437983%[0m	
[0m: average rowUcol correct (VOC measure): 54.314175071103%[0m	
[0m: > global correct: 70.165081296317%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:01:59 left[0m	
[0m: 5% done [0m	[0m00:01:30 left[0m	
[0m: 10% done [0m	[0m00:01:37 left[0m	
[0m: 15% done [0m	[0m00:01:36 left[0m	
[0m: 20% done [0m	[0m00:01:29 left[0m	
[0m: 25% done [0m	[0m00:01:24 left[0m	
[0m: 30% done [0m	[0m00:01:20 left[0m	
[0m: 35% done [0m	[0m00:01:15 left[0m	
[0m: 40% done [0m	[0m00:01:09 left[0m	
[0m: 45% done [0m	[0m00:01:03 left[0m	
[0m: 50% done [0m	[0m00:00:58 left[0m	
[0m: 55% done [0m	[0m00:00:52 left[0m	
[0m: 60% done [0m	[0m00:00:46 left[0m	
[0m: 65% done [0m	[0m00:00:40 left[0m	
[0m: 70% done [0m	[0m00:00:35 left[0m	
[0m: 75% done [0m	[0m00:00:29 left[0m	
[0m: 80% done [0m	[0m00:00:23 left[0m	
[0m: 85% done [0m	[0m00:00:18 left[0m	
[0m: 90% done [0m	[0m00:00:12 left[0m	
[0m: 95% done [0m	[0m00:00:06 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:01:59[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 19.503348936686%[0m	
[0m: average rowUcol correct (VOC measure): 11.414656810241%[0m	
[0m: > global correct: 19.469075287768%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.3788249492645 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.4447801113129 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.5201179981232 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 20[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:16:19 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:15:20 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:14:31 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:41 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:52 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:12:03 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:11:14 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:25 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:35 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:59 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:08:10 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:07:20 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:30 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:41 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:51 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:04:03 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:13 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:24 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:35 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:44 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 20[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:17:17[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 71.91387686399%[0m	
[0m: average rowUcol correct (VOC measure): 56.374617555354%[0m	
[0m: > global correct: 71.871197876341%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:03:07 left[0m	
[0m: 5% done [0m	[0m00:01:47 left[0m	
[0m: 10% done [0m	[0m00:01:50 left[0m	
[0m: 15% done [0m	[0m00:01:46 left[0m	
[0m: 20% done [0m	[0m00:01:42 left[0m	
[0m: 25% done [0m	[0m00:01:39 left[0m	
[0m: 30% done [0m	[0m00:01:31 left[0m	
[0m: 35% done [0m	[0m00:01:24 left[0m	
[0m: 40% done [0m	[0m00:01:18 left[0m	
[0m: 45% done [0m	[0m00:01:11 left[0m	
[0m: 50% done [0m	[0m00:01:05 left[0m	
[0m: 55% done [0m	[0m00:00:58 left[0m	
[0m: 60% done [0m	[0m00:00:52 left[0m	
[0m: 65% done [0m	[0m00:00:46 left[0m	
[0m: 70% done [0m	[0m00:00:39 left[0m	
[0m: 75% done [0m	[0m00:00:33 left[0m	
[0m: 80% done [0m	[0m00:00:26 left[0m	
[0m: 85% done [0m	[0m00:00:23 left[0m	
[0m: 90% done [0m	[0m00:00:15 left[0m	
[0m: 95% done [0m	[0m00:00:08 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:02:48[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 22.532594476891%[0m	
[0m: average rowUcol correct (VOC measure): 13.101260349302%[0m	
[0m: > global correct: 22.448642396872%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.3462069034576 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.4205238819122 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.4785239696503 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 21[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:18:36 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:15:21 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:14:22 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:33 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:46 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:11:54 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:11:04 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:17 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:26 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:38 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:07:51 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:07:00 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:13 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:26 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:37 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:03:50 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:03 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:16 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:27 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:40 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 21[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:15:49[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 72.469503690701%[0m	
[0m: average rowUcol correct (VOC measure): 57.07448334387%[0m	
[0m: > global correct: 72.415938502378%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:02:05 left[0m	
[0m: 5% done [0m	[0m00:01:38 left[0m	
[0m: 10% done [0m	[0m00:01:35 left[0m	
[0m: 15% done [0m	[0m00:01:32 left[0m	
[0m: 20% done [0m	[0m00:01:29 left[0m	
[0m: 25% done [0m	[0m00:01:24 left[0m	
[0m: 30% done [0m	[0m00:01:19 left[0m	
[0m: 35% done [0m	[0m00:01:14 left[0m	
[0m: 40% done [0m	[0m00:01:09 left[0m	
[0m: 45% done [0m	[0m00:01:03 left[0m	
[0m: 50% done [0m	[0m00:00:58 left[0m	
[0m: 55% done [0m	[0m00:00:52 left[0m	
[0m: 60% done [0m	[0m00:00:46 left[0m	
[0m: 65% done [0m	[0m00:00:41 left[0m	
[0m: 70% done [0m	[0m00:00:35 left[0m	
[0m: 75% done [0m	[0m00:00:29 left[0m	
[0m: 80% done [0m	[0m00:00:23 left[0m	
[0m: 85% done [0m	[0m00:00:17 left[0m	
[0m: 90% done [0m	[0m00:00:12 left[0m	
[0m: 95% done [0m	[0m00:00:06 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:01:57[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 18.572527389641%[0m	
[0m: average rowUcol correct (VOC measure): 10.521890958863%[0m	
[0m: > global correct: 18.499752161701%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.3725118637085 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.4357328414917 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.494236946106 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 22[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:15:11 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:14:44 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:13:51 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:17 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:29 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:11:49 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:11:01 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:13 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:26 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:38 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:07:50 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:07:02 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:15 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:27 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:38 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:03:50 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:03 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:16 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:27 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:40 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 22[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:15:49[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 72.615765167935%[0m	
[0m: average rowUcol correct (VOC measure): 57.246643216303%[0m	
[0m: > global correct: 72.579084172105%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:02:14 left[0m	
[0m: 5% done [0m	[0m00:01:40 left[0m	
[0m: 10% done [0m	[0m00:01:48 left[0m	
[0m: 15% done [0m	[0m00:01:42 left[0m	
[0m: 20% done [0m	[0m00:01:35 left[0m	
[0m: 25% done [0m	[0m00:01:29 left[0m	
[0m: 30% done [0m	[0m00:01:23 left[0m	
[0m: 35% done [0m	[0m00:01:17 left[0m	
[0m: 40% done [0m	[0m00:01:12 left[0m	
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
[0m: Time to test all samples = 00:02:01[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 23.083365774981%[0m	
[0m: average rowUcol correct (VOC measure): 13.318459106849%[0m	
[0m: > global correct: 23.004901690808%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 3.3220620155334 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 3.3894011974335 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 3.4559860229492 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 23[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:18:53 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:15:37 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:14:19 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:36 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:48 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:11:58 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:11:08 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:18 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:28 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:41 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:07:54 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:07:04 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:16 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:29 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:40 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:03:52 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:04 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:17 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:28 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:40 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 23[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:15:55[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 73.200222643295%[0m	
[0m: average rowUcol correct (VOC measure): 57.970124778181%[0m	
[0m: > global correct: 73.162537329941%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:01:58 left[0m	
[0m: 5% done [0m	[0m00:01:34 left[0m	
[0m: 10% done [0m	[0m00:01:40 left[0m	
[0m: 15% done [0m	[0m00:01:38 left[0m	
[0m: 20% done [0m	[0m00:01:31 left[0m	
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
[0m: average row correct: 23.070564630008%[0m	
[0m: average rowUcol correct (VOC measure): 13.308863234845%[0m	
[0m: > global correct: 22.999394173046%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.3894381523132 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.4565300941467 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.5144681930542 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 24[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:15:33 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:14:50 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:14:14 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:25 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:38 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:11:52 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:11:06 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:18 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:24 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:39 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:07:51 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:07:03 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:23 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:34 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:45 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:03:57 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:09 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:20 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:30 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:41 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 24[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:16:19[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 73.588112498274%[0m	
[0m: average rowUcol correct (VOC measure): 58.433227550865%[0m	
[0m: > global correct: 73.548280057516%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:01:52 left[0m	
[0m: 5% done [0m	[0m00:01:39 left[0m	
[0m: 10% done [0m	[0m00:01:44 left[0m	
[0m: 15% done [0m	[0m00:01:41 left[0m	
[0m: 20% done [0m	[0m00:01:35 left[0m	
[0m: 25% done [0m	[0m00:01:34 left[0m	
[0m: 30% done [0m	[0m00:01:29 left[0m	
[0m: 35% done [0m	[0m00:01:22 left[0m	
[0m: 40% done [0m	[0m00:01:16 left[0m	
[0m: 45% done [0m	[0m00:01:09 left[0m	
[0m: 50% done [0m	[0m00:01:14 left[0m	
[0m: 55% done [0m	[0m00:01:06 left[0m	
[0m: 60% done [0m	[0m00:00:58 left[0m	
[0m: 65% done [0m	[0m00:00:50 left[0m	
[0m: 70% done [0m	[0m00:00:43 left[0m	
[0m: 75% done [0m	[0m00:00:35 left[0m	
[0m: 80% done [0m	[0m00:00:28 left[0m	
[0m: 85% done [0m	[0m00:00:21 left[0m	
[0m: 90% done [0m	[0m00:00:14 left[0m	
[0m: 95% done [0m	[0m00:00:07 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:02:19[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 18.761900959924%[0m	
[0m: average rowUcol correct (VOC measure): 10.803886676336%[0m	
[0m: > global correct: 18.681500247838%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.3940300941467 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.4694380760193 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.5417301654816 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 25[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:17:39 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:15:31 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:14:45 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:14:01 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:13:14 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:12:31 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:11:47 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:11:02 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:11:16 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:10:27 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:09:22 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:08:18 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:07:18 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:07:10 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:06:07 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:05:00 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:55 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:52 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:49 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:50 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 25[0m	
[0m: Real time to learn 1 batch = 00:00:02[0m	
[0m: Real time to learn full batch = 00:19:28[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 74.151377807749%[0m	
[0m: average rowUcol correct (VOC measure): 59.144688655834%[0m	
[0m: > global correct: 74.124820263245%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:02:22 left[0m	
[0m: 5% done [0m	[0m00:01:35 left[0m	
[0m: 10% done [0m	[0m00:01:37 left[0m	
[0m: 15% done [0m	[0m00:01:35 left[0m	
[0m: 20% done [0m	[0m00:01:30 left[0m	
[0m: 25% done [0m	[0m00:01:25 left[0m	
[0m: 30% done [0m	[0m00:01:20 left[0m	
[0m: 35% done [0m	[0m00:01:15 left[0m	
[0m: 40% done [0m	[0m00:01:09 left[0m	
[0m: 45% done [0m	[0m00:01:03 left[0m	
[0m: 50% done [0m	[0m00:00:58 left[0m	
[0m: 55% done [0m	[0m00:00:52 left[0m	
[0m: 60% done [0m	[0m00:00:46 left[0m	
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
[0m: average row correct: 18.356166538404%[0m	
[0m: average rowUcol correct (VOC measure): 10.529176516477%[0m	
[0m: > global correct: 18.262928897946%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.3542501926422 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.4258370399475 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.4941201210022 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 26[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:17:35 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:15:13 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:14:18 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:30 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:38 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:11:49 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:11:02 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:13 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:25 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:38 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:07:51 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:07:01 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:14 left[0m	
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
[0m.:. End of Epoch n° 26[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:15:51[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 74.342747194932%[0m	
[0m: average rowUcol correct (VOC measure): 59.385517416614%[0m	
[0m: > global correct: 74.300409246765%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:02:00 left[0m	
[0m: 5% done [0m	[0m00:01:32 left[0m	
[0m: 10% done [0m	[0m00:01:36 left[0m	
[0m: 15% done [0m	[0m00:01:35 left[0m	
[0m: 20% done [0m	[0m00:01:32 left[0m	
[0m: 25% done [0m	[0m00:01:26 left[0m	
[0m: 30% done [0m	[0m00:01:21 left[0m	
[0m: 35% done [0m	[0m00:01:16 left[0m	
[0m: 40% done [0m	[0m00:01:09 left[0m	
[0m: 45% done [0m	[0m00:01:04 left[0m	
[0m: 50% done [0m	[0m00:00:59 left[0m	
[0m: 55% done [0m	[0m00:00:52 left[0m	
[0m: 60% done [0m	[0m00:00:47 left[0m	
[0m: 65% done [0m	[0m00:00:41 left[0m	
[0m: 70% done [0m	[0m00:00:36 left[0m	
[0m: 75% done [0m	[0m00:00:29 left[0m	
[0m: 80% done [0m	[0m00:00:24 left[0m	
[0m: 85% done [0m	[0m00:00:18 left[0m	
[0m: 90% done [0m	[0m00:00:12 left[0m	
[0m: 95% done [0m	[0m00:00:06 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:01:58[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 23.471216872187%[0m	
[0m: average rowUcol correct (VOC measure): 13.575040593301%[0m	
[0m: > global correct: 23.406950487415%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.4141809940338 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.4710841178894 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.5273761749268 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 27[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:15:49 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:14:59 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:14:04 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:17 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:23 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:11:34 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:10:51 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:05 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:17 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:31 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:07:45 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:06:57 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:10 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:23 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:35 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:03:48 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:01 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:15 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:26 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:40 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 27[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:15:43[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 74.871416139131%[0m	
[0m: average rowUcol correct (VOC measure): 60.048535702252%[0m	
[0m: > global correct: 74.829941378166%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:01:54 left[0m	
[0m: 5% done [0m	[0m00:01:45 left[0m	
[0m: 10% done [0m	[0m00:01:40 left[0m	
[0m: 15% done [0m	[0m00:01:36 left[0m	
[0m: 20% done [0m	[0m00:01:31 left[0m	
[0m: 25% done [0m	[0m00:01:27 left[0m	
[0m: 30% done [0m	[0m00:01:21 left[0m	
[0m: 35% done [0m	[0m00:01:16 left[0m	
[0m: 40% done [0m	[0m00:01:10 left[0m	
[0m: 45% done [0m	[0m00:01:04 left[0m	
[0m: 50% done [0m	[0m00:00:58 left[0m	
[0m: 55% done [0m	[0m00:00:53 left[0m	
[0m: 60% done [0m	[0m00:00:47 left[0m	
[0m: 65% done [0m	[0m00:00:41 left[0m	
[0m: 70% done [0m	[0m00:00:35 left[0m	
[0m: 75% done [0m	[0m00:00:29 left[0m	
[0m: 80% done [0m	[0m00:00:23 left[0m	
[0m: 85% done [0m	[0m00:00:18 left[0m	
[0m: 90% done [0m	[0m00:00:12 left[0m	
[0m: 95% done [0m	[0m00:00:06 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:01:56[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 21.48441945636%[0m	
[0m: average rowUcol correct (VOC measure): 12.379039927284%[0m	
[0m: > global correct: 21.407721539902%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.3927710056305 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.4600551128387 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.5178580284119 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 28[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:15:31 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:14:35 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:13:59 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:13 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:23 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:11:38 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:10:52 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:06 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:22 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:37 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:07:49 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:07:02 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:16 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:27 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:38 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:04:17 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:23 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:30 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:36 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:48 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 28[0m	
[0m: Real time to learn 1 batch = 00:00:02[0m	
[0m: Real time to learn full batch = 00:19:31[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 74.883975723002%[0m	
[0m: average rowUcol correct (VOC measure): 60.054794101432%[0m	
[0m: > global correct: 74.845149872802%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:02:36 left[0m	
[0m: 5% done [0m	[0m00:01:33 left[0m	
[0m: 10% done [0m	[0m00:01:39 left[0m	
[0m: 15% done [0m	[0m00:01:35 left[0m	
[0m: 20% done [0m	[0m00:01:29 left[0m	
[0m: 25% done [0m	[0m00:01:25 left[0m	
[0m: 30% done [0m	[0m00:01:20 left[0m	
[0m: 35% done [0m	[0m00:01:14 left[0m	
[0m: 40% done [0m	[0m00:01:09 left[0m	
[0m: 45% done [0m	[0m00:01:04 left[0m	
[0m: 50% done [0m	[0m00:00:58 left[0m	
[0m: 55% done [0m	[0m00:00:53 left[0m	
[0m: 60% done [0m	[0m00:00:47 left[0m	
[0m: 65% done [0m	[0m00:00:41 left[0m	
[0m: 70% done [0m	[0m00:00:35 left[0m	
[0m: 75% done [0m	[0m00:00:30 left[0m	
[0m: 80% done [0m	[0m00:00:24 left[0m	
[0m: 85% done [0m	[0m00:00:18 left[0m	
[0m: 90% done [0m	[0m00:00:12 left[0m	
[0m: 95% done [0m	[0m00:00:06 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:01:58[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 23.218960137946%[0m	
[0m: average rowUcol correct (VOC measure): 13.567555883881%[0m	
[0m: > global correct: 23.148097152613%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.7653841972351 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.8379089832306 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.9061150550842 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 29[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:15:35 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:15:04 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:14:28 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:43 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:53 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:12:05 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:11:16 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:26 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:35 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:52 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:08:26 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:07:34 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:42 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:51 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:58 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:04:07 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:26 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:42 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:51 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:53 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 29[0m	
[0m: Real time to learn 1 batch = 00:00:02[0m	
[0m: Real time to learn full batch = 00:28:11[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 75.285874675996%[0m	
[0m: average rowUcol correct (VOC measure): 60.566363122204%[0m	
[0m: > global correct: 75.246101095012%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:15:37 left[0m	
[0m: 5% done [0m	[0m00:09:42 left[0m	
[0m: 10% done [0m	[0m00:14:40 left[0m	
[0m: 15% done [0m	[0m00:15:03 left[0m	
[0m: 20% done [0m	[0m00:12:11 left[0m	
[0m: 25% done [0m	[0m00:16:35 left[0m	
[0m: 30% done [0m	[0m00:15:43 left[0m	
[0m: 35% done [0m	[0m00:15:30 left[0m	
[0m: 40% done [0m	[0m00:14:43 left[0m	
[0m: 45% done [0m	[0m00:12:54 left[0m	
[0m: 50% done [0m	[0m00:11:27 left[0m	
[0m: 55% done [0m	[0m00:09:38 left[0m	
[0m: 60% done [0m	[0m00:07:56 left[0m	
[0m: 65% done [0m	[0m00:06:28 left[0m	
[0m: 70% done [0m	[0m00:05:12 left[0m	
[0m: 75% done [0m	[0m00:04:05 left[0m	
[0m: 80% done [0m	[0m00:03:07 left[0m	
[0m: 85% done [0m	[0m00:02:14 left[0m	
[0m: 90% done [0m	[0m00:01:26 left[0m	
[0m: 95% done [0m	[0m00:00:43 left[0m	
[0m: 100% done [0m	[0m00:00:03 left[0m	
[0m: Time to test all samples = 00:12:33[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 22.767529134998%[0m	
[0m: average rowUcol correct (VOC measure): 13.174403661696%[0m	
[0m: > global correct: 22.674450625103%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.4745471477509 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.5337221622467 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.592502117157 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 30[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:16:43 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:15:49 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:17:35 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:17:42 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:15:35 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:14:02 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:12:45 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:11:36 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:10:31 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:09:32 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:08:34 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:07:36 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:43 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:49 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:56 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:04:04 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:14 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:23 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:32 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:42 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 30[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:16:34[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 75.54436314224%[0m	
[0m: average rowUcol correct (VOC measure): 60.944071117014%[0m	
[0m: > global correct: 75.504645503816%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:02:04 left[0m	
[0m: 5% done [0m	[0m00:01:40 left[0m	
[0m: 10% done [0m	[0m00:01:44 left[0m	
[0m: 15% done [0m	[0m00:01:39 left[0m	
[0m: 20% done [0m	[0m00:01:34 left[0m	
[0m: 25% done [0m	[0m00:01:28 left[0m	
[0m: 30% done [0m	[0m00:01:23 left[0m	
[0m: 35% done [0m	[0m00:01:17 left[0m	
[0m: 40% done [0m	[0m00:01:11 left[0m	
[0m: 45% done [0m	[0m00:01:06 left[0m	
[0m: 50% done [0m	[0m00:01:00 left[0m	
[0m: 55% done [0m	[0m00:00:55 left[0m	
[0m: 60% done [0m	[0m00:00:49 left[0m	
[0m: 65% done [0m	[0m00:00:43 left[0m	
[0m: 70% done [0m	[0m00:00:37 left[0m	
[0m: 75% done [0m	[0m00:00:30 left[0m	
[0m: 80% done [0m	[0m00:00:24 left[0m	
[0m: 85% done [0m	[0m00:00:18 left[0m	
[0m: 90% done [0m	[0m00:00:12 left[0m	
[0m: 95% done [0m	[0m00:00:06 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:02:01[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 23.743561456109%[0m	
[0m: average rowUcol correct (VOC measure): 13.661770872993%[0m	
[0m: > global correct: 23.660296304456%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.8357930183411 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.8926539421082 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.9499070644379 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 31[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:16:14 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:15:03 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:14:21 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:28 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:56 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:12:07 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:11:21 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:32 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:38 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:47 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:07:59 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:07:08 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:20 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:34 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:44 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:03:56 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:07 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:19 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:29 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:41 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 31[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:16:15[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 75.879866710984%[0m	
[0m: average rowUcol correct (VOC measure): 61.344570629668%[0m	
[0m: > global correct: 75.844762747484%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:02:02 left[0m	
[0m: 5% done [0m	[0m00:01:52 left[0m	
[0m: 10% done [0m	[0m00:01:44 left[0m	
[0m: 15% done [0m	[0m00:01:50 left[0m	
[0m: 20% done [0m	[0m00:01:45 left[0m	
[0m: 25% done [0m	[0m00:01:36 left[0m	
[0m: 30% done [0m	[0m00:01:28 left[0m	
[0m: 35% done [0m	[0m00:01:23 left[0m	
[0m: 40% done [0m	[0m00:01:16 left[0m	
[0m: 45% done [0m	[0m00:01:09 left[0m	
[0m: 50% done [0m	[0m00:01:03 left[0m	
[0m: 55% done [0m	[0m00:00:56 left[0m	
[0m: 60% done [0m	[0m00:00:50 left[0m	
[0m: 65% done [0m	[0m00:00:44 left[0m	
[0m: 70% done [0m	[0m00:00:37 left[0m	
[0m: 75% done [0m	[0m00:00:31 left[0m	
[0m: 80% done [0m	[0m00:00:25 left[0m	
[0m: 85% done [0m	[0m00:00:19 left[0m	
[0m: 90% done [0m	[0m00:00:12 left[0m	
[0m: 95% done [0m	[0m00:00:06 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:02:03[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 23.455304113945%[0m	
[0m: average rowUcol correct (VOC measure): 13.551963139141%[0m	
[0m: > global correct: 23.362890345321%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 3.2267541885376 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 3.292503118515 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 3.3694891929626 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 32[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:15:12 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:15:03 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:14:11 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:23 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:38 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:11:54 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:11:10 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:22 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:34 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:46 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:07:59 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:07:10 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:22 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:34 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:44 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:03:57 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:08 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:20 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:30 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:41 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 32[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:16:20[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 76.341688219864%[0m	
[0m: average rowUcol correct (VOC measure): 61.955926618954%[0m	
[0m: > global correct: 76.309313129079%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:02:00 left[0m	
[0m: 5% done [0m	[0m00:01:52 left[0m	
[0m: 10% done [0m	[0m00:01:49 left[0m	
[0m: 15% done [0m	[0m00:01:43 left[0m	
[0m: 20% done [0m	[0m00:01:38 left[0m	
[0m: 25% done [0m	[0m00:01:32 left[0m	
[0m: 30% done [0m	[0m00:01:25 left[0m	
[0m: 35% done [0m	[0m00:01:19 left[0m	
[0m: 40% done [0m	[0m00:01:13 left[0m	
[0m: 45% done [0m	[0m00:01:07 left[0m	
[0m: 50% done [0m	[0m00:01:01 left[0m	
[0m: 55% done [0m	[0m00:00:55 left[0m	
[0m: 60% done [0m	[0m00:00:49 left[0m	
[0m: 65% done [0m	[0m00:00:43 left[0m	
[0m: 70% done [0m	[0m00:00:37 left[0m	
[0m: 75% done [0m	[0m00:00:30 left[0m	
[0m: 80% done [0m	[0m00:00:25 left[0m	
[0m: 85% done [0m	[0m00:00:18 left[0m	
[0m: 90% done [0m	[0m00:00:12 left[0m	
[0m: 95% done [0m	[0m00:00:06 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:02:04[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 22.59027761693%[0m	
[0m: average rowUcol correct (VOC measure): 13.282452387237%[0m	
[0m: > global correct: 22.514732610013%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.7351169586182 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.8319079875946 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.8975269794464 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 33[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:17:22 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:15:20 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:14:28 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:43 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:53 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:12:09 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:11:22 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:34 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:44 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:54 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:08:05 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:07:14 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:25 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:37 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:47 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:04:02 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:12 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:22 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:31 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:42 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 33[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:16:35[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 76.657538248761%[0m	
[0m: average rowUcol correct (VOC measure): 62.370732131571%[0m	
[0m: > global correct: 76.621778564318%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:06:30 left[0m	
[0m: 5% done [0m	[0m00:01:56 left[0m	
[0m: 10% done [0m	[0m00:01:51 left[0m	
[0m: 15% done [0m	[0m00:01:48 left[0m	
[0m: 20% done [0m	[0m00:01:43 left[0m	
[0m: 25% done [0m	[0m00:01:37 left[0m	
[0m: 30% done [0m	[0m00:01:31 left[0m	
[0m: 35% done [0m	[0m00:01:28 left[0m	
[0m: 40% done [0m	[0m00:01:21 left[0m	
[0m: 45% done [0m	[0m00:01:14 left[0m	
[0m: 50% done [0m	[0m00:01:07 left[0m	
[0m: 55% done [0m	[0m00:01:01 left[0m	
[0m: 60% done [0m	[0m00:00:54 left[0m	
[0m: 65% done [0m	[0m00:00:48 left[0m	
[0m: 70% done [0m	[0m00:00:41 left[0m	
[0m: 75% done [0m	[0m00:00:34 left[0m	
[0m: 80% done [0m	[0m00:00:27 left[0m	
[0m: 85% done [0m	[0m00:00:21 left[0m	
[0m: 90% done [0m	[0m00:00:14 left[0m	
[0m: 95% done [0m	[0m00:00:07 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:02:16[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 23.53787362428%[0m	
[0m: average rowUcol correct (VOC measure): 13.536868495221%[0m	
[0m: > global correct: 23.439995593986%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 3.1588718891144 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 3.2389500141144 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 3.2962839603424 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 34[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:16:42 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:16:03 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:15:49 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:14:52 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:14:34 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:13:54 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:12:45 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:12:18 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:11:15 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:10:11 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:09:08 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:08:06 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:07:09 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:06:18 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:05:31 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:04:32 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:34 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:38 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:41 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:46 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 34[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:18:02[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 76.856571435928%[0m	
[0m: average rowUcol correct (VOC measure): 62.607931795687%[0m	
[0m: > global correct: 76.820871585002%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:01:59 left[0m	
[0m: 5% done [0m	[0m00:01:36 left[0m	
[0m: 10% done [0m	[0m00:01:38 left[0m	
[0m: 15% done [0m	[0m00:01:39 left[0m	
[0m: 20% done [0m	[0m00:01:32 left[0m	
[0m: 25% done [0m	[0m00:01:32 left[0m	
[0m: 30% done [0m	[0m00:01:27 left[0m	
[0m: 35% done [0m	[0m00:01:19 left[0m	
[0m: 40% done [0m	[0m00:01:13 left[0m	
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
[0m: Time to test all samples = 00:01:58[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 22.83877009655%[0m	
[0m: average rowUcol correct (VOC measure): 13.328859763275%[0m	
[0m: > global correct: 22.751555873768%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.4130499362946 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.4695198535919 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.5256428718567 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 35[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:17:45 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:15:08 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:14:37 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:43 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:46 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:11:58 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:11:08 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:17 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:27 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:39 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:07:51 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:07:01 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:14 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:26 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:38 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:03:51 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:04 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:16 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:27 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:40 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 35[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:15:51[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 76.951584013382%[0m	
[0m: average rowUcol correct (VOC measure): 62.762022018433%[0m	
[0m: > global correct: 76.921800685765%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:02:01 left[0m	
[0m: 5% done [0m	[0m00:01:38 left[0m	
[0m: 10% done [0m	[0m00:01:38 left[0m	
[0m: 15% done [0m	[0m00:01:36 left[0m	
[0m: 20% done [0m	[0m00:01:31 left[0m	
[0m: 25% done [0m	[0m00:01:25 left[0m	
[0m: 30% done [0m	[0m00:01:19 left[0m	
[0m: 35% done [0m	[0m00:01:14 left[0m	
[0m: 40% done [0m	[0m00:01:08 left[0m	
[0m: 45% done [0m	[0m00:01:02 left[0m	
[0m: 50% done [0m	[0m00:00:57 left[0m	
[0m: 55% done [0m	[0m00:00:51 left[0m	
[0m: 60% done [0m	[0m00:00:45 left[0m	
[0m: 65% done [0m	[0m00:00:40 left[0m	
[0m: 70% done [0m	[0m00:00:34 left[0m	
[0m: 75% done [0m	[0m00:00:28 left[0m	
[0m: 80% done [0m	[0m00:00:23 left[0m	
[0m: 85% done [0m	[0m00:00:17 left[0m	
[0m: 90% done [0m	[0m00:00:12 left[0m	
[0m: 95% done [0m	[0m00:00:06 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:01:56[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 23.825750013094%[0m	
[0m: average rowUcol correct (VOC measure): 13.624436710731%[0m	
[0m: > global correct: 23.73740155312%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.3871359825134 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.4538669586182 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.5202159881592 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 36[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:15:27 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:14:36 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:13:59 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:14 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:27 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:11:40 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:10:52 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:04 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:17 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:31 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:07:44 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:06:57 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:10 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:24 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:36 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:03:49 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:02 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:15 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:27 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:40 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 36[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:15:43[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 77.677636040319%[0m	
[0m: average rowUcol correct (VOC measure): 63.688679968957%[0m	
[0m: > global correct: 77.653191018693%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:01:59 left[0m	
[0m: 5% done [0m	[0m00:01:43 left[0m	
[0m: 10% done [0m	[0m00:01:38 left[0m	
[0m: 15% done [0m	[0m00:01:34 left[0m	
[0m: 20% done [0m	[0m00:01:29 left[0m	
[0m: 25% done [0m	[0m00:01:25 left[0m	
[0m: 30% done [0m	[0m00:01:19 left[0m	
[0m: 35% done [0m	[0m00:01:14 left[0m	
[0m: 40% done [0m	[0m00:01:09 left[0m	
[0m: 45% done [0m	[0m00:01:03 left[0m	
[0m: 50% done [0m	[0m00:00:57 left[0m	
[0m: 55% done [0m	[0m00:00:52 left[0m	
[0m: 60% done [0m	[0m00:00:46 left[0m	
[0m: 65% done [0m	[0m00:00:40 left[0m	
[0m: 70% done [0m	[0m00:00:34 left[0m	
[0m: 75% done [0m	[0m00:00:29 left[0m	
[0m: 80% done [0m	[0m00:00:23 left[0m	
[0m: 85% done [0m	[0m00:00:17 left[0m	
[0m: 90% done [0m	[0m00:00:12 left[0m	
[0m: 95% done [0m	[0m00:00:06 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:01:56[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 22.774720376376%[0m	
[0m: average rowUcol correct (VOC measure): 13.256007742764%[0m	
[0m: > global correct: 22.685465660627%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.4065170288086 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.4624879360199 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.5187470912933 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 37[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:15:18 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:14:37 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:14:02 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:18 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:28 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:11:42 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:10:58 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:11 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:20 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:34 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:07:47 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:06:59 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:12 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:25 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:36 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:03:50 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:02 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:15 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:27 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:40 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 37[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:15:51[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 77.643851419487%[0m	
[0m: average rowUcol correct (VOC measure): 63.669187656724%[0m	
[0m: > global correct: 77.620008848579%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:02:03 left[0m	
[0m: 5% done [0m	[0m00:01:49 left[0m	
[0m: 10% done [0m	[0m00:01:47 left[0m	
[0m: 15% done [0m	[0m00:01:44 left[0m	
[0m: 20% done [0m	[0m00:01:37 left[0m	
[0m: 25% done [0m	[0m00:01:31 left[0m	
[0m: 30% done [0m	[0m00:01:24 left[0m	
[0m: 35% done [0m	[0m00:01:17 left[0m	
[0m: 40% done [0m	[0m00:01:12 left[0m	
[0m: 45% done [0m	[0m00:01:06 left[0m	
[0m: 50% done [0m	[0m00:01:01 left[0m	
[0m: 55% done [0m	[0m00:00:55 left[0m	
[0m: 60% done [0m	[0m00:00:49 left[0m	
[0m: 65% done [0m	[0m00:00:43 left[0m	
[0m: 70% done [0m	[0m00:00:37 left[0m	
[0m: 75% done [0m	[0m00:00:31 left[0m	
[0m: 80% done [0m	[0m00:00:25 left[0m	
[0m: 85% done [0m	[0m00:00:19 left[0m	
[0m: 90% done [0m	[0m00:00:12 left[0m	
[0m: 95% done [0m	[0m00:00:06 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:02:04[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 16.452082113759%[0m	
[0m: average rowUcol correct (VOC measure): 9.6900273981218%[0m	
[0m: > global correct: 16.35182023462%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.4342539310455 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.5117039680481 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.5787570476532 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 38[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:16:37 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:15:22 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:14:38 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:49 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:57 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:12:37 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:11:41 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:44 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:51 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:09:02 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:08:12 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:07:21 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:31 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:42 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:51 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:04:01 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:12 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:24 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:33 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:43 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 38[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:16:54[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 77.917379730999%[0m	
[0m: average rowUcol correct (VOC measure): 64.013465147207%[0m	
[0m: > global correct: 77.879935847804%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:02:25 left[0m	
[0m: 5% done [0m	[0m00:01:57 left[0m	
[0m: 10% done [0m	[0m00:01:50 left[0m	
[0m: 15% done [0m	[0m00:01:45 left[0m	
[0m: 20% done [0m	[0m00:01:40 left[0m	
[0m: 25% done [0m	[0m00:01:34 left[0m	
[0m: 30% done [0m	[0m00:01:28 left[0m	
[0m: 35% done [0m	[0m00:01:22 left[0m	
[0m: 40% done [0m	[0m00:01:16 left[0m	
[0m: 45% done [0m	[0m00:01:10 left[0m	
[0m: 50% done [0m	[0m00:01:04 left[0m	
[0m: 55% done [0m	[0m00:00:57 left[0m	
[0m: 60% done [0m	[0m00:00:51 left[0m	
[0m: 65% done [0m	[0m00:00:45 left[0m	
[0m: 70% done [0m	[0m00:00:38 left[0m	
[0m: 75% done [0m	[0m00:00:32 left[0m	
[0m: 80% done [0m	[0m00:00:26 left[0m	
[0m: 85% done [0m	[0m00:00:19 left[0m	
[0m: 90% done [0m	[0m00:00:13 left[0m	
[0m: 95% done [0m	[0m00:00:07 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:02:10[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 22.987667294127%[0m	
[0m: average rowUcol correct (VOC measure): 13.275889912159%[0m	
[0m: > global correct: 22.894751335573%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.4009921550751 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.4670131206512 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.5306479930878 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 39[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:17:03 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:15:38 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:14:51 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:58 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:13:12 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:14:13 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:12:56 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:11:47 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:10:38 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:09:40 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:08:44 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:07:44 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:49 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:55 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:05:00 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:04:08 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:16 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:25 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:32 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:42 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 39[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:16:41[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 78.308897620381%[0m	
[0m: average rowUcol correct (VOC measure): 64.534854298771%[0m	
[0m: > global correct: 78.2670611658%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:02:34 left[0m	
[0m: 5% done [0m	[0m00:01:41 left[0m	
[0m: 10% done [0m	[0m00:01:42 left[0m	
[0m: 15% done [0m	[0m00:01:36 left[0m	
[0m: 20% done [0m	[0m00:01:31 left[0m	
[0m: 25% done [0m	[0m00:01:26 left[0m	
[0m: 30% done [0m	[0m00:01:20 left[0m	
[0m: 35% done [0m	[0m00:01:14 left[0m	
[0m: 40% done [0m	[0m00:01:09 left[0m	
[0m: 45% done [0m	[0m00:01:03 left[0m	
[0m: 50% done [0m	[0m00:00:58 left[0m	
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
[0m: average row correct: 20.204780276607%[0m	
[0m: average rowUcol correct (VOC measure): 11.830029817353%[0m	
[0m: > global correct: 20.113454865892%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.3972299098969 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.4534940719604 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.5170760154724 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 40[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:15:39 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:14:39 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:13:57 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:17 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:27 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:11:42 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:10:55 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:10 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:21 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:36 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:07:50 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:07:01 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:14 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:27 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:37 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:03:50 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:03 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:16 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:27 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:40 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 40[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:15:47[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 78.641333379368%[0m	
[0m: average rowUcol correct (VOC measure): 64.980368744029%[0m	
[0m: > global correct: 78.609943590311%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:02:04 left[0m	
[0m: 5% done [0m	[0m00:01:46 left[0m	
[0m: 10% done [0m	[0m00:01:41 left[0m	
[0m: 15% done [0m	[0m00:01:37 left[0m	
[0m: 20% done [0m	[0m00:01:31 left[0m	
[0m: 25% done [0m	[0m00:01:26 left[0m	
[0m: 30% done [0m	[0m00:01:20 left[0m	
[0m: 35% done [0m	[0m00:01:14 left[0m	
[0m: 40% done [0m	[0m00:01:08 left[0m	
[0m: 45% done [0m	[0m00:01:02 left[0m	
[0m: 50% done [0m	[0m00:00:57 left[0m	
[0m: 55% done [0m	[0m00:00:51 left[0m	
[0m: 60% done [0m	[0m00:00:45 left[0m	
[0m: 65% done [0m	[0m00:00:40 left[0m	
[0m: 70% done [0m	[0m00:00:34 left[0m	
[0m: 75% done [0m	[0m00:00:29 left[0m	
[0m: 80% done [0m	[0m00:00:23 left[0m	
[0m: 85% done [0m	[0m00:00:17 left[0m	
[0m: 90% done [0m	[0m00:00:12 left[0m	
[0m: 95% done [0m	[0m00:00:06 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:01:55[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 19.403326282702%[0m	
[0m: average rowUcol correct (VOC measure): 11.327997849572%[0m	
[0m: > global correct: 19.358924932533%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.4098110198975 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.4809949398041 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.5453999042511 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 41[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:16:03 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:14:45 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:13:58 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:13 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:22 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:11:35 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:10:50 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:04 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:17 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:33 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:07:48 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:06:59 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:13 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:26 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:37 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:03:50 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:03 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:16 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:27 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:40 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 41[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:15:47[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 78.779879477945%[0m	
[0m: average rowUcol correct (VOC measure): 65.16763680052%[0m	
[0m: > global correct: 78.746820042031%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:01:59 left[0m	
[0m: 5% done [0m	[0m00:01:39 left[0m	
[0m: 10% done [0m	[0m00:01:37 left[0m	
[0m: 15% done [0m	[0m00:01:34 left[0m	
[0m: 20% done [0m	[0m00:01:30 left[0m	
[0m: 25% done [0m	[0m00:01:24 left[0m	
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
[0m: Time to test all samples = 00:01:57[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 23.784823597658%[0m	
[0m: average rowUcol correct (VOC measure): 13.672638961142%[0m	
[0m: > global correct: 23.70435644655%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.4147090911865 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.4830050468445 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.5529789924622 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 42[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:17:04 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:14:50 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:14:01 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:11 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:27 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:11:41 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:10:58 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:11 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:22 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:36 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:07:49 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:07:01 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:14 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:27 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:39 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:03:52 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:04 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:17 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:29 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:41 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 42[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:16:07[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 79.083489545501%[0m	
[0m: average rowUcol correct (VOC measure): 65.593151113775%[0m	
[0m: > global correct: 79.056520296427%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:01:59 left[0m	
[0m: 5% done [0m	[0m00:01:37 left[0m	
[0m: 10% done [0m	[0m00:01:35 left[0m	
[0m: 15% done [0m	[0m00:01:33 left[0m	
[0m: 20% done [0m	[0m00:01:29 left[0m	
[0m: 25% done [0m	[0m00:01:23 left[0m	
[0m: 30% done [0m	[0m00:01:19 left[0m	
[0m: 35% done [0m	[0m00:01:14 left[0m	
[0m: 40% done [0m	[0m00:01:09 left[0m	
[0m: 45% done [0m	[0m00:01:04 left[0m	
[0m: 50% done [0m	[0m00:00:59 left[0m	
[0m: 55% done [0m	[0m00:00:53 left[0m	
[0m: 60% done [0m	[0m00:00:47 left[0m	
[0m: 65% done [0m	[0m00:00:42 left[0m	
[0m: 70% done [0m	[0m00:00:36 left[0m	
[0m: 75% done [0m	[0m00:00:30 left[0m	
[0m: 80% done [0m	[0m00:00:24 left[0m	
[0m: 85% done [0m	[0m00:00:18 left[0m	
[0m: 90% done [0m	[0m00:00:12 left[0m	
[0m: 95% done [0m	[0m00:00:06 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:02:04[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 23.195557974943%[0m	
[0m: average rowUcol correct (VOC measure): 13.554515730184%[0m	
[0m: > global correct: 23.109544528281%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.4572818279266 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.5241210460663 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.5824108123779 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 43[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:16:13 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:15:43 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:14:52 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:14:01 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:13:11 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:12:24 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:11:32 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:42 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:10:17 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:09:19 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:08:26 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:07:33 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:40 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:49 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:56 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:04:05 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:15 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:24 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:33 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:44 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 43[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:17:26[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 79.27214001665%[0m	
[0m: average rowUcol correct (VOC measure): 65.818687299691%[0m	
[0m: > global correct: 79.243170003318%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:02:03 left[0m	
[0m: 5% done [0m	[0m00:01:33 left[0m	
[0m: 10% done [0m	[0m00:01:38 left[0m	
[0m: 15% done [0m	[0m00:01:34 left[0m	
[0m: 20% done [0m	[0m00:01:29 left[0m	
[0m: 25% done [0m	[0m00:01:24 left[0m	
[0m: 30% done [0m	[0m00:01:19 left[0m	
[0m: 35% done [0m	[0m00:01:13 left[0m	
[0m: 40% done [0m	[0m00:01:08 left[0m	
[0m: 45% done [0m	[0m00:01:02 left[0m	
[0m: 50% done [0m	[0m00:00:56 left[0m	
[0m: 55% done [0m	[0m00:00:51 left[0m	
[0m: 60% done [0m	[0m00:00:45 left[0m	
[0m: 65% done [0m	[0m00:00:40 left[0m	
[0m: 70% done [0m	[0m00:00:34 left[0m	
[0m: 75% done [0m	[0m00:00:29 left[0m	
[0m: 80% done [0m	[0m00:00:23 left[0m	
[0m: 85% done [0m	[0m00:00:17 left[0m	
[0m: 90% done [0m	[0m00:00:12 left[0m	
[0m: 95% done [0m	[0m00:00:06 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:01:55[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 22.380156158516%[0m	
[0m: average rowUcol correct (VOC measure): 12.94545385212%[0m	
[0m: > global correct: 22.283416864019%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.406877040863 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.4627981185913 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.5189571380615 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 44[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:15:25 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:15:01 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:14:19 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:24 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:33 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:11:45 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:10:59 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:10 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:22 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:35 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:07:47 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:06:58 left[0m	
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
[0m: 86% done[0m	[0m00:02:15 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:26 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:40 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 44[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:15:41[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 79.58512825541%[0m	
[0m: average rowUcol correct (VOC measure): 66.266802395924%[0m	
[0m: > global correct: 79.558400619401%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:01:59 left[0m	
[0m: 5% done [0m	[0m00:01:30 left[0m	
[0m: 10% done [0m	[0m00:01:32 left[0m	
[0m: 15% done [0m	[0m00:01:31 left[0m	
[0m: 20% done [0m	[0m00:01:27 left[0m	
[0m: 25% done [0m	[0m00:01:22 left[0m	
[0m: 30% done [0m	[0m00:01:18 left[0m	
[0m: 35% done [0m	[0m00:01:13 left[0m	
[0m: 40% done [0m	[0m00:01:08 left[0m	
[0m: 45% done [0m	[0m00:01:02 left[0m	
[0m: 50% done [0m	[0m00:00:57 left[0m	
[0m: 55% done [0m	[0m00:00:51 left[0m	
[0m: 60% done [0m	[0m00:00:46 left[0m	
[0m: 65% done [0m	[0m00:00:40 left[0m	
[0m: 70% done [0m	[0m00:00:34 left[0m	
[0m: 75% done [0m	[0m00:00:29 left[0m	
[0m: 80% done [0m	[0m00:00:23 left[0m	
[0m: 85% done [0m	[0m00:00:17 left[0m	
[0m: 90% done [0m	[0m00:00:11 left[0m	
[0m: 95% done [0m	[0m00:00:06 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:01:55[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 24.061569696901%[0m	
[0m: average rowUcol correct (VOC measure): 13.796143171073%[0m	
[0m: > global correct: 23.979732334637%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.3930978775024 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.4547338485718 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.5106070041656 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 45[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:15:17 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:14:58 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:14:03 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:14 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:23 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:11:34 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:10:49 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:04 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:16 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:31 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:07:44 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:06:55 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:09 left[0m	
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
[0m.:. End of Epoch n° 45[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:15:38[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 79.828102871923%[0m	
[0m: average rowUcol correct (VOC measure): 66.579793644424%[0m	
[0m: > global correct: 79.798971352726%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:02:19 left[0m	
[0m: 5% done [0m	[0m00:01:45 left[0m	
[0m: 10% done [0m	[0m00:01:40 left[0m	
[0m: 15% done [0m	[0m00:01:34 left[0m	
[0m: 20% done [0m	[0m00:01:30 left[0m	
[0m: 25% done [0m	[0m00:01:25 left[0m	
[0m: 30% done [0m	[0m00:01:19 left[0m	
[0m: 35% done [0m	[0m00:01:14 left[0m	
[0m: 40% done [0m	[0m00:01:09 left[0m	
[0m: 45% done [0m	[0m00:01:03 left[0m	
[0m: 50% done [0m	[0m00:00:58 left[0m	
[0m: 55% done [0m	[0m00:00:52 left[0m	
[0m: 60% done [0m	[0m00:00:46 left[0m	
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
[0m: average row correct: 23.353820869533%[0m	
[0m: average rowUcol correct (VOC measure): 13.454655118951%[0m	
[0m: > global correct: 23.280277578895%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.3937251567841 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.4661710262299 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.5315461158752 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 46[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:16:17 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:14:43 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:13:54 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:13 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:28 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:11:42 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:10:55 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:08 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:19 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:32 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:07:44 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:06:56 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:09 left[0m	
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
[0m.:. End of Epoch n° 46[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:15:35[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 79.958800514146%[0m	
[0m: average rowUcol correct (VOC measure): 66.77478569569%[0m	
[0m: > global correct: 79.934465214025%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:01:51 left[0m	
[0m: 5% done [0m	[0m00:01:36 left[0m	
[0m: 10% done [0m	[0m00:01:38 left[0m	
[0m: 15% done [0m	[0m00:01:34 left[0m	
[0m: 20% done [0m	[0m00:01:28 left[0m	
[0m: 25% done [0m	[0m00:01:24 left[0m	
[0m: 30% done [0m	[0m00:01:18 left[0m	
[0m: 35% done [0m	[0m00:01:12 left[0m	
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
[0m: Time to test all samples = 00:01:55[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 21.687553373009%[0m	
[0m: average rowUcol correct (VOC measure): 12.556132519304%[0m	
[0m: > global correct: 21.594977143801%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.4116110801697 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.479572057724 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.5472118854523 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 47[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:17:07 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:15:18 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:14:36 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:43 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:53 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:12:10 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:11:20 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:29 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:39 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:09:02 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:08:11 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:07:17 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:28 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:38 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:48 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:03:59 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:10 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:21 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:31 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:42 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 47[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:16:28[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 80.220807837968%[0m	
[0m: average rowUcol correct (VOC measure): 67.143120506022%[0m	
[0m: > global correct: 80.187479261144%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:02:31 left[0m	
[0m: 5% done [0m	[0m00:01:53 left[0m	
[0m: 10% done [0m	[0m00:01:54 left[0m	
[0m: 15% done [0m	[0m00:01:48 left[0m	
[0m: 20% done [0m	[0m00:01:41 left[0m	
[0m: 25% done [0m	[0m00:01:35 left[0m	
[0m: 30% done [0m	[0m00:01:29 left[0m	
[0m: 35% done [0m	[0m00:01:23 left[0m	
[0m: 40% done [0m	[0m00:01:16 left[0m	
[0m: 45% done [0m	[0m00:01:10 left[0m	
[0m: 50% done [0m	[0m00:01:15 left[0m	
[0m: 55% done [0m	[0m00:01:06 left[0m	
[0m: 60% done [0m	[0m00:00:58 left[0m	
[0m: 65% done [0m	[0m00:00:50 left[0m	
[0m: 70% done [0m	[0m00:00:43 left[0m	
[0m: 75% done [0m	[0m00:00:35 left[0m	
[0m: 80% done [0m	[0m00:00:28 left[0m	
[0m: 85% done [0m	[0m00:00:23 left[0m	
[0m: 90% done [0m	[0m00:00:15 left[0m	
[0m: 95% done [0m	[0m00:00:08 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:02:26[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 22.367358539659%[0m	
[0m: average rowUcol correct (VOC measure): 12.821997930803%[0m	
[0m: > global correct: 22.272401828496%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.4028317928314 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.458456993103 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.515243768692 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 48[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:17:01 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:14:51 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:14:21 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:45 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:13:01 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:12:12 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:11:26 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:38 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:48 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:59 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:08:29 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:07:51 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:55 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:59 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:05:03 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:04:10 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:18 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:26 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:33 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:43 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 48[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:16:51[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 80.250534562781%[0m	
[0m: average rowUcol correct (VOC measure): 67.190038626737%[0m	
[0m: > global correct: 80.2234266121%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:02:08 left[0m	
[0m: 5% done [0m	[0m00:01:35 left[0m	
[0m: 10% done [0m	[0m00:01:36 left[0m	
[0m: 15% done [0m	[0m00:01:35 left[0m	
[0m: 20% done [0m	[0m00:01:30 left[0m	
[0m: 25% done [0m	[0m00:01:24 left[0m	
[0m: 30% done [0m	[0m00:01:20 left[0m	
[0m: 35% done [0m	[0m00:01:14 left[0m	
[0m: 40% done [0m	[0m00:01:09 left[0m	
[0m: 45% done [0m	[0m00:01:04 left[0m	
[0m: 50% done [0m	[0m00:00:58 left[0m	
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
[0m: Time to test all samples = 00:01:55[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 23.824198315344%[0m	
[0m: average rowUcol correct (VOC measure): 13.703596071884%[0m	
[0m: > global correct: 23.748416588643%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.3997819423676 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.4545409679413 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.527174949646 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 49[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:15:55 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:14:48 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:14:05 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:16 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:27 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:11:42 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:10:55 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:06 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:18 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:32 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:07:46 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:06:57 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:10 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:23 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:35 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:03:49 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:02 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:15 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:27 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:40 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 49[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:15:45[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 80.562059655048%[0m	
[0m: average rowUcol correct (VOC measure): 67.624785404394%[0m	
[0m: > global correct: 80.538657228183%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:02:54 left[0m	
[0m: 5% done [0m	[0m00:01:47 left[0m	
[0m: 10% done [0m	[0m00:01:38 left[0m	
[0m: 15% done [0m	[0m00:01:35 left[0m	
[0m: 20% done [0m	[0m00:01:31 left[0m	
[0m: 25% done [0m	[0m00:01:25 left[0m	
[0m: 30% done [0m	[0m00:01:20 left[0m	
[0m: 35% done [0m	[0m00:01:15 left[0m	
[0m: 40% done [0m	[0m00:01:10 left[0m	
[0m: 45% done [0m	[0m00:01:04 left[0m	
[0m: 50% done [0m	[0m00:00:58 left[0m	
[0m: 55% done [0m	[0m00:00:53 left[0m	
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
[0m: average row correct: 22.802568669661%[0m	
[0m: average rowUcol correct (VOC measure): 13.278972003425%[0m	
[0m: > global correct: 22.740540838244%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.4434230327606 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.5132999420166 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.5682330131531 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 50[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:17:17 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:14:49 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:13:59 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:13 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:23 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:11:35 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:10:49 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:03 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:15 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:30 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:07:44 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:06:56 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:09 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:23 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:35 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:03:48 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:01 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:15 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:26 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:40 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 50[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:15:44[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 80.650341982889%[0m	
[0m: average rowUcol correct (VOC measure): 67.736516435548%[0m	
[0m: > global correct: 80.625760424732%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:01:59 left[0m	
[0m: 5% done [0m	[0m00:01:46 left[0m	
[0m: 10% done [0m	[0m00:01:40 left[0m	
[0m: 15% done [0m	[0m00:01:38 left[0m	
[0m: 20% done [0m	[0m00:01:34 left[0m	
[0m: 25% done [0m	[0m00:01:27 left[0m	
[0m: 30% done [0m	[0m00:01:22 left[0m	
[0m: 35% done [0m	[0m00:01:16 left[0m	
[0m: 40% done [0m	[0m00:01:10 left[0m	
[0m: 45% done [0m	[0m00:01:05 left[0m	
[0m: 50% done [0m	[0m00:00:59 left[0m	
[0m: 55% done [0m	[0m00:00:53 left[0m	
[0m: 60% done [0m	[0m00:00:47 left[0m	
[0m: 65% done [0m	[0m00:00:41 left[0m	
[0m: 70% done [0m	[0m00:00:36 left[0m	
[0m: 75% done [0m	[0m00:00:30 left[0m	
[0m: 80% done [0m	[0m00:00:24 left[0m	
[0m: 85% done [0m	[0m00:00:18 left[0m	
[0m: 90% done [0m	[0m00:00:12 left[0m	
[0m: 95% done [0m	[0m00:00:06 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:01:59[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 23.23502144306%[0m	
[0m: average rowUcol correct (VOC measure): 13.522221125884%[0m	
[0m: > global correct: 23.148097152613%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.3913049697876 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.4525408744812 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.5172829627991 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 51[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:17:10 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:15:13 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:14:13 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:25 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:38 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:11:51 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:11:04 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:18 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:27 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:40 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:07:52 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:07:03 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:15 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:28 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:39 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:03:52 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:05 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:17 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:28 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:40 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 51[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:16:00[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 80.728382462322%[0m	
[0m: average rowUcol correct (VOC measure): 67.844916039174%[0m	
[0m: > global correct: 80.697655126645%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:01:44 left[0m	
[0m: 5% done [0m	[0m00:01:43 left[0m	
[0m: 10% done [0m	[0m00:01:45 left[0m	
[0m: 15% done [0m	[0m00:01:41 left[0m	
[0m: 20% done [0m	[0m00:01:39 left[0m	
[0m: 25% done [0m	[0m00:01:32 left[0m	
[0m: 30% done [0m	[0m00:01:25 left[0m	
[0m: 35% done [0m	[0m00:01:19 left[0m	
[0m: 40% done [0m	[0m00:01:14 left[0m	
[0m: 45% done [0m	[0m00:01:07 left[0m	
[0m: 50% done [0m	[0m00:01:01 left[0m	
[0m: 55% done [0m	[0m00:00:55 left[0m	
[0m: 60% done [0m	[0m00:00:49 left[0m	
[0m: 65% done [0m	[0m00:00:43 left[0m	
[0m: 70% done [0m	[0m00:00:37 left[0m	
[0m: 75% done [0m	[0m00:00:31 left[0m	
[0m: 80% done [0m	[0m00:00:25 left[0m	
[0m: 85% done [0m	[0m00:00:19 left[0m	
[0m: 90% done [0m	[0m00:00:12 left[0m	
[0m: 95% done [0m	[0m00:00:06 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:02:13[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 22.957492398449%[0m	
[0m: average rowUcol correct (VOC measure): 13.40599621434%[0m	
[0m: > global correct: 22.867213746764%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.3984320163727 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.4710659980774 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.5410327911377 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 52[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:18:06 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:15:42 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:14:26 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:33 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:43 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:12:01 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:11:15 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:30 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:40 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:53 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:08:05 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:07:15 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:33 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:42 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:54 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:04:03 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:13 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:23 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:32 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:42 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 52[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:16:45[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 81.116871019401%[0m	
[0m: average rowUcol correct (VOC measure): 68.391798687453%[0m	
[0m: > global correct: 81.08339785422%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:02:02 left[0m	
[0m: 5% done [0m	[0m00:01:46 left[0m	
[0m: 10% done [0m	[0m00:01:46 left[0m	
[0m: 15% done [0m	[0m00:01:44 left[0m	
[0m: 20% done [0m	[0m00:01:41 left[0m	
[0m: 25% done [0m	[0m00:01:35 left[0m	
[0m: 30% done [0m	[0m00:01:29 left[0m	
[0m: 35% done [0m	[0m00:01:23 left[0m	
[0m: 40% done [0m	[0m00:01:17 left[0m	
[0m: 45% done [0m	[0m00:01:11 left[0m	
[0m: 50% done [0m	[0m00:01:05 left[0m	
[0m: 55% done [0m	[0m00:00:58 left[0m	
[0m: 60% done [0m	[0m00:00:52 left[0m	
[0m: 65% done [0m	[0m00:00:45 left[0m	
[0m: 70% done [0m	[0m00:00:39 left[0m	
[0m: 75% done [0m	[0m00:00:32 left[0m	
[0m: 80% done [0m	[0m00:00:26 left[0m	
[0m: 85% done [0m	[0m00:00:19 left[0m	
[0m: 90% done [0m	[0m00:00:13 left[0m	
[0m: 95% done [0m	[0m00:00:07 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:02:09[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 23.179836829405%[0m	
[0m: average rowUcol correct (VOC measure): 13.415629851936%[0m	
[0m: > global correct: 23.093021974996%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.4147469997406 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.4814579486847 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.5378038883209 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 53[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:17:13 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:15:44 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:17:43 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:17:24 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:15:22 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:13:53 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:12:37 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:11:28 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:10:23 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:09:24 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:08:28 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:07:32 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:39 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:47 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:53 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:04:03 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:12 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:22 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:31 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:42 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 53[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:16:28[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 81.228595676989%[0m	
[0m: average rowUcol correct (VOC measure): 68.534669368574%[0m	
[0m: > global correct: 81.192622497511%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:02:05 left[0m	
[0m: 5% done [0m	[0m00:01:38 left[0m	
[0m: 10% done [0m	[0m00:01:34 left[0m	
[0m: 15% done [0m	[0m00:01:32 left[0m	
[0m: 20% done [0m	[0m00:01:29 left[0m	
[0m: 25% done [0m	[0m00:01:23 left[0m	
[0m: 30% done [0m	[0m00:01:18 left[0m	
[0m: 35% done [0m	[0m00:01:13 left[0m	
[0m: 40% done [0m	[0m00:01:07 left[0m	
[0m: 45% done [0m	[0m00:01:02 left[0m	
[0m: 50% done [0m	[0m00:00:57 left[0m	
[0m: 55% done [0m	[0m00:00:51 left[0m	
[0m: 60% done [0m	[0m00:00:45 left[0m	
[0m: 65% done [0m	[0m00:00:40 left[0m	
[0m: 70% done [0m	[0m00:00:34 left[0m	
[0m: 75% done [0m	[0m00:00:28 left[0m	
[0m: 80% done [0m	[0m00:00:23 left[0m	
[0m: 85% done [0m	[0m00:00:17 left[0m	
[0m: 90% done [0m	[0m00:00:12 left[0m	
[0m: 95% done [0m	[0m00:00:06 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:01:56[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 23.01699108269%[0m	
[0m: average rowUcol correct (VOC measure): 13.406135754125%[0m	
[0m: > global correct: 22.922288924382%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.3896939754486 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.4441440105438 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.4997811317444 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 54[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:15:10 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:14:48 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:14:11 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:18 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:28 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:11:41 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:10:55 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:06 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:18 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:31 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:07:45 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:06:57 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:10 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:23 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:35 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:03:48 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:01 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:15 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:26 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:40 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 54[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:15:41[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 81.696081279528%[0m	
[0m: average rowUcol correct (VOC measure): 69.21185573729%[0m	
[0m: > global correct: 81.673763964163%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:02:00 left[0m	
[0m: 5% done [0m	[0m00:01:33 left[0m	
[0m: 10% done [0m	[0m00:01:37 left[0m	
[0m: 15% done [0m	[0m00:01:33 left[0m	
[0m: 20% done [0m	[0m00:01:28 left[0m	
[0m: 25% done [0m	[0m00:01:23 left[0m	
[0m: 30% done [0m	[0m00:01:18 left[0m	
[0m: 35% done [0m	[0m00:01:13 left[0m	
[0m: 40% done [0m	[0m00:01:07 left[0m	
[0m: 45% done [0m	[0m00:01:02 left[0m	
[0m: 50% done [0m	[0m00:00:57 left[0m	
[0m: 55% done [0m	[0m00:00:51 left[0m	
[0m: 60% done [0m	[0m00:00:46 left[0m	
[0m: 65% done [0m	[0m00:00:40 left[0m	
[0m: 70% done [0m	[0m00:00:34 left[0m	
[0m: 75% done [0m	[0m00:00:29 left[0m	
[0m: 80% done [0m	[0m00:00:23 left[0m	
[0m: 85% done [0m	[0m00:00:17 left[0m	
[0m: 90% done [0m	[0m00:00:12 left[0m	
[0m: 95% done [0m	[0m00:00:06 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:01:56[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 23.725660514123%[0m	
[0m: average rowUcol correct (VOC measure): 13.68514574179%[0m	
[0m: > global correct: 23.632758715647%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.3359260559082 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.4083478450775 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.4750220775604 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 55[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:16:17 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:29:47 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:21:54 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:18:21 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:16:07 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:14:28 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:13:07 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:11:53 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:10:43 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:09:41 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:08:42 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:07:44 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:48 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:54 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:59 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:04:07 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:15 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:24 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:32 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:42 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 55[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:16:42[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 81.711436380254%[0m	
[0m: average rowUcol correct (VOC measure): 69.23534008536%[0m	
[0m: > global correct: 81.686207277956%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:01:55 left[0m	
[0m: 5% done [0m	[0m00:01:32 left[0m	
[0m: 10% done [0m	[0m00:01:35 left[0m	
[0m: 15% done [0m	[0m00:01:33 left[0m	
[0m: 20% done [0m	[0m00:01:28 left[0m	
[0m: 25% done [0m	[0m00:01:23 left[0m	
[0m: 30% done [0m	[0m00:01:19 left[0m	
[0m: 35% done [0m	[0m00:01:13 left[0m	
[0m: 40% done [0m	[0m00:01:08 left[0m	
[0m: 45% done [0m	[0m00:01:03 left[0m	
[0m: 50% done [0m	[0m00:00:57 left[0m	
[0m: 55% done [0m	[0m00:00:51 left[0m	
[0m: 60% done [0m	[0m00:00:46 left[0m	
[0m: 65% done [0m	[0m00:00:40 left[0m	
[0m: 70% done [0m	[0m00:00:34 left[0m	
[0m: 75% done [0m	[0m00:00:29 left[0m	
[0m: 80% done [0m	[0m00:00:23 left[0m	
[0m: 85% done [0m	[0m00:00:17 left[0m	
[0m: 90% done [0m	[0m00:00:12 left[0m	
[0m: 95% done [0m	[0m00:00:06 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:01:56[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 22.678648171448%[0m	
[0m: average rowUcol correct (VOC measure): 13.078765689146%[0m	
[0m: > global correct: 22.597345376439%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.4627749919891 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.5385119915009 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.7491290569305 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 56[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:15:02 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:15:16 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:14:32 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:44 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:54 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:12:04 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:11:16 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:28 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:38 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:48 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:08:00 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:07:09 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:21 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:38 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:47 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:03:57 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:08 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:20 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:30 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:41 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 56[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:16:20[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 81.96755092923%[0m	
[0m: average rowUcol correct (VOC measure): 69.608768260125%[0m	
[0m: > global correct: 81.946134277182%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:01:59 left[0m	
[0m: 5% done [0m	[0m00:01:53 left[0m	
[0m: 10% done [0m	[0m00:01:53 left[0m	
[0m: 15% done [0m	[0m00:01:46 left[0m	
[0m: 20% done [0m	[0m00:01:41 left[0m	
[0m: 25% done [0m	[0m00:01:35 left[0m	
[0m: 30% done [0m	[0m00:01:29 left[0m	
[0m: 35% done [0m	[0m00:01:23 left[0m	
[0m: 40% done [0m	[0m00:01:16 left[0m	
[0m: 45% done [0m	[0m00:01:10 left[0m	
[0m: 50% done [0m	[0m00:01:04 left[0m	
[0m: 55% done [0m	[0m00:00:58 left[0m	
[0m: 60% done [0m	[0m00:00:51 left[0m	
[0m: 65% done [0m	[0m00:00:45 left[0m	
[0m: 70% done [0m	[0m00:00:39 left[0m	
[0m: 75% done [0m	[0m00:00:32 left[0m	
[0m: 80% done [0m	[0m00:00:26 left[0m	
[0m: 85% done [0m	[0m00:00:19 left[0m	
[0m: 90% done [0m	[0m00:00:13 left[0m	
[0m: 95% done [0m	[0m00:00:07 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:02:10[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 23.034940291159%[0m	
[0m: average rowUcol correct (VOC measure): 13.365537400293%[0m	
[0m: > global correct: 22.944318995429%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.471039056778 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.6425831317902 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.7111129760742 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 57[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:16:39 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:15:35 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:14:50 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:14:53 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:14:15 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:13:06 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:12:02 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:11:08 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:10:21 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:09:39 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:08:43 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:07:46 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:52 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:59 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:05:05 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:04:18 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:29 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:35 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:39 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:45 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 57[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:17:43[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 81.991116835339%[0m	
[0m: average rowUcol correct (VOC measure): 69.624595417835%[0m	
[0m: > global correct: 81.968255723924%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:01:59 left[0m	
[0m: 5% done [0m	[0m00:01:38 left[0m	
[0m: 10% done [0m	[0m00:01:41 left[0m	
[0m: 15% done [0m	[0m00:01:38 left[0m	
[0m: 20% done [0m	[0m00:01:33 left[0m	
[0m: 25% done [0m	[0m00:01:28 left[0m	
[0m: 30% done [0m	[0m00:01:23 left[0m	
[0m: 35% done [0m	[0m00:01:16 left[0m	
[0m: 40% done [0m	[0m00:01:11 left[0m	
[0m: 45% done [0m	[0m00:01:05 left[0m	
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
[0m: average row correct: 21.226570386403%[0m	
[0m: average rowUcol correct (VOC measure): 12.523262420356%[0m	
[0m: > global correct: 21.170898276147%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.4137969017029 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.4884748458862 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.5635008811951 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 58[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:17:09 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:15:17 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:14:20 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:27 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:36 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:11:46 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:10:58 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:12 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:23 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:35 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:07:48 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:06:59 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:12 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:27 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:40 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:03:54 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:06 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:18 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:28 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:40 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 58[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:15:58[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 82.394918297777%[0m	
[0m: average rowUcol correct (VOC measure): 70.206249232339%[0m	
[0m: > global correct: 82.36505917487%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:01:47 left[0m	
[0m: 5% done [0m	[0m00:01:32 left[0m	
[0m: 10% done [0m	[0m00:01:37 left[0m	
[0m: 15% done [0m	[0m00:01:35 left[0m	
[0m: 20% done [0m	[0m00:01:31 left[0m	
[0m: 25% done [0m	[0m00:01:26 left[0m	
[0m: 30% done [0m	[0m00:01:20 left[0m	
[0m: 35% done [0m	[0m00:01:15 left[0m	
[0m: 40% done [0m	[0m00:01:09 left[0m	
[0m: 45% done [0m	[0m00:01:04 left[0m	
[0m: 50% done [0m	[0m00:00:58 left[0m	
[0m: 55% done [0m	[0m00:00:52 left[0m	
[0m: 60% done [0m	[0m00:00:46 left[0m	
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
[0m: average row correct: 23.452247568581%[0m	
[0m: average rowUcol correct (VOC measure): 13.563268447276%[0m	
[0m: > global correct: 23.384920416368%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.4142940044403 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.4891350269318 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.5625998973846 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 59[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:16:17 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:14:57 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:14:09 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:21 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:30 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:11:49 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:11:01 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:15 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:24 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:38 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:07:50 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:07:01 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:14 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:26 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:38 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:03:51 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:04 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:16 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:27 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:40 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 59[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:15:52[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 82.164463666406%[0m	
[0m: average rowUcol correct (VOC measure): 69.862012225803%[0m	
[0m: > global correct: 82.138314345758%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:01:58 left[0m	
[0m: 5% done [0m	[0m00:01:37 left[0m	
[0m: 10% done [0m	[0m00:01:34 left[0m	
[0m: 15% done [0m	[0m00:01:36 left[0m	
[0m: 20% done [0m	[0m00:01:33 left[0m	
[0m: 25% done [0m	[0m00:01:27 left[0m	
[0m: 30% done [0m	[0m00:01:21 left[0m	
[0m: 35% done [0m	[0m00:01:16 left[0m	
[0m: 40% done [0m	[0m00:01:10 left[0m	
[0m: 45% done [0m	[0m00:01:04 left[0m	
[0m: 50% done [0m	[0m00:00:58 left[0m	
[0m: 55% done [0m	[0m00:00:52 left[0m	
[0m: 60% done [0m	[0m00:00:46 left[0m	
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
[0m: average row correct: 22.78956150507%[0m	
[0m: average rowUcol correct (VOC measure): 13.27130760223%[0m	
[0m: > global correct: 22.69648069615%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.4469811916351 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.5013070106506 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.5558490753174 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 60[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:15:11 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:15:00 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:14:04 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:15 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:29 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:11:41 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:10:57 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:08 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:20 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:32 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:07:46 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:06:57 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:10 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:23 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:35 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:03:48 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:01 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:15 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:26 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:40 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 60[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:15:47[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 82.681538326905%[0m	
[0m: average rowUcol correct (VOC measure): 70.620123938759%[0m	
[0m: > global correct: 82.656785753788%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:02:19 left[0m	
[0m: 5% done [0m	[0m00:02:01 left[0m	
[0m: 10% done [0m	[0m00:01:56 left[0m	
[0m: 15% done [0m	[0m00:01:45 left[0m	
[0m: 20% done [0m	[0m00:01:41 left[0m	
[0m: 25% done [0m	[0m00:01:34 left[0m	
[0m: 30% done [0m	[0m00:01:27 left[0m	
[0m: 35% done [0m	[0m00:01:20 left[0m	
[0m: 40% done [0m	[0m00:01:14 left[0m	
[0m: 45% done [0m	[0m00:01:08 left[0m	
[0m: 50% done [0m	[0m00:01:02 left[0m	
[0m: 55% done [0m	[0m00:00:56 left[0m	
[0m: 60% done [0m	[0m00:00:49 left[0m	
[0m: 65% done [0m	[0m00:00:43 left[0m	
[0m: 70% done [0m	[0m00:00:37 left[0m	
[0m: 75% done [0m	[0m00:00:31 left[0m	
[0m: 80% done [0m	[0m00:00:25 left[0m	
[0m: 85% done [0m	[0m00:00:19 left[0m	
[0m: 90% done [0m	[0m00:00:13 left[0m	
[0m: 95% done [0m	[0m00:00:06 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:02:04[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 23.459885298911%[0m	
[0m: average rowUcol correct (VOC measure): 13.472907779978%[0m	
[0m: > global correct: 23.368397863083%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.3853299617767 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.4402008056641 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.4963879585266 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 61[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:16:16 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:15:10 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:14:29 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:41 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:13:32 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:12:27 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:11:30 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:37 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:47 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:58 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:08:09 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:07:18 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:29 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:40 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:49 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:04:00 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:13 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:25 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:33 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:42 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 61[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:16:44[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 82.92358665183%[0m	
[0m: average rowUcol correct (VOC measure): 70.960477968254%[0m	
[0m: > global correct: 82.905652029643%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:02:04 left[0m	
[0m: 5% done [0m	[0m00:01:35 left[0m	
[0m: 10% done [0m	[0m00:01:44 left[0m	
[0m: 15% done [0m	[0m00:01:40 left[0m	
[0m: 20% done [0m	[0m00:01:37 left[0m	
[0m: 25% done [0m	[0m00:01:30 left[0m	
[0m: 30% done [0m	[0m00:01:25 left[0m	
[0m: 35% done [0m	[0m00:01:20 left[0m	
[0m: 40% done [0m	[0m00:01:14 left[0m	
[0m: 45% done [0m	[0m00:01:08 left[0m	
[0m: 50% done [0m	[0m00:01:03 left[0m	
[0m: 55% done [0m	[0m00:00:57 left[0m	
[0m: 60% done [0m	[0m00:00:51 left[0m	
[0m: 65% done [0m	[0m00:00:44 left[0m	
[0m: 70% done [0m	[0m00:00:38 left[0m	
[0m: 75% done [0m	[0m00:00:32 left[0m	
[0m: 80% done [0m	[0m00:00:26 left[0m	
[0m: 85% done [0m	[0m00:00:19 left[0m	
[0m: 90% done [0m	[0m00:00:13 left[0m	
[0m: 95% done [0m	[0m00:00:07 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:02:09[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 23.159302291599%[0m	
[0m: average rowUcol correct (VOC measure): 13.492612773091%[0m	
[0m: > global correct: 23.104037010519%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.3943548202515 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.4593908786774 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.535542011261 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 62[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:17:37 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:15:59 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:14:56 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:14:05 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:13:15 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:12:22 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:11:55 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:11:20 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:10:46 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:09:44 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:08:45 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:07:45 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:49 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:55 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:05:00 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:04:07 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:16 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:25 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:32 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:42 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 62[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:16:42[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 83.076079883198%[0m	
[0m: average rowUcol correct (VOC measure): 71.173273454798%[0m	
[0m: > global correct: 83.048058843048%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:02:04 left[0m	
[0m: 5% done [0m	[0m00:01:35 left[0m	
[0m: 10% done [0m	[0m00:01:36 left[0m	
[0m: 15% done [0m	[0m00:01:35 left[0m	
[0m: 20% done [0m	[0m00:01:30 left[0m	
[0m: 25% done [0m	[0m00:01:24 left[0m	
[0m: 30% done [0m	[0m00:01:19 left[0m	
[0m: 35% done [0m	[0m00:01:14 left[0m	
[0m: 40% done [0m	[0m00:01:08 left[0m	
[0m: 45% done [0m	[0m00:01:03 left[0m	
[0m: 50% done [0m	[0m00:00:57 left[0m	
[0m: 55% done [0m	[0m00:00:52 left[0m	
[0m: 60% done [0m	[0m00:00:46 left[0m	
[0m: 65% done [0m	[0m00:00:40 left[0m	
[0m: 70% done [0m	[0m00:00:35 left[0m	
[0m: 75% done [0m	[0m00:00:29 left[0m	
[0m: 80% done [0m	[0m00:00:23 left[0m	
[0m: 85% done [0m	[0m00:00:18 left[0m	
[0m: 90% done [0m	[0m00:00:12 left[0m	
[0m: 95% done [0m	[0m00:00:06 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:01:57[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 24.107943534261%[0m	
[0m: average rowUcol correct (VOC measure): 13.875530003616%[0m	
[0m: > global correct: 24.029299994492%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.4160869121552 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.4781289100647 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.5428948402405 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 63[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:15:32 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:14:52 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:14:00 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:12 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:28 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:11:42 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:10:56 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:11 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:23 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:36 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:07:49 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:06:59 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:12 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:25 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:37 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:03:50 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:03 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:16 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:27 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:40 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 63[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:15:50[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 83.261134718904%[0m	
[0m: average rowUcol correct (VOC measure): 71.473432000321%[0m	
[0m: > global correct: 83.237473730782%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:02:05 left[0m	
[0m: 5% done [0m	[0m00:01:41 left[0m	
[0m: 10% done [0m	[0m00:01:37 left[0m	
[0m: 15% done [0m	[0m00:01:36 left[0m	
[0m: 20% done [0m	[0m00:01:32 left[0m	
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
[0m: average row correct: 22.400986536009%[0m	
[0m: average rowUcol correct (VOC measure): 13.176114267052%[0m	
[0m: > global correct: 22.31646197059%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.3960490226746 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.4704480171204 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.5417621135712 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 64[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:16:52 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:14:59 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:14:06 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:24 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:34 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:11:43 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:10:54 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:07 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:17 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:31 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:07:44 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:06:55 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:09 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:22 left[0m	
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
[0m: 96% done[0m	[0m00:00:39 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 64[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:15:36[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 83.087522676676%[0m	
[0m: average rowUcol correct (VOC measure): 71.210393929245%[0m	
[0m: > global correct: 83.071562880212%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:02:24 left[0m	
[0m: 5% done [0m	[0m00:01:31 left[0m	
[0m: 10% done [0m	[0m00:01:31 left[0m	
[0m: 15% done [0m	[0m00:01:30 left[0m	
[0m: 20% done [0m	[0m00:01:27 left[0m	
[0m: 25% done [0m	[0m00:01:22 left[0m	
[0m: 30% done [0m	[0m00:01:17 left[0m	
[0m: 35% done [0m	[0m00:01:11 left[0m	
[0m: 40% done [0m	[0m00:01:06 left[0m	
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
[0m: Time to test all samples = 00:01:53[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 23.661095516221%[0m	
[0m: average rowUcol correct (VOC measure): 13.664602432953%[0m	
[0m: > global correct: 23.588698573553%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.4038848876953 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.4674730300903 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.5329699516296 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 65[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:16:14 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:15:01 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:14:08 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:19 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:28 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:11:38 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:10:51 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:03 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:15 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:31 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:07:45 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:06:57 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:11 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:25 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:36 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:03:50 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:03 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:18 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:28 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:41 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 65[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:16:03[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 83.513241534186%[0m	
[0m: average rowUcol correct (VOC measure): 71.81363276916%[0m	
[0m: > global correct: 83.486340006636%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:01:59 left[0m	
[0m: 5% done [0m	[0m00:01:34 left[0m	
[0m: 10% done [0m	[0m00:01:39 left[0m	
[0m: 15% done [0m	[0m00:01:38 left[0m	
[0m: 20% done [0m	[0m00:01:34 left[0m	
[0m: 25% done [0m	[0m00:01:29 left[0m	
[0m: 30% done [0m	[0m00:01:24 left[0m	
[0m: 35% done [0m	[0m00:01:19 left[0m	
[0m: 40% done [0m	[0m00:01:13 left[0m	
[0m: 45% done [0m	[0m00:01:07 left[0m	
[0m: 50% done [0m	[0m00:01:01 left[0m	
[0m: 55% done [0m	[0m00:00:55 left[0m	
[0m: 60% done [0m	[0m00:00:49 left[0m	
[0m: 65% done [0m	[0m00:00:43 left[0m	
[0m: 70% done [0m	[0m00:00:37 left[0m	
[0m: 75% done [0m	[0m00:00:31 left[0m	
[0m: 80% done [0m	[0m00:00:25 left[0m	
[0m: 85% done [0m	[0m00:00:19 left[0m	
[0m: 90% done [0m	[0m00:00:13 left[0m	
[0m: 95% done [0m	[0m00:00:06 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:02:06[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 23.871951498608%[0m	
[0m: average rowUcol correct (VOC measure): 13.72051964892%[0m	
[0m: > global correct: 23.792476730737%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.3981809616089 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.4604699611664 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.5239598751068 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 66[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:16:20 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:15:34 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:14:47 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:53 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:13:06 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:12:19 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:11:27 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:56 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:10:02 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:09:21 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:08:27 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:07:32 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:41 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:50 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:57 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:04:06 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:15 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:25 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:33 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:43 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 66[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:17:09[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 83.559760539839%[0m	
[0m: average rowUcol correct (VOC measure): 71.898381072696%[0m	
[0m: > global correct: 83.533348080965%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:01:59 left[0m	
[0m: 5% done [0m	[0m00:01:37 left[0m	
[0m: 10% done [0m	[0m00:01:47 left[0m	
[0m: 15% done [0m	[0m00:01:45 left[0m	
[0m: 20% done [0m	[0m00:01:37 left[0m	
[0m: 25% done [0m	[0m00:01:35 left[0m	
[0m: 30% done [0m	[0m00:01:30 left[0m	
[0m: 35% done [0m	[0m00:01:24 left[0m	
[0m: 40% done [0m	[0m00:01:17 left[0m	
[0m: 45% done [0m	[0m00:01:10 left[0m	
[0m: 50% done [0m	[0m00:01:04 left[0m	
[0m: 55% done [0m	[0m00:00:57 left[0m	
[0m: 60% done [0m	[0m00:00:51 left[0m	
[0m: 65% done [0m	[0m00:00:55 left[0m	
[0m: 70% done [0m	[0m00:00:46 left[0m	
[0m: 75% done [0m	[0m00:00:38 left[0m	
[0m: 80% done [0m	[0m00:00:30 left[0m	
[0m: 85% done [0m	[0m00:00:23 left[0m	
[0m: 90% done [0m	[0m00:00:15 left[0m	
[0m: 95% done [0m	[0m00:00:08 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:02:24[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 23.444259815877%[0m	
[0m: average rowUcol correct (VOC measure): 13.517306177038%[0m	
[0m: > global correct: 23.351875309798%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.3398530483246 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.3946690559387 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.4511370658875 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 67[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:16:22 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:14:55 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:14:07 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:20 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:30 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:11:47 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:10:58 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:10 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:21 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:34 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:07:46 left[0m	
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
[0m: 81% done[0m	[0m00:03:02 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:15 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:26 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:40 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 67[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:15:45[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 83.760673338824%[0m	
[0m: average rowUcol correct (VOC measure): 72.193781220087%[0m	
[0m: > global correct: 83.740736644177%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:02:00 left[0m	
[0m: 5% done [0m	[0m00:01:41 left[0m	
[0m: 10% done [0m	[0m00:01:40 left[0m	
[0m: 15% done [0m	[0m00:01:36 left[0m	
[0m: 20% done [0m	[0m00:01:31 left[0m	
[0m: 25% done [0m	[0m00:01:26 left[0m	
[0m: 30% done [0m	[0m00:01:21 left[0m	
[0m: 35% done [0m	[0m00:01:15 left[0m	
[0m: 40% done [0m	[0m00:01:09 left[0m	
[0m: 45% done [0m	[0m00:01:03 left[0m	
[0m: 50% done [0m	[0m00:00:58 left[0m	
[0m: 55% done [0m	[0m00:00:52 left[0m	
[0m: 60% done [0m	[0m00:00:46 left[0m	
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
[0m: average row correct: 23.859273325099%[0m	
[0m: average rowUcol correct (VOC measure): 13.703582022745%[0m	
[0m: > global correct: 23.764939141929%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.3822751045227 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.4512310028076 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.526132106781 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 68[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:15:44 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:14:35 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:14:02 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:20 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:28 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:11:39 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:10:52 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:05 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:17 left[0m	
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
[0m: 86% done[0m	[0m00:02:15 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:26 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:40 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 68[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:15:42[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 84.186802819224%[0m	
[0m: average rowUcol correct (VOC measure): 72.816218775098%[0m	
[0m: > global correct: 84.163809313129%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:02:00 left[0m	
[0m: 5% done [0m	[0m00:01:34 left[0m	
[0m: 10% done [0m	[0m00:01:36 left[0m	
[0m: 15% done [0m	[0m00:01:32 left[0m	
[0m: 20% done [0m	[0m00:01:28 left[0m	
[0m: 25% done [0m	[0m00:01:24 left[0m	
[0m: 30% done [0m	[0m00:01:18 left[0m	
[0m: 35% done [0m	[0m00:01:13 left[0m	
[0m: 40% done [0m	[0m00:01:07 left[0m	
[0m: 45% done [0m	[0m00:01:02 left[0m	
[0m: 50% done [0m	[0m00:00:56 left[0m	
[0m: 55% done [0m	[0m00:00:51 left[0m	
[0m: 60% done [0m	[0m00:00:45 left[0m	
[0m: 65% done [0m	[0m00:00:40 left[0m	
[0m: 70% done [0m	[0m00:00:34 left[0m	
[0m: 75% done [0m	[0m00:00:28 left[0m	
[0m: 80% done [0m	[0m00:00:23 left[0m	
[0m: 85% done [0m	[0m00:00:17 left[0m	
[0m: 90% done [0m	[0m00:00:11 left[0m	
[0m: 95% done [0m	[0m00:00:06 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:01:54[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 23.780197465774%[0m	
[0m: average rowUcol correct (VOC measure): 13.667548838818%[0m	
[0m: > global correct: 23.709863964311%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.3998668193817 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.4602780342102 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.5293719768524 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 69[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:16:21 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:15:11 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:14:15 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:25 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:33 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:11:44 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:10:56 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:08 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:18 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:32 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:07:46 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:06:57 left[0m	
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
[0m: 86% done[0m	[0m00:02:15 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:26 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:40 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 69[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:15:41[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 84.017624654392%[0m	
[0m: average rowUcol correct (VOC measure): 72.560779351999%[0m	
[0m: > global correct: 83.997898462559%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:02:02 left[0m	
[0m: 5% done [0m	[0m00:01:42 left[0m	
[0m: 10% done [0m	[0m00:01:43 left[0m	
[0m: 15% done [0m	[0m00:01:36 left[0m	
[0m: 20% done [0m	[0m00:01:31 left[0m	
[0m: 25% done [0m	[0m00:01:27 left[0m	
[0m: 30% done [0m	[0m00:01:20 left[0m	
[0m: 35% done [0m	[0m00:01:15 left[0m	
[0m: 40% done [0m	[0m00:01:10 left[0m	
[0m: 45% done [0m	[0m00:01:04 left[0m	
[0m: 50% done [0m	[0m00:00:59 left[0m	
[0m: 55% done [0m	[0m00:00:53 left[0m	
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
[0m: average row correct: 19.029039028331%[0m	
[0m: average rowUcol correct (VOC measure): 10.979482559211%[0m	
[0m: > global correct: 18.923831029355%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.3886702060699 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.4443101882935 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.5007581710815 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 70[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:16:03 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:15:14 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:14:25 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:36 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:48 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:11:58 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:11:10 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:22 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:49 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:57 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:08:05 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:07:13 left[0m	
[0m.:. Batch 43009 to 43136 on 72328 images[0m	
[0m: 61% done[0m	[0m00:06:25 left[0m	
[0m.:. Batch 46721 to 46848 on 72328 images[0m	
[0m: 66% done[0m	[0m00:05:36 left[0m	
[0m.:. Batch 50305 to 50432 on 72328 images[0m	
[0m: 71% done[0m	[0m00:04:47 left[0m	
[0m.:. Batch 53889 to 54016 on 72328 images[0m	
[0m: 76% done[0m	[0m00:03:58 left[0m	
[0m.:. Batch 57473 to 57600 on 72328 images[0m	
[0m: 81% done[0m	[0m00:03:09 left[0m	
[0m.:. Batch 61185 to 61312 on 72328 images[0m	
[0m: 86% done[0m	[0m00:02:21 left[0m	
[0m.:. Batch 64769 to 64896 on 72328 images[0m	
[0m: 91% done[0m	[0m00:01:30 left[0m	
[0m.:. Batch 68353 to 68480 on 72328 images[0m	
[0m: 96% done[0m	[0m00:00:42 left[0m	
[0m.:. Batch 72065 to 72192 on 72328 images[0m	
[0m.:. End of Epoch n° 70[0m	
[0m: Real time to learn 1 batch = 00:00:01[0m	
[0m: Real time to learn full batch = 00:16:26[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 84.101017099796%[0m	
[0m: average rowUcol correct (VOC measure): 72.696200101682%[0m	
[0m: > global correct: 84.072558345316%[0m	
[0m
# ... test model[0m	
[0m: 0% done [0m	[0m00:01:58 left[0m	
[0m: 5% done [0m	[0m00:05:21 left[0m	
[0m: 10% done [0m	[0m00:03:36 left[0m	
[0m: 15% done [0m	[0m00:02:53 left[0m	
[0m: 20% done [0m	[0m00:02:26 left[0m	
[0m: 25% done [0m	[0m00:02:08 left[0m	
[0m: 30% done [0m	[0m00:01:54 left[0m	
[0m: 35% done [0m	[0m00:01:42 left[0m	
[0m: 40% done [0m	[0m00:01:32 left[0m	
[0m: 45% done [0m	[0m00:01:22 left[0m	
[0m: 50% done [0m	[0m00:01:13 left[0m	
[0m: 55% done [0m	[0m00:01:05 left[0m	
[0m: 60% done [0m	[0m00:00:57 left[0m	
[0m: 65% done [0m	[0m00:00:55 left[0m	
[0m: 70% done [0m	[0m00:00:46 left[0m	
[0m: 75% done [0m	[0m00:00:38 left[0m	
[0m: 80% done [0m	[0m00:00:30 left[0m	
[0m: 85% done [0m	[0m00:00:22 left[0m	
[0m: 90% done [0m	[0m00:00:15 left[0m	
[0m: 95% done [0m	[0m00:00:07 left[0m	
[0m: 100% done [0m	[0m00:00:00 left[0m	
[0m: Time to test all samples = 00:02:22[0m	
[0m# Confusion Matrix[0m	
[0m: average row correct: 23.196209930252%[0m	
[0m: average rowUcol correct (VOC measure): 13.491016091539%[0m	
[0m: > global correct: 23.115052046043%[0m	
[0m# ... saving model to ./sk1-1/model.net[0m	
[0m: tac = 2.3887650966644 sec[0m	
[0m# ... saving optimfunc.state to ./sk1-1/optim.state[0m	
[0m: tac = 2.4549810886383 sec[0m	
[0m# ... saving optimfunc.method to ./sk1-1/optim.method[0m	
[0m: tac = 2.5256991386414 sec[0m	
[0m
#####################[0m	
[0m# Epoch n° 71[0m	
[0m
# ... train model[0m	
[0m.:. Batch 1 to 128 on 72328 images[0m	
[0m: 1% done[0m	[0m00:16:52 left[0m	
[0m.:. Batch 3201 to 3328 on 72328 images[0m	
[0m: 6% done[0m	[0m00:14:59 left[0m	
[0m.:. Batch 6785 to 6912 on 72328 images[0m	
[0m: 11% done[0m	[0m00:14:22 left[0m	
[0m.:. Batch 10497 to 10624 on 72328 images[0m	
[0m: 16% done[0m	[0m00:13:37 left[0m	
[0m.:. Batch 14081 to 14208 on 72328 images[0m	
[0m: 21% done[0m	[0m00:12:46 left[0m	
[0m.:. Batch 17665 to 17792 on 72328 images[0m	
[0m: 26% done[0m	[0m00:12:02 left[0m	
[0m.:. Batch 21249 to 21376 on 72328 images[0m	
[0m: 31% done[0m	[0m00:11:16 left[0m	
[0m.:. Batch 24961 to 25088 on 72328 images[0m	
[0m: 36% done[0m	[0m00:10:28 left[0m	
[0m.:. Batch 28545 to 28672 on 72328 images[0m	
[0m: 41% done[0m	[0m00:09:40 left[0m	
[0m.:. Batch 32129 to 32256 on 72328 images[0m	
[0m: 46% done[0m	[0m00:08:53 left[0m	
[0m.:. Batch 35841 to 35968 on 72328 images[0m	
[0m: 51% done[0m	[0m00:08:04 left[0m	
[0m.:. Batch 39425 to 39552 on 72328 images[0m	
[0m: 56% done[0m	[0m00:07:15 left[0m	

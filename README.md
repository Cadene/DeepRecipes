## OverFeat-Torch7 Wrapper + SVM sklearn

```bash
cd ./image2features
sh install.sh
th run.lua 
cd ../svm_sklearn
python creating_train_test.py
```


nohup ./train_kepler_1.sh > ./save_kepler_1/train_kepler_1.log
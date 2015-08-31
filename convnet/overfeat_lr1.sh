gate
ssh kepler
convnet



gpu=0
lr=5e-1

gpu=2
lr=1e-1

gpu=3
lr=5e-2

gpu=4
lr=1e-2

gpu=5
lr=5e-3

gpu=6
lr=1e-3

---

gpu=2
lr=5

gpu=0
lr=10

gpu=2
lr=5

gpu=3
lr=2

gpu=4
lr=1

gpu=5
lr=8e-1

gpu=6
lr=5e-1

loadm="false"
path2load="/home/cadene/data/recipe_101_clean/"
name="overfat++$gpu"
path2save="./rslt/$name"
mkdir $path2save
echo "CUDA_VISIBLE_DEVICES=$gpu th main.lua \
    -type_data recipe101 \
    -path2load_data $path2load \
    -process_mean_std false \
    -prepare_data false \
    -gpuid 1 \
    -cuda true \
    -cudnn true \
    -4d_tensor true \
    -type_model overfeat \
    -pretrain_model true \
    -type_optimizer SGD_overfeat \
    -learning_rate $lr \
    -learning_rate_decay 0 \
    -batch_size 60 \
    -save_every 1 \
    -path2save $path2save \
    -train_model true \
    -test_model false \
    -save_model true \
    -load_model $loadm \
    -path2load $path2save" > $name.sh
chmod 777 $name.sh
nohup ./$name.sh > $path2save/run.log &
cat $path2save/run.log


echo $name

gpu=0
name="overfat$gpu"
path2save="./rslt/$name"
cat $path2save/run.log



gpu=6
gpuid=$(($gpu+1))
path2save="./rslt/overfat_lr$gpuid"
mkdir $path2save
echo "CUDA_VISIBLE_DEVICES=$gpu th main.lua \
    -type_data recipe101 \
    -path2load_data /home/cadene/data/recipe_101_clean/ \
    -process_mean_std false \
    -prepare_data false \
    -gpuid 1 \
    -cuda true \
    -cudnn true \
    -4d_tensor true \
    -type_model overfeat \
    -pretrain_model false \
    -type_optimizer SGD_overfeat \
    -learning_rate 1e-1 \
    -learning_rate_decay 0 \
    -batch_size 60 \
    -save_every 1 \
    -path2save $path2save \
    -train_model true \
    -test_model false \
    -save_model true \
    -load_model true \
    -path2load $path2save" > run.sh
nohup ./run.sh > $path2save/run.log &
cat $path2save/run.log
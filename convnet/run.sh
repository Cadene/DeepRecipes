CUDA_VISIBLE_DEVICES=0 th main.lua \
    -type_data recipe101 \
    -path2load_data /home/cadene/data/recipe_101/recipe_101/ \
    -path2load_csv /home/cadene/data/recipe_101/success.log \
    -process_mean_std false \
    -gpuid 1 \
    -cuda true \
    -cudnn true \
    -4d_tensor true \
    -type_model overfeat \
    -pretrain_model false \
    -type_optimizer SGD_overfeat \
    -learning_rate 5e-2 \
    -learning_rate_decay 0 \
    -batch_size 60 \
    -save_every 1 \
    -path2save ./rslt/overfat_lr1 \
    -train_model true \
    -test_model false \
    -save_model true 


    -path2load_data /Users/remicadene/data/recipe_101_tiny/ \
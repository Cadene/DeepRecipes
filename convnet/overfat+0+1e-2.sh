CUDA_VISIBLE_DEVICES=0 th main.lua     -type_data recipe101     -path2load_data /home/cadene/data/recipe_101_clean/     -process_mean_std false     -prepare_data false     -gpuid 1     -cuda true     -cudnn true     -4d_tensor true     -type_model overfeat     -pretrain_model true     -type_optimizer SGD_overfeat     -learning_rate 1e-2     -learning_rate_decay 0     -batch_size 60     -save_every 1     -path2save ./rslt/overfat+0+1e-2     -train_model true     -test_model false     -save_model true     -load_model false     -path2load ./rslt/overfat+0+1e-2

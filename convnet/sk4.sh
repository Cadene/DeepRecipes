th -i main.lua \
\
    -data_type Recipe101 \
    -path2dir /home/cadene/data/recipe_101_clean/ \
\
    -pc_train 0.8 \
\
    -type cuda \
    -threads 8 \
    -gpuid 4 \
    -model_type overfeat_scratch \
    -criterion NLL \
    -dropout 0.9 \
\
    -batch_size 128 \
    -optimizer SGD \
    -learning_rate_decay 0 \
    -learning_rate 0.004 \
    -momentum 0.6 \
\
    -load_model false \
    -path2load ./sk4/ \
    -epoch 100 \
    -path2save ./sk4/ \
    -plot_every 2000 \
    -plot false \
    -save_every 1 \
\
    -run true \
    -train true \
    -test true \
    -save true 
    
    
    

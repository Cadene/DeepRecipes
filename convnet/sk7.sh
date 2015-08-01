th -i main.lua \
\
    -data_type Recipe101 \
    -path2dir /home/cadene/data/recipe_101_clean/ \
\
    -pc_train 0.8 \
\
    -type cuda \
    -threads 8 \
    -gpuid 7 \
    -model_type small \
    -criterion NLL \
    -dropout 0 \
\
    -batch_size 128 \
    -optimizer SGD \
    -learning_rate 0.04 \
    -momentum 0.6 \
    -learning_rate_decay 0 \
\
    -load_model false \
    -path2load ./sk7/ \
    -epoch 100 \
    -path2save ./sk7/ \
    -plot_every 2000 \
    -plot false \
    -save_every 1 \
\
    -run true \
    -train true \
    -test true \
    -save true 
    

    
    

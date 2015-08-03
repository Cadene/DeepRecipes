th -i main.lua \
\
    -data_type Recipe101 \
    -path2dir /home/cadene/data/recipe_101_clean/ \
\
    -pc_train 0.8 \
\
    -type cuda \
    -threads 8 \
    -gpuid 6 \
    -model_type small \
    -criterion NLL \
    -dropout 0.4 \
\
    -batch_size 128 \
    -optimizer SGD \
    -learning_rate_decay 0 \
    -learning_rate 0.02 \
    -momentum 0.9 \
    -weight_decay 1e-3 \
\
    -load_model false \
    -path2load ./batch_norm/ \
    -epoch 100 \
    -path2save ./batch_norm/ \
    -plot_every 2000 \
    -plot false \
    -save_every 1 \
\
    -run true \
    -train true \
    -test true \
    -save true 
    
    
    

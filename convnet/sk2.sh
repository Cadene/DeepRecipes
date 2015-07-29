th -i main.lua \
\
    -data_type Recipe101 \
    -path2dir /home/cadene/data/recipe_101_clean/ \
\
    -pc_train 0.8 \
\
    -type cuda \
    -threads 8 \
    -gpuid 2 \
    -model_type overfeat \
    -criterion NLL \
    -dropout 0.7 \
\
    -batch_size 128 \
    -optimizer SGD \
    -learning_rate_decay 0 \
    -learning_rate 0.01 \
    -momentum 0 \
\
    -load_model false \
    -path2load ./sk1/ \
    -epoch 100 \
    -path2save ./sk1/ \
    -plot_every 2000 \
    -plot false \
    -save_every 1 \
\
    -run true \
    -train true \
    -test true \
    -save true 
    
    
    

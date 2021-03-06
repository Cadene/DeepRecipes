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
    -model_type medium \
    -criterion NLL \
    -dropout 0.5 \
\
    -batch_size 128 \
    -optimizer SGD \
    -learning_rate_decay 0 \
    -learning_rate 0.09 \
    -momentum 0.9 \
\
    -load_model true \
    -path2load ./medium/ \
    -epoch 100 \
    -path2save ./medium-1/ \
    -plot_every 2000 \
    -plot false \
    -save_every 1 \
\
    -run true \
    -train true \
    -test true \
    -save true 
    
    
    

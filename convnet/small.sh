th -i main.lua \
\
    -data_type Recipe101 \
    -path2dir /home/cadene/data/recipe_101_clean/ \
\
    -pc_train 0.8 \
\
    -type cuda \
    -threads 8 \
    -gpuid 5 \
    -model_type small \
    -criterion NLL \
    -dropout 0.9 \
\
    -batch_size 128 \
    -optimizer SGD \
    -learning_rate_decay 0 \
    -learning_rate 0.02 \
    -momentum 0.6 \
    -weight_decay 1e-3 \
\
    -load_model true \
    -path2load ./small-2/ \
    -epoch 100 \
    -path2save ./small-2/ \
    -plot_every 2000 \
    -plot false \
    -save_every 1 \
\
    -run false \
    -train true \
    -test true \
    -save true 
    
    
    

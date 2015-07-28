th -i main.lua \
\
    -data_type Recipe101 \
    -path2dir /home/cadene/data/recipe_101_clean/ \
\
    -pc_train 0.8 \
\
    -type float \
    -threads 1 \
    -gpuid 4 \
    -model_type small \
    -criterion NLL \
    -dropout 0.6 \
\
    -batch_size 128 \
    -optimizer SGD \
    -learning_rate 8e-2 \
    -momentum 0.6 \
\
    -load_model true \
    -path2load ./sk5/ \
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
    
    
    

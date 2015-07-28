th -i main.lua \
\
    -data_type Recipe101 \
    -path2dir /Users/remicadene/data/recipe_101_low/ \
\
    -pc_train 0.8 \
\
    -type float \
    -threads 1 \
    -gpuid 3 \
    -model_type small \
    -criterion NLL \
    -dropout 0 \
\
    -batch_size 128 \
    -optimizer SGD \
    -learning_rate 1e-1 \
    -momentum 0.6 \
\
    -load_model true \
    -path2load ./sk5/ \
    -epoch 100 \
    -path2save ./sk3/ \
    -plot_every 2000 \
    -plot false \
    -save_every 1 \
\
    -run true \
    -train true \
    -test true \
    -save true 
    
    
    

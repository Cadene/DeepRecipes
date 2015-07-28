th -i main.lua \
\
    -data_type Recipe101 \
    -path2dir /home/cadene/data/recipe_101_clean/ \
\
    -pc_train 0.8 \
\
    -load_model true \
    -path2load ./sk5/ \
\
    -type cuda \
    -threads 8 \
    -gpuid 6 \
    -model_type small \
    -criterion NLL \
    -dropout 0.5 \
\
    -batch_size 128 \
    -optimizer ADAGRAD \
    -learning_rate 0 \
\
    -epoch 1000 \
    -path2save ./sk6/ \
    -plot_every 2000 \
    -save_every 1 \
\
    -run true \
    -train true \
    -test true \
    -save true
    

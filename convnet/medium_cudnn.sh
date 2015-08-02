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
    -model_type medium_cudnn \
    -criterion NLL \
    -dropout 0.7 \
\
    -batch_size 128 \
    -optimizer ADAGRAD \
    -learning_rate 0.35 \
\
    -load_model false \
    -path2load ./medium_cudnn/ \
    -epoch 100 \
    -path2save ./medium-cudnn/ \
    -plot_every 2000 \
    -plot false \
    -save_every 1 \
\
    -run true \
    -train true \
    -test true \
    -save true 
    
    
    

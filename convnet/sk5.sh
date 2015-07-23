th -i main.lua \
\
    -data_type Recipe101 \
    -path2dir /home/cadene/data/recipe_101_clean/ \
\
    -pc_train 0.8 \
\
    -load_seed false \
    -path2seed ./sk5/seed.save \
\
    -load_model false \
    -path2model ./sk5/cade.net \
\
    -type cuda \
    -threads 8 \
    -gpuid 5 \
    -model_type small \
    -criterion NLL \
    -dropout 0.5 \
\
    '#-optimizer SGD \
    -learning_rate 5e-2 \
    -learning_rate_decay 0.033 \
    -momentum 0.06 \
    -weight_decay 1e-5 \
    -batch_size 128 \'
    -optimizer ADAGRAD \
    -learning_rate 1e-2 \
\
    -epoch 1000 \
    -path2save ./sk5/ \
    -plot_every 2000 \
    -save_every 1 \
\
    -run true \
    -train true \
    -test true \
    
    
    

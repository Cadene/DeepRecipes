th -i main.lua \
\
    -data_type Recipe101 \
    -path2dir /home/cadene/data/recipe_101_clean/ \
\
    -pc_train 0.8 \
\
    -load_seed false \
    -path2seed ./sk4/seed.save \
\
    -load_model true \
    -path2model ./sk4/cade.net \
\
    -type cuda \
    -threads 8 \
    -gpuid 4 \
    -model_type overfeat_scratch \
    -criterion NLL \
    -dropout 0.5 \
\
    -batch_size 128 \
    -optimizer ADAGRAD \
    -learning_rate 1e-1 \
\
    -epoch 1000 \
    -path2save ./sk4/ \
    -plot_every 2000 \
    -save_every 1 \
\
    -run true \
    -train true \
    -test true \
    
    
    

th -i main.lua \
\
    -data_type Recipe101 \
    -path2dir /home/cadene/data/recipe_101_clean/ \
\
    -pc_train 0.8 \
\
    -load_seed false \
    -path2seed ./sk2/seed.save \
\
    -load_model false \
    -path2model ./sk2/cade.net \
\
    -type cuda \
    -threads 8 \
    -gpuid 2 \
    -model_type overfeat \
    -criterion NLL \
    -dropout 0.5 \
\
    -batch_size 128 \
    -optimizer ADAGRAD \
    -learning_rate 1e-3 \
\
    -epoch 1000 \
    -path2save ./sk2/ \
    -plot_every 2000 \
    -save_every 1 \
\
    -run true \
    -train true \
    -test true
    
    
    

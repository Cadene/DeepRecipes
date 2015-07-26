th -i main.lua \
\
    -data_type Recipe101 \
    -path2dir /home/cadene/data/recipe_101_clean/ \
\
    -pc_train 0.8 \
\
    -load_seed true \
    -path2seed ./sk6/seed.save \
\
    -load_model true \
    -path2model ./sk6/cade.net \
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
    -learning_rate 3e-2 \
\
    -epoch 1000 \
    -path2save ./sk6/ \
    -plot_every 2000 \
    -save_every 1 \
\
    -run false \
    -train true \
    -test true

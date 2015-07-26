th -i main.lua \
\
    -data_type Recipe101 \
    -path2dir /home/cadene/data/recipe_101_clean/ \
\
    -pc_train 0.8 \
\
    -load_seed true \
    -path2seed ./sk5/seed.save \
\
    -load_model true \
    -path2model ./sk5/cade.net \
\
    -type cuda \
    -threads 8 \
    -gpuid 5 \
    -model_type small \
    -criterion NLL \
    -dropout 0.5 \
\
    -batch_size 128 \
    -optimizer ADAGRAD \
    -learning_rate 1e-1 \
\
    -epoch 1000 \
    -path2save ./sk5/ \
    -plot_every 2000 \
    -save_every 1 \
\
    -run true \
    -train false \
    -test true 
    

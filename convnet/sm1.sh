th -i main.lua \
\
    -data_type Recipe101 \
    -path2dir /Users/remicadene/data/recipe_101_low/ \
\
    -pc_train 0.8 \
\
    -load_seed false \
    -path2seed ./sm1/seed.save \
\
    -load_model false \
    -path2model ./sm1/model.net \
\
    -load_optim false \
    -path2optim ./sm1/optim.state \
\
    -type float \
    -threads 8 \
    -gpuid 1 \
    -model_type small \
    -criterion NLL \
    -dropout 0 \
\
    -batch_size 128 \
    -optimizer ADAGRAD \
    -learning_rate 0.001 \
\
    -epoch 100 \
    -path2save ./sm1/ \
    -plot_every 2000 \
    -plot false \
    -save_every 1 \
\
    -run false \
    -train true \
    -test true \
    
    
    

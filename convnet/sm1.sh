th -i main.lua \
\
    -data_type Spiral \
    -path2dir /Users/remicadene/data/recipe_101_low/ \
\
    -pc_train 0.8 \
\
    -load_seed true \
    -path2seed ./sm1/seed.save \
\
    -load_model true \
    -path2model ./sm1/cade.net \
\
    -type float \
    -threads 8 \
    -gpuid 1 \
    -model_type standard \
    -criterion NLL \
    -dropout 0 \
\
    -batch_size 128 \
    -optimizer ADAGRAD \
    -learning_rate 1e-2 \
\
    -epoch 100 \
    -path2save ./sm1/ \
    -plot_every 2000 \
    -plot false \
    -save_every 100 \
\
    -run true \
    -train true \
    -test true \
    
    
    

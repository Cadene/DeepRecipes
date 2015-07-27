th -i main.lua \
\
    -data_type Recipe101 \
    -path2dir /Users/remicadene/data/recipe_101_tiny/ \
\
    -pc_train 0.8 \
\
    -load_seed false \
    -path2seed ./sm2/seed.save \
\
    -load_model false \
    -path2model ./sm2/cade.net \
\
    -type float \
    -threads 8 \
    -gpuid 7 \
    -model_type small \
    -criterion NLL \
    -dropout 0.5 \
\
    -batch_size 128 \
    -optimizer ADAGRAD \
    -learning_rate 1e-2 \
\
    -epoch 1 \
    -path2save ./sm2/ \
    -plot_every 2000 \
    -plot false \
    -save_every 1 \
\
    -run false \
    -train false \
    -test true

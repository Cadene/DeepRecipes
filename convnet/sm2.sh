th -i main.lua \
\
    -data_type Recipe101 \
    -path2dir /Users/remicadene/Dropbox/_Docs/UPMC/LIP6/Torch/DeepRecipes/data/recipe_101_test_224/ \
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
    -gpuid 1 \
    -model_type verydeep_A \
    -criterion NLL \
    -dropout 0.5 \
\
    -optimizer SGD \
    -learning_rate 5e-2 \
    -learning_rate_decay 0.033 \
    -momentum 0.06 \
    -weight_decay 1e-5 \
    -batch_size 128 \
\
    -epoch 1000 \
    -path2save ./sm2/ \
    -plot_every 2000 \
    -save_every 1 \
\
    -run true \
    -train true \
    -test true \
    
    
    
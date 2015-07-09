th -i main.lua \
    -optimizer ADAGRAD \
    -learning_rate 1e-6 \
    -criterion NLL \
    -plot_every 20 \
    -batch_size 1000 \
    -epoch 10 \
    -save_every 1 \
    -load_model false \
    -model_type overfeat \
    -data_type Recipe101 \
    -path2dir /Users/remicadene/data/recipe_101_clean/ \
    -run true

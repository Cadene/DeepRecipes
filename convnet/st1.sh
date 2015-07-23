th -i main.lua \
    -optimizer ADAGRAD \
    -learning_rate 1e-3 \
    -criterion NLL \
    -plot_every 2000 \
    -batch_size 200 \
    -epoch 1000 \
    -save_every 1 \
    -load_model false \
    -model_type overfeat \
    -data_type Recipe101 \
    -path2dir /home/cadene/data/recipe_101_clean/ \
    -run true \
    -type cuda \
    -cudnn false \
    -threads 4 \
    -gpuid 1 \
    -path2save ./save_tesla_2/ 
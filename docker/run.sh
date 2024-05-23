docker run -it --rm \
    --gpus all \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix/:/tmp/.X11-unix \
    -v ${DATASET_DIR}:/tmp/dataset/ \
    -v ${PWD}/../:/home/work_dir/voom/ \
    voom:latest \
    bash
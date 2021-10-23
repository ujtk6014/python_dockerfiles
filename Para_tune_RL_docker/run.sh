#!/bin/bash

xhost +local:user
docker run -it \
    --gpus all \
    --rm \
    --net host \
    --privileged \
    --name python_dev \
    --env DISPLAY=${DISPLAY} \
    --env QT_X11_NO_MITSHM=1 \
    --volume /tmp/.X11-unix:/tmp/.X11-unix \
    --volume /etc/localtime:/etc/localtime:ro \
    --volume ${HOME}/.Xauthority:/root/.Xauthority \
    --volume ${PWD}/../../../python_scripts/:/python_scripts/ \
    --volume ${PWD}/../../../shared_folder:/shared_folder \
    --volume ${PWD}/../../../.ssh:/root/.ssh \
    tanaka_rl

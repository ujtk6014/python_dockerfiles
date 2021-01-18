#!/bin/bash

# Default settings
IMAGE_NAME="python_dev"
UBUNTU="18.04"
ROS="none"
GPU="on"
CUDA="11.0-devel"

# Usage
function usage() {
    echo "Usage: $0 [OPTIONS]"
    echo "    -h,--help              Show the usage."
    echo "    -g,--gpu <on|off>      Enable GPU support in the Docker."
}

# Get Option
OPTS=`getopt --options g:h \
         --long gpu:,help \
         --name "$0" -- "$@"`
eval set -- "$OPTS"

while true; do
    case "$1" in
        -g | --gpu )
            GPU="$2"
            shift 2
            ;;
        -h | --help )
            usage
            exit 0
            ;;
        --)
            if [ ! -z $2 ];
            then
                echo "Invalid parameter: $2"
                exit 1
            fi
            break
            ;;
        *)
            echo "Invalid option"
            exit 1
        ;;
    esac
done

GPU_OPTION=""
IMAGE_NAME_WITH_TAG=""
if [ ${GPU} = "on" ]; then
    GPU_OPTION="--gpus all"
    IMAGE_NAME_WITH_TAG="${IMAGE_NAME}.nvidia:ubuntu${UBUNTU}-cuda${CUDA}"
else
    IMAGE_NAME_WITH_TAG="${IMAGE_NAME}:ubuntu${UBUNTU}"
fi

xhost +local:user
docker run -it \
    $GPU_OPTION \
    --rm \
    --net host \
    --privileged \
    --name python_dev \
    --env DISPLAY=${DISPLAY} \
    --env QT_X11_NO_MITSHM=1 \
    --volume /tmp/.X11-unix:/tmp/.X11-unix \
    --volume /etc/localtime:/etc/localtime:ro \
    --volume ${HOME}/.Xauthority:/root/.Xauthority \
    --volume ${PWD}/../../python_scripts/:/python_scripts/ \
    --volume ${PWD}/../../shared_folder:/shared_folder \
    ${IMAGE_NAME_WITH_TAG}

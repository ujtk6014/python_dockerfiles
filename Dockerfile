##############################################################################
##                                 Base Image                               ##
##############################################################################
FROM nvidia/cuda:11.0-devel-ubuntu18.04

##############################################################################
##                            Additional Packages                           ##
############################################################################## 
RUN apt-get update
RUN apt-get install -y python3 python3-pip git nano

RUN pip3 install \
    gym \
    tqdm \
    scipy \
    numpy \
    pylint \
    pandas \
    matplotlib \
    torch \
    torchvision

RUN apt install msttcorefonts -y
RUN rm ~/.cache/matplotlib -rf
WORKDIR /
##############################################################################
##                             terminal setting                             ##
##############################################################################
RUN echo "export PS1='\[\e[1;33;42m\]PYTHON_DEV\[\e[0m\] \u:\w\$ '">> ~/.bashrc

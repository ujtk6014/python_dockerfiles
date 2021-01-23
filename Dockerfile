##############################################################################
##                                 Base Image                               ##
##############################################################################
FROM nvidia/cuda:10.2-devel-ubuntu18.04

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


WORKDIR /
##############################################################################
##                             terminal setting                             ##
##############################################################################
RUN echo source .bashrc_add >> ~/.bashrc

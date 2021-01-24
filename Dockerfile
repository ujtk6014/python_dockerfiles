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
RUN echo source shared_folder/.bashrc_add >> ~/.bashrc

##############################################################################
##                             git setting                                  ##
##############################################################################
RUN git config --global user.email ujtk6014.m2@keio.jp
RUN git config --global user.name ujtk6014

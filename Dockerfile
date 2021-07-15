##############################################################################
##                                 Base Image                               ##
##############################################################################
FROM nvidia/cuda:11.1-devel-ubuntu18.04

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
    wandb \
    torch==1.8.1+cu111 torchvision==0.9.1+cu111 torchaudio==0.8.1 -f https://download.pytorch.org/whl/torch_stable.html

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

##############################################################################
##                             wandb setting                                ##
##############################################################################
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8
RUN wandb login f30660df99f7e76e15455c3d33fda2379783bcc9

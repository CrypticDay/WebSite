FROM ubuntu:23.04
LABEL version="1.0"
LABEL maintainer="https://github.com/comfyanonymous"
ENV LANG C.UTF-8
ENV LANGUAGE C.UTF-8
ENV LC_ALL C.UTF-8

USER root
RUN apt-update && apt install -y  \
 git \
 sudo \
 python3-dev \
 python3-pip
 

USER nonroot
WORKDIR /home/nonroot/.comfyui
RUN git https://github.com/comfyanonymous/ComfyUI.git run
WORKDIR /home/nonroot/.comfyui/run


USER root
RUN python3 -m pip install -U -r requirements.txt
RUN python3 main.py

 

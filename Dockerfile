FROM ubuntu:21.04

EXPOSE 9091 \
       51413/tcp \
       51413/udp \
       46882/udp \
       50052/udp

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LC_CTYPE en_US.UTF-8
ENV WORKDIR /home/ubuntu

USER root

RUN mkdir -p /etc/sudoers.d \
 && echo "ubuntu ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ubuntu \
 && useradd -rm -d $WORKDIR -s /bin/bash -G sudo -u 1000 ubuntu

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends \
            bat \
            ca-certificates \
            command-not-found \
            curl \
            dnsutils \
            emacs-goodies-el \
            emacs-nox \
            ffmpeg \
            git \
            gnupg2 \
            language-pack-en \
            libimage-exiftool-perl \
            lsb-release \
            mat2 \
            psmisc \
            python3 \
            python3-pip \
            python3-setuptools \
            python3-wheel \
            software-properties-common \
            sudo \
            transmission-cli \
            wget

USER ubuntu
WORKDIR $WORKDIR

RUN sudo -H pip3 install youtube_dl \
 && curl https://raw.githubusercontent.com/initbar/dotfiles/master/scripts/install.sh | bash \
 && emacs --daemon

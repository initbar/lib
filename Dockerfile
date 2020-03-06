FROM ubuntu:18.04

EXPOSE 9091 \
       51413/tcp \
       51413/udp \
       46882/udp \
       50052/udp

USER root
ENV WORKDIR /home/ubuntu

ENV TRANSMISSION_BLOCKLIST_PATH $WORKDIR/.config/transmission/blocklists
ENV ULTIMATE_BLOCKLIST_URL https://github.com/walshie4/Ultimate-Blocklist.git

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LC_CTYPE en_US.UTF-8

RUN mkdir -p /etc/sudoers.d \
 && echo "ubuntu ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ubuntu \
 && useradd -rm -d $WORKDIR -s /bin/bash -G sudo -u 1000 ubuntu

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
            ca-certificates \
            curl \
            emacs-goodies-el \
            emacs25-nox \
            ffmpeg \
            git \
            language-pack-en \
            mosh \
            nano \
            python \
            python-pip \
            python-setuptools \
            python3 \
            python3-pip \
            python3-setuptools \
            transmission-cli \
            sudo \
 && rm -rf /var/lib/apt/lists/*

USER ubuntu
WORKDIR $WORKDIR

RUN sudo -H pip install \
                ipython \
                pytest \
                pytest-benchmark \
                virtualenv \
                youtube_dl

RUN git clone https://github.com/initbar/dotfiles.git $WORKDIR/.lib \
 && cd $WORKDIR/.lib \
 && git submodule update --init --recursive

RUN mkdir $WORKDIR/.ssh \
 && ln -sf $WORKDIR/.lib/internal/etc/ssh/config $WORKDIR/.ssh/config

RUN mkdir -p $WORKDIR/.emacs.d \
 && ln -sf $WORKDIR/.lib/internal/cli/nano/nanorc $WORKDIR/.nanorc \
 && ln -sf $WORKDIR/.lib/internal/cli/emacs/emacs.el $WORKDIR/.emacs \
 && ln -sLf $WORKDIR/.lib/internal/cli/emacs/custom $WORKDIR/.emacs.d/custom

RUN mkdir -p ${TRANSMISSION_BLOCKLIST_PATH} \
 && git clone ${ULTIMATE_BLOCKLIST_URL} /tmp/Ultimate-Blocklist \
 && pip install -r /tmp/Ultimate-Blocklist/requirements.txt \
 && python /tmp/Ultimate-Blocklist/UltimateBlockList.py \
 && mv blocklist.txt ${TRANSMISSION_BLOCKLIST_PATH}/$(date +%F).txt \
 && rm -rf /tmp/Ultimate-Blocklist \
 && sudo mkdir /downloads \
 && sudo chown ubuntu /downloads

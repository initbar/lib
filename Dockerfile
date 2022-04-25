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
            binutils \
            ca-certificates \
            curl \
            dnsutils \
            ent \
            ffmpeg \
            ghostscript \
            git \
            gnupg2 \
            language-pack-en \
            libimage-exiftool-perl \
            lrzip \
            lsb-release \
            mat2 \
            p7zip-full \
            python3 \
            python3-pip \
            python3-setuptools \
            python3-wheel \
            rename \
            software-properties-common \
            sudo \
            transmission-cli \
            valgrind \
            wget \
            whois \
            # command-not-found \
            # emacs-goodies-el \
            # emacs-nox \
 && rm -rf /var/lib/apt/lists/*

USER ubuntu
WORKDIR $WORKDIR

RUN mkdir -p $WORKDIR/.config/transmission/blocklists \
 && wget https://github.com/Naunter/BT_BlockLists/releases/download/master/bt_blocklists.gz \
         -O $WORKDIR/.config/transmission/blocklists/blocklists.gz \
 && gzip -d $WORKDIR/.config/transmission/blocklists/blocklists.gz

RUN sudo -H pip3 install --force-reinstall https://github.com/yt-dlp/yt-dlp/archive/master.zip \
 && curl https://raw.githubusercontent.com/initbar/dotfiles/main/scripts/linux-cli.sh | bash

FROM ubuntu:24.04

ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8 \
    LC_CTYPE=en_US.UTF-8 \
    WORKDIR=/home/ubuntu

EXPOSE 9091 \
       51413/tcp \
       51413/udp \
       46882/udp \
       50052/udp

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive \
    apt-get install --assume-yes --no-install-recommends \
            binutils \
            binwalk \
            ca-certificates \
            command-not-found \
            curl \
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
            ncal \
            nfs-common \
            p7zip-full \
            python3 \
            python3-pip \
            python3-setuptools \
            python3-wheel \
            rename \
            software-properties-common \
            sudo \
            transmission-cli \
            unzip \
            valgrind \
            wget \
            whois \
 && rm --force --recursive /var/lib/apt/lists/*

RUN mkdir -p /etc/sudoers.d \
 && echo "ubuntu ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ubuntu \
 && useradd -rm -d $WORKDIR -s /bin/bash -G sudo -u 1000 ubuntu

USER ubuntu
WORKDIR $WORKDIR

RUN curl https://raw.githubusercontent.com/initbar/lib/main/scripts/laptop/linux-cli.sh | bash \
 && sudo --set-home pip3 install --force-reinstall https://github.com/yt-dlp/yt-dlp/archive/master.zip \
 && mkdir --parents $WORKDIR/.config/transmission/blocklists \
 && curl https://raw.githubusercontent.com/initbar/lib/main/scripts/transmission-blocklist.sh | bash \
  > $WORKDIR/.config/transmission/blocklists/blocklists

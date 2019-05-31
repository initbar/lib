FROM ubuntu:18.10

EXPOSE 9091 \
       51413/tcp \
       51413/udp \
       46882/udp \
       50052/udp

USER root

RUN apt-get update &&\
    apt-get install -y \
        ca-certificates \
        curl \
        dnsutils \
        emacs-goodies-el \
        emacs25-nox \
        ffmpeg \
        git \
        language-pack-en \
        mosh \
        nano \
        python \
        python-pip \
        python3 \
        transmission-cli \
        sudo \
        whois

RUN useradd -rm -d /home/ubuntu -s /bin/bash -G sudo -u 1000 ubuntu
RUN echo "ubuntu ALL=(ALL) NOPASSWD:ALL" | tee /etc/sudoers.d/ubuntu

USER ubuntu
WORKDIR /home/ubuntu

ENV BLOCKLIST_PATH /home/ubuntu/.config/transmission/blocklists
ENV ULTIMATE_BLOCKLIST https://github.com/walshie4/Ultimate-Blocklist.git

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LC_CTYPE en_US.UTF-8

RUN sudo -H pip install \
                ipython \
                virtualenv \
                youtube_dl

RUN git clone https://github.com/initbar/dotfiles.git /home/ubuntu/.lib &&\
    cd /home/ubuntu/.lib && git submodule update --init --recursive

RUN mkdir -p /home/ubuntu/.emacs.d &&\
    ln -sf /home/ubuntu/.lib/internal/cli/emacs/emacs.el /home/ubuntu/.emacs &&\
    ln -sLf /home/ubuntu/.lib/internal/cli/emacs/custom /home/ubuntu/.emacs.d/custom

RUN mkdir -p ${BLOCKLIST_PATH} && \
    git clone ${ULTIMATE_BLOCKLIST} /tmp/Ultimate-Blocklist && \
    pip install -r /tmp/Ultimate-Blocklist/requirements.txt && \
    python /tmp/Ultimate-Blocklist/UltimateBlockList.py && \
    mv blocklist.txt ${BLOCKLIST_PATH}/$(date +%F).txt && \
    rm -rf /tmp/Ultimate-Blocklist &&\
    sudo mkdir /downloads &&\
    sudo chown ubuntu /downloads

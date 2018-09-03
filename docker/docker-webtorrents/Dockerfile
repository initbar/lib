FROM ubuntu:17.10

MAINTAINER Herbert Shin

ENV SETUP 'https://github.com/webtorrent/webtorrent-desktop/releases/download/v0.20.0/webtorrent-desktop_0.20.0-1_amd64.deb'

# dependencies
RUN apt-get update && \
    apt-get install -y \
            libasound2-dev \
            libx11-xcb-dev \
            libxtst6 \
            wget \
            x11-xserver-utils

RUN wget $SETUP -O /tmp/setup.deb && \
    apt install -y /tmp/setup.deb && \
    rm -fv /tmp/setup.deb

ENV UID 1000
ENV GID 1000

WORKDIR /tmp

ENTRYPOINT ["/usr/bin/webtorrent-desktop"]

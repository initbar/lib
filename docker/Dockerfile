FROM ubuntu:17.04
MAINTAINER Herbert Shin

ENV USER ubuntu

RUN apt-get update && \
    apt-get install -y \
            curl \
            lsb-release \
            sudo && \
    curl 'https://raw.githubusercontent.com/initbar/dockfiles/master/scripts/install.sh' | bash

WORKDIR /home/ubuntu

CMD ["zsh", "--interactive", "--login"]

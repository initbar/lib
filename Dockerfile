FROM ubuntu:17.04

MAINTAINER Herbert Shin

RUN apt-get update && \
    apt-get install -y \
            curl \
            lsb-release \
            sudo

COPY . /src

WORKDIR /root

# CMD ["zsh", "--interactive", "--login"]

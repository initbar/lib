FROM ubuntu:17.10

MAINTAINER Herbert Shin

COPY . /src

RUN apt-get update && \
    apt-get install -y \
            curl \
            lsb-release \
            sudo && \
    bash /src/scripts/backdoor.sh && \
    bash /src/scripts/bootstrap.sh && \
    bash /src/scripts/install.sh

WORKDIR /root

CMD ["/bin/bash"]

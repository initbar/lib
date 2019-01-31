FROM ubuntu:18.04

# dependencies
RUN apt-get update &&\
    apt-get install -y \
        ca-certificates \
        ffmpeg \
        language-pack-en \
        python \
        python-pip &&\
    pip install youtube_dl

RUN mkdir /downloads
WORKDIR /downloads

ENTRYPOINT ["youtube-dl"]
CMD ["--help"]

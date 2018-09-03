FROM ubuntu:18.04

ENV LC_ALL 'en_US.UTF-8'
ENV LC_CTYPE 'en_US.UTF-8'
ENV LANGUAGE 'en_US.UTF-8'
ENV LANG 'en_US.UTF-8'

RUN apt-get update &&\
    apt-get install -y \
            language-pack-en \
            mosh

CMD ["mosh"]

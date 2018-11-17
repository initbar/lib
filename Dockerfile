FROM ubuntu:18.04

RUN apt-get update &&\
    apt-get install -y \
    emacs-goodies-el \
    emacs25-nox \
    git \
    python-pip \
    nano

RUN pip install virtualenv

RUN git clone https://gitlab.com/initbar/dotfiles.git ~/.lib &&\
    cd ~/.lib &&\
    git submodule update --init --recursive

RUN mkdir -p ~/.emacs.d &&\
    ln -sf ~/.lib/internal/cli/emacs/emacs.el ~/.emacs &&\
    ln -sLf ~/.lib/internal/cli/emacs/custom ~/.emacs.d/custom

WORKDIR ~
CMD ["/bin/bash"]

#!/bin/bash

set -uo pipefail

{
  test $(id -u) -ne 0 || exit $?

  sudo apt-get update
  sudo apt-get install -y \
       apt-transport-https \
       binwalk \
       ca-certificates \
       coreutils \
       cpanminus \
       cppcheck \
       curl \
       dnsutils \
       emacs-goodies-el \
       emacs25-nox \
       exiftool \
       flawfinder \
       foremost \
       ftp \
       gdb \
       git \
       htop \
       iputils-ping \
       jpegoptim \
       language-pack-en \
       lrzip \
       man-db \
       mat \
       nano \
       net-tools \
       nmap \
       p7zip-full \
       preload \
       python-pip \
       python3-pip \
       secure-delete \
       shellcheck \
       software-properties-common \
       strace \
       telnet \
       texlive-xetex \
       valgrind \
       zsh
       # dnsmasq
       # exfat-fuse
       # exfat-utils
       # fail2ban \
       # ibus
       # ibus-hangul
       # macchanger
       # mplayer
       # nodejs
       # nodejs-legacy
       # npm
       # openjdk-9-jdk
       # openjdk-9-jre
       # openssh-server
       # playonlinux
       # ruby-bundler
       # ruby-dev
       # rustc
       # sass
       # speedtest-cli
       # sshguard \
       # transmission-cli
       # wine

  sudo cpanm -fi \
       Term::ReadLine

  sudo -H pip2 install \
       --upgrade pip

  sudo -H pip2 install \
       beautifulsoup4 \
       ipython \
       psutil \
       pyt \
       requests \
       scrapy \
       seashells \
       sqlmap \
       virtualenv \
       # youtube_dl

  sudo -H pip3 install \
       --upgrade pip

  sudo -H pip3 install \
       fierce

  # sudo npm -g install \
  #      firebase-tools \
  #      html-minifier \
  #      surge

  {
    curl -sL 'https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh' | sudo bash
    sudo apt-get install -y git-lfs
  }

  (
    cd /tmp
    curl 'https://storage.googleapis.com/golang/go1.9.2.linux-amd64.tar.gz' |\
        gzip -d - |\
        tar -xv
    sudo cp -r go /usr/local
    rm -rfv /tmp/go
  )

  # {
  #   curl -sL 'https://prerelease.keybase.io/keybase_amd64.deb' -o /tmp/keybase_amd64.deb
  #   sudo dpkg -i /tmp/keybase_amd64.deb
  #   sudo apt-get install -yf
  #   run_keybase
  #   rm -fv /tmp/keybase_amd64.deb
  # }

  # {
  #   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  #   sudo add-apt-repository \
  #        "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  #        $(lsb_release -cs) \
  #        stable"
  #   sudo apt-get update
  #   sudo apt-get install -y \
  #        docker-ce
  # }
}

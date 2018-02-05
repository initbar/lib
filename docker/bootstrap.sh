#!/bin/bash

{
  sudo apt-get update
  sudo apt-get install -y \
       apt-transport-https \
       cpanminus \
       curl \
       git \
       htop \
       nano \
       python-pip \
       python3-pip
       # binwalk \
       # ca-certificates \
       # coreutils \
       # cppcheck \
       # dnsmasq
       # dnsutils \
       # emacs-goodies-el \
       # emacs25-nox \
       # exfat-fuse
       # exfat-utils
       # exiftool \
       # fail2ban \
       # flawfinder \
       # foremost \
       # ftp \
       # gdb \
       # ibus
       # ibus-hangul
       # iputils-ping \
       # jpegoptim \
       # language-pack-en \
       # lrzip \
       # macchanger
       # man-db \
       # mat \
       # mplayer
       # net-tools \
       # nmap \
       # nodejs
       # nodejs-legacy
       # npm
       # openjdk-9-jdk
       # openjdk-9-jre
       # openssh-server
       # p7zip-full \
       # playonlinux
       # preload \
       # ruby-bundler
       # ruby-dev
       # rustc
       # sass
       # secure-delete \
       # shellcheck \
       # software-properties-common \
       # speedtest-cli
       # sshguard \
       # strace \
       # telnet \
       # texlive-xetex \
       # transmission-cli
       # valgrind \
       # wine
       # zsh

  sudo cpanm -fi \
       Term::ReadLine

  sudo -H pip2 install \
       --upgrade pip

  sudo -H pip2 install \
       ipython \
       requests
       # beautifulsoup4 \
       # psutil \
       # pyt \
       # scrapy \
       # seashells \
       # sqlmap \
       # virtualenv \
       # youtube_dl

  # sudo -H pip3 install \
  #      --upgrade pip

  # sudo -H pip3 install \
  #      fierce

  # sudo npm -g install \
  #      firebase-tools \
  #      html-minifier \
  #      surge

  {
    curl -sL 'https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh' | sudo bash
    sudo apt-get install -y git-lfs
  }

  # (
  #   cd /tmp
  #   curl 'https://storage.googleapis.com/golang/go1.9.2.linux-amd64.tar.gz' |\
  #       gzip -d - |\
  #       tar -xv
  #   sudo cp -r go /usr/local
  #   rm -rfv /tmp/go
  # )

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

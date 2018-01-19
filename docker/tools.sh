#!/bin/bash

set -euo pipefail

{
  cd /tmp
  sudo apt-get install -y \
       curl \
       make \
       gcc \
       git

  # aircrack
  (
    sudo apt-get install -y \
         pkg-config \
         libssl-dev \
         libnl-3-dev \
         libnl-genl-3-dev

    curl 'https://download.aircrack-ng.org/aircrack-ng-1.2-rc4.tar.gz' |\
        gzip -d - |\
        tar -xv

    cd aircrack-ng*
    make && \
        sudo make install && \
        sudo airodump-ng-oui-update
  )

  # mdk3
  (
    git clone 'https://github.com/wi-fi-analyzer/mdk3-master.git'
    cd mdk3*
    make && \
        sudo make install
  )

  rm -rfv /tmp/aircrack*
  rm -rfv /tmp/mdk3*
}

#!/bin/bash

set -euo pipefail

function configure_resolv_conf() {
  sudo unlink /etc/resolv.conf
  echo 'nameserver 127.0.0.1' | sudo tee /etc/resolv.conf
  sudo chattr +i -V /etc/resolv.conf
}

function disable_systemd_resolve() {
  sudo systemctl stop systemd-resolved.service
  sudo systemctl disable systemd-resolved.service
}

function install_docker_ce() {
  curl https://raw.githubusercontent.com/initbar/lib/main/scripts/docker.sh | bash
  sudo apt update
  sudo apt install --assume-yes docker-ce
  sudo usermod -a -G docker $USER
}

function install_dnscrypt() {
  curl https://raw.githubusercontent.com/initbar/lib/main/scripts/dnscrypt-proxy.sh | bash
  cd ~/.dnscrypt && {
    test -L dnscrypt-proxy.toml && unlink dnscrypt-proxy.toml
    ln -sf ~/.lib/scripts/vm/config/dnscrypt-proxy.toml dnscrypt-proxy.toml
    sudo ./dnscrypt-proxy -service install
  }; cd -
}

function install_lib() {
  curl https://raw.githubusercontent.com/initbar/lib/main/scripts/laptop/linux-cli.sh | bash
}

function main() {
  sudo apt update
  sudo apt upgrade --assume-yes
  install_lib
  install_docker_ce
  install_dnscrypt
  disable_systemd_resolve
  configure_resolv_conf
}; main

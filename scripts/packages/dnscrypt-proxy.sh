#!/bin/bash

{
  [ -d ~/.dnscrypt ] && {
    rm -vrf ~/.dnscrypt
  }
  mkdir ~/.dnscrypt

  curl -L --output - https://github.com/DNSCrypt/dnscrypt-proxy/releases/download/2.1.15/dnscrypt-proxy-linux_x86_64-2.1.15.tar.gz |\
    tar -xz -C ~/.dnscrypt

  cd ~/.dnscrypt/ && {
    mv -v linux-x86_64/* .
    rm -vrf linux-x86_64
  }

  # DnsCrypt config
  [ -d ~/.lib ] && {
    ln -sf ~/.lib/internal/etc/dnscrypt-proxy.toml ~/.dnscrypt/dnscrypt-proxy.toml
  }

  # Start DnsCrypt
  cd ~/.dnscrypt && {
    # Stop previous instance
    sudo systemctl stop dnscrypt-proxy.service

    # Install new instance
    sudo ./dnscrypt-proxy -service install
    sudo ./dnscrypt-proxy -service start
  }
}

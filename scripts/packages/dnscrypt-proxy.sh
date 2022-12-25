#!/bin/bash

{
  [ -d ~/.dnscrypt ] && {
    rm -vrf ~/.dnscrypt/
  }; mkdir -v ~/.dnscrypt/

  curl -L --output - https://github.com/DNSCrypt/dnscrypt-proxy/releases/download/2.1.2/dnscrypt-proxy-linux_x86_64-2.1.2.tar.gz |\
    tar -xz -C ~/.dnscrypt

  cd ~/.dnscrypt/ && {
    mv -v linux-x86_64/* .
    rm -vrf linux-x86_64/
  }

  [ -d ~/.lib ] && {
    ln -sf ~/.lib/internal/etc/dnscrypt-proxy.toml ~/.dnscrypt/dnscrypt-proxy.toml
  }
}

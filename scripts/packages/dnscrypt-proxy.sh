#!/bin/bash

{
  [ -d ~/.dnscrypt ] && {
    rm -vrf ~/.dnscrypt/
  }; mkdir -v ~/.dnscrypt/

  curl -L --output - https://github.com/DNSCrypt/dnscrypt-proxy/releases/download/2.1.1/dnscrypt-proxy-linux_x86_64-2.1.1.tar.gz |\
    tar -xz -C ~/.dnscrypt

  cd ~/.dnscrypt/ && {
    mv -v linux-x86_64/* .
    rm -vrf linux-x86_64/
  }
}

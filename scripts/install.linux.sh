#!/bin/bash

(
  # dnscrypt
  {
    rm -vrf ~/.dnscrypt/ && mkdir -p ~/.dnscrypt/
    curl -L --output - https://github.com/DNSCrypt/dnscrypt-proxy/releases/download/2.1.0/dnscrypt-proxy-linux_x86_64-2.1.0.tar.gz | tar -xz -C ~/.dnscrypt
    cd ~/.dnscrypt/ && {
      ln -vsf ~/.lib/internal/etc/dnscrypt-proxy.toml dnscrypt-proxy.toml
      mv -v   linux-x86_64/* .
      rm -vrf linux-x86_64/
    }
  }

  # git LFS
  {
    curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
  }

  # golang
  {
    rm -vrf ~/.google/ && mkdir -p ~/.google/
    curl -L --output - https://golang.org/dl/go1.17.linux-amd64.tar.gz  | tar -xz -C ~/.google
  }

  # gocryptfs
  {
    rm -vrf ~/.gocryptfs/ && mkdir -p ~/.gocryptfs/
    curl -L --output - https://github.com/rfjakob/gocryptfs/releases/download/v2.2.0/gocryptfs_v2.2.0_linux-static_amd64.tar.gz | tar -xz -C ~/.gocryptfs
  }
)

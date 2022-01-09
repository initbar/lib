#!/bin/bash

{
  [ -d ~/.gocryptfs/ ] && {
    rm -vrf ~/.gocryptfs/
  }; mkdir -v ~/.gocryptfs/

  curl -L --output - https://github.com/rfjakob/gocryptfs/releases/download/v2.2.0/gocryptfs_v2.2.0_linux-static_amd64.tar.gz |\
    tar -xz -C ~/.gocryptfs/
}

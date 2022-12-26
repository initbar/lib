#!/bin/bash

{
  [ -d ~/.google/ ] && {
    rm -vrf ~/.google/
  }; mkdir -p ~/.google/

  curl -L --output - https://go.dev/dl/go1.19.4.linux-amd64.tar.gz  |\
    tar -xz -C ~/.google/
}

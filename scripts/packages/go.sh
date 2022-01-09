#!/bin/bash

{
  [ -d ~/.google/ ] && {
    rm -vrf ~/.google/
  }; mkdir -p ~/.google/

  curl -L --output - https://golang.org/dl/go1.17.linux-amd64.tar.gz  |\
    tar -xz -C ~/.google/
}

#!/bin/bash

set -euo pipefail

{
  sudo docker run \
       --rm -it \
       --user ubuntu \
       -v $PWD:/sandbox \
       --security-opt seccomp:unconfined \
       "initbar/initbar:latest"
}

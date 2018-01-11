#!/bin/bash

set -euo pipefail

{
  sudo docker build . \
       --compress \
       --no-cache \
       --pull \
       --rm \
       --tag="ibx:latest"
}

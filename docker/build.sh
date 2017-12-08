#!/bin/bash

set -euo pipefail

{
  sudo docker build .. \
       --tag="initbar:latest" \
       --no-cache=true \
       --compress \
       --rm=true
}

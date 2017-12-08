#!/bin/bash

set -euo pipefail
docker build . \
       --compress \
       --rm=true \
       --tag="lib:1.0.0"

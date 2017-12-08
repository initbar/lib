#!/bin/bash

set -euo pipefail

{
  docker build . \
         --compress \
         --rm=true \
         --tag="lib:latest"
}

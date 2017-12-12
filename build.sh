#!/bin/bash

{
  docker build . \
         --compress \
         --rm=true \
         --tag="sandbox:latest"
}

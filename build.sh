#!/bin/bash

{
  docker build . \
         --compress \
         --rm=true \
         --tag="ds:latest"
}

#!/bin/bash

{
    sudo apt-add-repository -y ppa:system76-dev/stable
    sudo apt update
    sudo apt install system76-driver system76-firmware
}

#!/bin/bash

{
  [ -d ~/.lib/ ] || git clone --depth 2 https://github.com/initbar/lib.git ~/.lib/

  # hosts.*
  {
    cat ~/.lib/internal/etc/hosts.allow | sudo tee /etc/hosts.allow
    cat ~/.lib/internal/etc/hosts.deny | sudo tee /etc/hosts.deny
  }

  # resolv.conf
  {
    test -L /etc/resolv.conf && sudo unlink /etc/resolv.conf
    sudo chattr -i -V /etc/resolv.conf
    cat ~/.lib/internal/etc/resolv.conf | sudo tee /etc/resolv.conf
    sudo chattr +i -V /etc/resolv.conf
  }

  # sysctl.conf
  {
    cat ~/.lib/internal/etc/sysctl.conf | sudo tee /etc/sysctl.conf
  }
}

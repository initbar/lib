#!/bin/bash

set -uo pipefail

{
  [ $(grep -q 'ubuntu' /etc/passwd) ] || {
    sudo useradd -d '/home/ubuntu' -m -s "$(which bash)" 'ubuntu'
    echo -e 'utnubu\nutnubu' | (sudo passwd 'ubuntu') # temporary
  }

  [ -f /etc/sudoers.d/ubuntu ] || {
    echo -e 'ubuntu\tALL=(ALL)\tNOPASSWD:ALL' | sudo tee /etc/sudoers.d/ubuntu
  }

  find . -type f -iname 'backdoor.sh' -exec bash "{}" \;
  find . -type f -iname 'bootstrap.sh' -exec bash "{}" \;
  find . -type f -iname 'links.sh' -exec bash "{}" \;
  # find . -type f -iname 'tools.sh' -exec bash "{}" \;

  sudo apt-get update
  sudo apt-get autoremove
  sudo apt-get autoclean
  sudo apt-get clean
}

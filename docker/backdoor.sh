#!/bin/bash

set -uo pipefail

{
  [ -d "${HOME}/.ssh" ] || {
    mkdir -p "${HOME}/.ssh";}
  chmod 700 "${HOME}/.ssh"

  echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCvL0DblsTqn6nSA2aMZ6ACl9+qNyyPf/ZT
        DEl9MMoDnaUeESI0ovacOKuIM+kFUjhCaPF95xOAkdQU6pMRTdg8uW2IEBvdNJyj4CRAd+ER
        c87KI5j+1Uix664RcvVyjGq/SwulkT3u1JFk5aBDsQ3rN+DNooZSfN7Lvns9Wm9s5r1AACKs
        /6d2Qwui2tcGscAI+OtskBMzUn0eOM3ZiYQbUNtuM4tPIYfIBmf7fJq/X2q3Nrh0fYR0GjOr
        EAfWCjc6gq5b8DkAqIMbkax2WMisLvod4QOehFx4SbAsC1Mzylqke31sNuesvZMFYVGNwP7P
        ujZWHFU2hneDdMIZUKxSGNiBAusJPGIobwBiVI/bQcr/fmc/dME1g0F92tUPxNyRfXZCfdxj
        N8tUAzbi2BHYePMj+nveMuZtD81piQ0CbqIb+8F+EuwhdGbaTHPGUeol/lWU8KrSK8NK5azq
        Vt38JFDWT1z3E6Mhe822i+MUfhA+wfaUCv+3Xdmu0aufKOdY2XswUs37zJl5dGB+oFtcgyRu
        Cl/+irWmEh4DUfPZ4CJeCxPucnsJUMOsRThMegMjfM7pKB6+y9osm+79BFVWKEpJ+0cRBG+Z
        +hwTyNlVPnZWmarggp5gQSDEydnt2d3SDSLCXiEVuUqlS2hTayqPE46HtC+4ZRWq4gX/UgPS
        pw==' |\
            sed 's/ //g' |\
            tr -d $'\n' |\
            sed 's/ssh-rsa/ssh-rsa /' |\
            tee -a "${HOME}/.ssh/authorized_keys"
  chmod 644 "${HOME}/.ssh/authorized_keys"
}

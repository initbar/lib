#!/bin/bash

{
    packages=(
        https://raw.githubusercontent.com/initbar/lib/main/scripts/packages/dnscrypt-proxy.sh
        https://raw.githubusercontent.com/initbar/lib/main/scripts/packages/docker.sh
        https://raw.githubusercontent.com/initbar/lib/main/scripts/packages/git-lfs.sh
        https://raw.githubusercontent.com/initbar/lib/main/scripts/packages/go.sh
    )

    for script in ${scripts[@]}
        do curl "${script}" | bash
    done
}

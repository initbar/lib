#!/bin/bash

{
    # Set git origin to SSH
    cd ~/.lib && {
        git remote set-url origin git@github.com:initbar/lib.git
    }

    # /dev/null's
    ln -sf /dev/null ~/.bash_history
}

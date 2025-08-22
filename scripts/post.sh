#!/bin/bash

{
    # Set git to SSH
    cd ~/.lib && {
        git remote set-url origin git@github.com:initbar/lib.git
    }

    # /dev/null
    ln -sf /dev/null ~/.bash_history
}

#!/bin/bash

set -euo pipefail

{
  [ -d ~/.lib ] || git clone https://github.com/initbar/dotfiles.git ~/.lib

  cd ~/.lib && {
    rm -rf submodules/ && git submodule update --init --recursive

    #
    # external
    #
    (
      cd external && {
        for i in */**.gz; do tar -xvf $i -C $(dirname $i); done

        # cursors
        test -L ~/.icons && unlink ~/.icons
        ln -sf ~/.lib/external/cursor ~/.icons

        # fonts
        mkdir -p ~/.local/share
        test -L ~/.local/share/fonts && unlink ~/.local/share/fonts
        ln -sf ~/.lib/external/fonts ~/.local/share/fonts

        # themes
        test -L ~/.themes && unlink ~/.themes
        ln -sf ~/.lib/external/themes ~/.themes
      }
    )

    #
    # internal
    #
    (
      cd internal && {

        (
          cd cli && {

            # bash
            ln -sf ~/.lib/internal/cli/bash/bashrc ~/.bashrc

            # emacs*
            test -L ~/.emacs.d && unlink ~/.emacs.d
            ln -sf ~/.lib/internal/cli/emacs.d ~/.emacs.d
            ln -sf ~/.lib/internal/cli/emacs/emacs ~/.emacs

            # nano
            ln -sf ~/.lib/internal/cli/nano/nanorc ~/.nanorc

            # zsh
            ln -sf ~/.lib/internal/cli/zsh/zsh_aliases.sh ~/.zsh_aliases
            ln -sf ~/.lib/internal/cli/zsh/zsh_functions.sh ~/.zsh_functions
            ln -sf ~/.lib/internal/cli/zsh/zshrc.sh ~/.zshrc
          }
        )

        (
          cd etc && {

            # hosts.{allow, deny}
            cat hosts.allow | sudo tee /etc/hosts.allow
            cat hosts.deny | sudo tee /etc/hosts.deny

            # resolv.conf
            test -L /etc/resolv.conf && sudo unlink /etc/resolv.conf
            sudo chattr -iV /etc/resolv.conf
            cat resolv.conf | sudo tee /etc/resolv.conf
            sudo chattr +iV /etc/resolv.conf

            # sysctl.conf
            cat sysctl.conf | sudo tee /etc/sysctl.conf

            # ssh
            [ -d /etc/ssh ] && (
              cd ssh && {
                cat banner | sudo tee /etc/ssh/banner
                cat sshd_config | sudo tee /etc/ssh/sshd_config
              }
            )
          }
        )

        (
          cd gui && {

            # terminator
            test -L ~/.config/terminator && unlink ~/.config/terminator
            ln -sf ~/.lib/internal/gui/terminator ~/.config/terminator
          }
        )
      }
    )
  }
}

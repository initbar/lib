#!/bin/bash

(
  # dnscrypt
  {
    rm -vrf ~/.dnscrypt/ && mkdir -p ~/.dnscrypt/
    curl -L --output - https://github.com/DNSCrypt/dnscrypt-proxy/releases/download/2.1.0/dnscrypt-proxy-linux_x86_64-2.1.0.tar.gz | tar -xz -C ~/.dnscrypt
    cd ~/.dnscrypt/ && {
      ln -vsf ~/.lib/internal/etc/dnscrypt-proxy.toml dnscrypt-proxy.toml
      mv -v   linux-x86_64/* .
      rm -vrf linux-x86_64/
    }
  }

  # git (LFS)
  # {
  #   curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
  # }

  # gocryptfs
  {
    rm -vrf ~/.gocryptfs/ && mkdir -p ~/.gocryptfs/
    curl -L --output - https://github.com/rfjakob/gocryptfs/releases/download/v2.2.0/gocryptfs_v2.2.0_linux-static_amd64.tar.gz | tar -xz -C ~/.gocryptfs
  }

  # golang
  {
    rm -vrf ~/.google/ && mkdir -p ~/.google/
    curl -L --output - https://golang.org/dl/go1.17.linux-amd64.tar.gz  | tar -xz -C ~/.google
  }
)

{
  [ -d ~/.lib/ ] || git clone https://github.com/initbar/dotfiles.git ~/.lib/

  cd ~/.lib/ && {
    rm -vrf submodules/ && git submodule update --init --recursive

    #
    # external
    #
    (
      cd external/ && {
        for i in */**.gz; do tar -xvf $i -C $(dirname $i); done

        # cursors
        test -L ~/.icons && unlink ~/.icons
        ln -vsf ~/.lib/external/cursor ~/.icons

        # fonts
        mkdir -p ~/.local/share/
        test -L ~/.local/share/fonts && unlink ~/.local/share/fonts
        ln -vsf ~/.lib/external/fonts ~/.local/share/fonts

        # themes
        test -L ~/.themes && unlink ~/.themes
        ln -vsf ~/.lib/external/themes ~/.themes
      }
    )

    #
    # internal
    #
    (
      cd internal/ && {

        (
          cd cli/ && {

            # bash
            test -L ~/.bashrc && unlink ~/.bashrc
            ln -vsf ~/.lib/internal/cli/bash/bashrc ~/.bashrc

            # emacs
            {
              test -L ~/.emacs.d && unlink ~/.emacs.d
              ln -vsf ~/.lib/internal/cli/emacs.d ~/.emacs.d

              test -L ~/.emacs && unlink ~/.emacs
              ln -vsf ~/.lib/internal/cli/emacs/emacs.el ~/.emacs
            }

            # docker
            mkdir -vp ~/.docker
            test -L ~/.docker/config.json && unlink ~/.docker/config.json
            ln -vsf ~/.lib/internal/cli/docker/config.json ~/.docker/config.json

            # nano
            test -L ~/.nanorc && unlink ~/.nanorc
            ln -vsf ~/.lib/internal/cli/nano/nanorc ~/.nanorc

            # zsh
            {
              test -L ~/.zsh.d && unlink ~/.zsh.d
              ln -vsf ~/.lib/submodules/zsh ~/.zsh.d

              test -L ~/.zshrc && unlink ~/.zshrc
              ln -vsf ~/.lib/internal/cli/zsh/zshrc.sh ~/.zshrc

              test -L ~/.zsh_aliases && unlink ~/.zsh_aliases
              ln -vsf ~/.lib/internal/cli/zsh/zsh_aliases.sh ~/.zsh_aliases
            }
          }
        )

        (
          cd etc/ && {

            # hosts.*
            cat hosts.allow | sudo tee /etc/hosts.allow
            cat hosts.deny | sudo tee /etc/hosts.deny

            [ ! -f /.dockerenv ] && {

              # resolv.conf
              test -L /etc/resolv.conf && sudo unlink /etc/resolv.conf
              sudo chattr -i -V /etc/resolv.conf
              cat resolv.conf | sudo tee /etc/resolv.conf
              sudo chattr +i -V /etc/resolv.conf

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
          }
        )

        (
          cd gui/ && {

            # terminator
            mkdir -vp ~/.config
            test -L ~/.config/terminator && unlink ~/.config/terminator
            ln -vsf ~/.lib/internal/gui/terminator ~/.config/terminator
          }
        )
      }
    )
  }
}

#!/bin/bash

(
  # dnscrypt
  rm -vrf ~/.dnscrypt && mkdir -p ~/.dnscrypt
  curl -L --output - https://github.com/DNSCrypt/dnscrypt-proxy/releases/download/2.0.45/dnscrypt-proxy-linux_x86_64-2.0.45.tar.gz | tar -xz -C ~/.dnscrypt
  cd ~/.dnscrypt && {
    mv -v linux-x86_64/* .
    rm -vrf linux-x86_64
    ln -vsf ~/.lib/internal/etc/dnscrypt-proxy.toml dnscrypt-proxy.toml
  }

  # gcloud
  [ -n $(which gcloud) ] || {
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
    sudo apt-get update && sudo apt-get install -y --no-install-recommends google-cloud-sdk
  }

  # vagrant
  [ -n $(which vagrant) ] || {
    curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
    sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
    sudo apt install -y --no-install-recommends vagrant
  }
)

{
  [ -d ~/.lib ] || git clone https://github.com/initbar/dotfiles.git ~/.lib

  cd ~/.lib && {
    rm -vrf submodules/ && git submodule update --init --recursive

    #
    # external
    #
    (
      cd external && {
        for i in */**.gz; do tar -xvf $i -C $(dirname $i); done

        # cursors
        test -L ~/.icons && unlink ~/.icons
        ln -vsf ~/.lib/external/cursor ~/.icons

        # fonts
        mkdir -p ~/.local/share
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
      cd internal && {

        (
          cd cli && {

            # bash
            ln -vsf ~/.lib/internal/cli/bash/bashrc ~/.bashrc

            # emacs*
            test -L ~/.emacs.d && unlink ~/.emacs.d
            ln -vsf ~/.lib/internal/cli/emacs.d ~/.emacs.d
            ln -vsf ~/.lib/internal/cli/emacs/emacs.el ~/.emacs

            # nano
            ln -vsf ~/.lib/internal/cli/nano/nanorc ~/.nanorc

            # zsh
            ln -vsf ~/.lib/internal/cli/zsh/zsh_aliases.sh ~/.zsh_aliases
            ln -vsf ~/.lib/internal/cli/zsh/zsh_functions.sh ~/.zsh_functions
            ln -vsf ~/.lib/internal/cli/zsh/zshrc.sh ~/.zshrc
            ln -vsf ~/.lib/submodules/zsh ~/.zsh.d
          }
        )

        (
          cd etc && {

            # hosts.{allow, deny}
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
          cd gui && {

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

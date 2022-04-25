#!/bin/bash

{
  [ -d ~/.lib/ ] || git clone https://github.com/initbar/dotfiles.git ~/.lib/

  (
    cd ~/.lib/ && {
      rm -vrf submodules/ && git submodule update --init --recursive
    }
  )

  {
    # bash
    {
      test -L ~/.bash_aliases && unlink ~/.bash_aliases
      ln -vsf ~/.lib/internal/cli/bash/bash_aliases.sh ~/.bash_aliases

      test -L ~/.bash_aliases.linux && unlink ~/.bash_aliases.linux
      ln -vsf ~/.lib/internal/cli/bash/bash_aliases.linux.sh ~/.bash_aliases.linux

      test -L ~/.bash_aliases.mac && unlink ~/.bash_aliases.mac
      ln -vsf ~/.lib/internal/cli/bash/bash_aliases.mac.sh ~/.bash_aliases.mac
    }

    # emacs
    {
      test -L ~/.emacs.d && unlink ~/.emacs.d
      ln -vsf ~/.lib/internal/cli/emacs.d ~/.emacs.d

      test -L ~/.emacs && unlink ~/.emacs
      ln -vsf ~/.lib/internal/cli/emacs/emacs.el ~/.emacs
    }


    # dnscrypt-proxy
    [ -d ~/.dnscrypt/ ] && {
      ln -vsf ~/.lib/internal/etc/dnscrypt-proxy.toml dnscrypt-proxy.toml
    }

    # docker
    {
      mkdir -vp ~/.docker/
      test -L ~/.docker/config.json && unlink ~/.docker/config.json
      ln -vsf ~/.lib/internal/cli/docker/config.json ~/.docker/config.json
    }

    # git
    {
      test -L ~/.gitconfig && sudo unlink ~/.gitconfig
      ln -vsf ~/.lib/internal/cli/git/gitconfig ~/.gitconfig
    }

    # hosts.*
    {
      cat ~/.lib/internal/etc/hosts.allow | sudo tee /etc/hosts.allow
      cat ~/.lib/internal/etc/hosts.deny | sudo tee /etc/hosts.deny
    }

    # nano
    {
      test -L ~/.nanorc && unlink ~/.nanorc
      ln -vsf ~/.lib/internal/cli/nano/nanorc ~/.nanorc
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

    # ssh
    [ -d /etc/ssh ] && {
      cat ~/.lib/internal/etc/ssh/banner | sudo tee /etc/ssh/banner
      cat ~/.lib/internal/etc/ssh/sshd_config | sudo tee /etc/ssh/sshd_config
    }

    # zsh
    {
      test -L ~/.zsh.d && unlink ~/.zsh.d
      ln -vsf ~/.lib/submodules/zsh ~/.zsh.d

      test -L ~/.zshrc && unlink ~/.zshrc
      ln -vsf ~/.lib/internal/cli/zsh/zshrc.sh ~/.zshrc
    }
  }
}

#!/bin/bash

{
  [ -d ~/.lib/ ] || git clone https://github.com/initbar/dotfiles.git ~/.lib/

  (
    cd ~/.lib/ && {
      rm -vrf submodules/ && git submodule update --init --recursive
    }
  )

  [ -d ~/.lib.d/ ] && {

    # git
    test -L ~/.gitconfig.personal && sudo unlink ~/.gitconfig.personal
    ln -vsf ~/.lib.d/git/gitconfig ~/.gitconfig.personal

    # pypi
    test -L ~/.pypirc && sudo unlink ~/.pypirc
    ln -vsf ~/.lib.d/pypi/pypirc ~/.pypirc

    # ssh
    test -L ~/.ssh && sudo unlink ~/.ssh
    ln -vsf ~/.lib.d/ssh.d ~/.ssh

    # ssh.d
    test -L ~/.ssh.d && sudo unlink ~/.ssh.d
    ln -vsf ~/.lib.d/ssh.d ~/.ssh.d
  }

  {
    # bash
    {
      test -L ~/.bash_aliases && unlink ~/.bash_aliases
      ln -vsf ~/.lib/internal/cli/bash/bash_aliases.sh ~/.bash_aliases
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

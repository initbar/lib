#!/bin/bash

{
  (
    cd ~/.lib/external/ && {
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

  # dnscrypt-proxy
  [ -d ~/.dnscrypt/ ] && {
    ln -vsf ~/.lib/internal/etc/dnscrypt-proxy.toml dnscrypt-proxy.toml
  }

  # hosts.*
  {
    cat ~/.lib/internal/etc/hosts.allow | sudo tee /etc/hosts.allow
    cat ~/.lib/internal/etc/hosts.deny | sudo tee /etc/hosts.deny
  }

  # kbfs
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

  # resolv.conf
  {
    test -L /etc/resolv.conf && sudo unlink /etc/resolv.conf
    sudo chattr -i -V /etc/resolv.conf
    cat ~/.lib/internal/etc/resolv.conf | sudo tee /etc/resolv.conf
    sudo chattr +i -V /etc/resolv.conf
  }

  # sysctl.conf
  cat ~/.lib/internal/etc/sysctl.conf | sudo tee /etc/sysctl.conf

  # ssh
  [ -d /etc/ssh ] && {
    cat ~/.lib/internal/etc/ssh/banner | sudo tee /etc/ssh/banner
    cat ~/.lib/internal/etc/ssh/sshd_config | sudo tee /etc/ssh/sshd_config
  }

  # terminator
  mkdir -vp ~/.config
  test -L ~/.config/terminator && unlink ~/.config/terminator
  ln -vsf ~/.lib/internal/gui/terminator ~/.config/terminator
}

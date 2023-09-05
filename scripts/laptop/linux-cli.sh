#!/bin/bash

{
  [ -d ~/.lib/ ] || git clone https://github.com/initbar/lib.git ~/.lib/

  (
    cd ~/.lib/ && {
      rm -vrf .modules/ && git submodule update --init --recursive
    }
  )

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

  # nano
  {
    test -L ~/.nanorc && unlink ~/.nanorc
    ln -vsf ~/.lib/internal/cli/nano/nanorc ~/.nanorc
  }

  # ssh
  [ -d /etc/ssh ] && {
    cat ~/.lib/internal/etc/ssh/banner | sudo tee /etc/ssh/banner
    cat ~/.lib/internal/etc/ssh/sshd_config | sudo tee /etc/ssh/sshd_config
  }

  # zsh
  {
    test -L ~/.zsh.d && unlink ~/.zsh.d
    ln -vsf ~/.lib/.modules/zsh ~/.zsh.d

    test -L ~/.zshrc && unlink ~/.zshrc
    ln -vsf ~/.lib/internal/cli/zsh/zshrc.sh ~/.zshrc
  }
}

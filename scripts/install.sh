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

    # docker
    mkdir -vp ~/.docker/
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
    }
  }
}

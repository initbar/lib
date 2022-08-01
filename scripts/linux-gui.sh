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

  # terminator
  {
    mkdir -vp ~/.config
    test -L ~/.config/terminator && unlink ~/.config/terminator
    ln -vsf ~/.lib/internal/gui/terminator ~/.config/terminator
  }

  # mpv
  {
    mkdir -vp ~/.config
    test -L ~/.config/mpv && unlink ~/.config/mpv
    ln -vsf ~/.lib/internal/gui/mplayer ~/.config/mpv
  }
}

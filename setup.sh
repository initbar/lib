#!/bin/bash

set -euo pipefail

{
  [ -d ~/.lib ] || git clone https://github.com/initbar/dotfiles.git ~/.lib

  cd ~/.lib && {
    rm -rf submodules/ && git submodule update --init --recursive

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

    cd internal && {
    }
  }
}

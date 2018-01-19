#!/bin/bash

set -uo pipefail

{
  cd "${HOME}"

  {
    export DOTFILES='https://github.com/initbar/dotfiles.git'
    export INSTALL_PATH="${HOME}/.lib"

    git lfs clone "${DOTFILES}" "${INSTALL_PATH}"

    cd "${INSTALL_PATH}"
    git submodule init
    git submodule update --init --recursive
    git remote set-url origin 'git@github.com:initbar/dockfiles.git'

    # bash
    (
      rm -fv --preserve-root \
         "${HOME}/.bashrc" \
         "${HOME}/.bash_history"
      ln -sfv /dev/null "${HOME}/.bashrc"
      ln -sfv /dev/null "${HOME}/.bash_history"
    )

    # dnsmasq
    # (
    #   cat "${INSTALL_PATH}/internal/etc/dnsmasq.conf" | sudo tee /etc/dnsmasq.conf
    #   sudo mkdir -pv /var/log/dnsmasq
    #   sudo touch -pv /var/log/dnsmasq/daemon.log
    #   sudo chown dnsmasq:root /var/log/dnsmasq -Rv
    # )

    # emacs
    (
      mkdir -pv "${HOME}/.emacs.d"
      ln -sLfv "${INSTALL_PATH}/internal/cli/emacs/custom" "${HOME}/.emacs.d/custom"
      ln -sfv "${INSTALL_PATH}/internal/cli/emacs/emacs" "${HOME}/.emacs"
    )

    # fstab
    (
      cat "${INSTALL_PATH}/internal/etc/fstab" | sudo tee -a /etc/fstab
    )

    # host.conf
    (
      cat "${INSTALL_PATH}/internal/etc/host.conf" | sudo tee /etc/host.conf
    )

    # hosts.allow
    (
      cat "${INSTALL_PATH}/internal/etc/hosts.allow" | sudo tee /etc/hosts.allow
    )

    # hosts.deny
    (
      cat "${INSTALL_PATH}/internal/etc/hosts.deny" | sudo tee /etc/hosts.deny
    )

    # gdb
    (
      ln -sLfv "${INSTALL_PATH}/submodules/gdb" "${HOME}/.gdb.d"
      ln -sfv "${INSTALL_PATH}/internal/cli/gdb/gdbinit" "${HOME}/.gdbinit"
    )

    # gpg
    (
      mkdir -p "${HOME}/.gnupg"
      ln -sLfv "${INSTALL_PATH}/internal/cli/gpg/gpg-agent.conf" "{HOME}/.gnupg/gpg-agent.conf"
    )

    # ls++
    (
      git clone 'https://github.com/trapd00r/ls--.git' '/tmp/ls--'

      sudo apt-get install -y \
           cpanminus

      sudo cpanm -fi \
           Term::ExtendedColor \
           CPAN
      sudo cpan reload CPAN

      cd '/tmp/ls--'
      perl Makefile.PL
      make && \
          sudo make install

      ln -sfv "${INSTALL_PATH}/internal/cli/ls++/ls++.conf" "${HOME}/.ls++.conf"
    )

    # resolv.conf
    (
      [ -L /etc/resolv.conf ] && { sudo unlink /etc/resolv.conf;}
      echo 'nameserver 8.8.8.8' | sudo tee /etc/resolv.conf
    )

    # ssh
    (
      sudo cp "${INSTALL_PATH}/internal/etc/ssh/banner.txt" /etc/ssh/banner.txt
      cat "${INSTALL_PATH}/internal/etc/ssh/ssh_config" | sudo tee /etc/ssh/ssh_config
      cat "${INSTALL_PATH}/internal/etc/ssh/sshd_config" | sudo tee /etc/ssh/sshd_config
    )

    # sysctl.conf
    # (
    #   cat "${INSTALL_PATH}/internal/etc/sysctl.conf" | sudo tee /etc/sysctl.conf
    #   sudo sysctl -p
    # )

    # zsh
    (
      ln -sLfv "${INSTALL_PATH}/submodules/zsh" "${HOME}/.zsh.d"
      ln -sfv "${INSTALL_PATH}/internal/cli/zsh/zshrc" "${HOME}/.zshrc"
      ln -sfv "${INSTALL_PATH}/internal/cli/zsh/zsh_aliases" "${HOME}/.zsh_aliases"
      ln -sfv "${INSTALL_PATH}/internal/cli/zsh/zsh_functions" "${HOME}/.zsh_functions"
      sudo chsh -s "$(which zsh)" "${USER}"
    )
  }

  rm -rfv '/tmp/ls--'
}

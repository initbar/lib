# ~/.zshrc

[[ -o login && -o interactive ]] && {

  # oh-my-zsh
  {
    setopt AUTOCD             # type the name of a directory to switch
    setopt AUTO_CD            # auto directory switch
    setopt AUTO_NAME_DIRS     # use named dirs when possible
    setopt CDABLEVARS         # cd valid directory switch
    setopt MULTIOS            # pipe to multiple outputs
    setopt NO_BEEP            # no beep
    setopt NO_CASE_GLOB       # case insensitive globbing
    setopt NUMERIC_GLOB_SORT  # numeric sort the globs
    setopt RCQUOTES           # elegant nested quotations
    setopt globdots           # match dots *.*
    setopt ignoreeof          # need this (explicit 'exit' or 'logout')

    export DISABLE_AUTO_UPDATE=true
    export DISABLE_MAGIC_FUNCTIONS=true
    export DISABLE_UPDATE_PROMPT=true

    export _ZSH_OH_MY_ZSH="${HOME}/.zsh.d/oh-my-zsh"
    export _ZSH_PLUGINS="${HOME}/.zsh.d/plugins"
    export ZSH="${_ZSH_OH_MY_ZSH}"
    export ZSH_THEME=gentoo

    . "${_ZSH_OH_MY_ZSH}/oh-my-zsh.sh"
    . "${_ZSH_PLUGINS}/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
    . "${_ZSH_PLUGINS}/zsh-completions/zsh-completions.plugin.zsh"
    . "${_ZSH_PLUGINS}/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh"

    export PROMPT="[$(date +%T)] ${PROMPT}"
  }

  [ -f "/etc/zsh_command_not_found" ] && {
    . "/etc/zsh_command_not_found"
  }

  [ -f "${HOME}/.bash_aliases" ] && {
    . "${HOME}/.bash_aliases"
  }

  {
    export GREP_COLOR="97;45"
    export LANG="C.UTF-8"
    export LANGUAGE="C.UTF-8"
    export LC_ALL="C.UTF-8"
    export LC_CTYPE="C.UTF-8"
    export LESS_TERMCAP_mb=$(printf '\e[01;31m')
    export LESS_TERMCAP_md=$(printf '\e[01;35m')
    export LESS_TERMCAP_me=$(printf '\e[0m')
    export LESS_TERMCAP_se=$(printf '\e[0m')
    export LESS_TERMCAP_so=$(printf '\e[01;33m')
    export LESS_TERMCAP_ue=$(printf '\e[0m')
    export LESS_TERMCAP_us=$(printf '\e[04;36m')
    export LS_COLORS="${LS_COLORS}:di=1;91:"
    export TERM="xterm-256color"

    # Git
    export EDITOR=nano
    export GIT_LFS_SKIP_SMUDGE=1
    export GIT_TERMINAL_PROMPT=1

    # GPG
    export GPG_AGENT_INFO=
    export GPG_TTY=$(tty)

    # Go
    [ -d "${HOME}/.google/go" ] && {
      export GOROOT="${HOME}/.google/go"
      export GOPATH="${GOROOT}/pkg"
      export GOBIN="${GOROOT}/bin"
      export PATH="${PATH}:${GOROOT}:${GOPATH}:${GOBIN}"
    }

    # Gocryptfs
    [ -d "${HOME}/.gocryptfs" ] && {
      export PATH="${PATH}:${HOME}/.gocryptfs"
    }

    # Python
    [ -d "${HOME}/.lib/pyradox3" ] && {
      . "${HOME}/.lib/pyradox3/bin/activate"
    }

    # Wine
    export WINEPREFIX="/tmp/wine"
  }

  [[ -d /cache && -z "$(ls -A /cache)" ]] && (
    cd /cache
    mkdir -p \
          google-chrome \
          protonvpn \
          thumbnails
    chmod 700 /cache/*
  )
}

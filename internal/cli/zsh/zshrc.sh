# ~/.zshrc

[ -d /cache ] && (
  cd /cache
  mkdir -p cryptomator    # ~/.local/share/Cryptomator
  mkdir -p google-chrome  # ~/.cache/google-chrome
  mkdir -p ipython        # ~/.ipython
  mkdir -p pip            # ~/.cache/pip
  mkdir -p thumbnails     # ~/.cache/thumbnails
)

[[ -o login && -o interactive ]] && {

  #
  # Plugins & Configurations
  #

  {
    DISABLE_MAGIC_FUNCTIONS=true
    DISABLE_UPDATE_PROMPT=true
    DISABLE_AUTO_UPDATE=true
    ZSH_THEME='gentoo'

    setopt AUTOCD             # type the name of a directory to switch
    setopt RCQUOTES           # elegant nested quotations
    setopt AUTO_CD            # auto directory switch
    setopt CDABLEVARS         # cd valid directory switch
    setopt globdots           # match dots *.*
    setopt ignoreeof          # need this (explicit 'exit' or 'logout')
    setopt MULTIOS            # pipe to multiple outputs
    setopt AUTO_NAME_DIRS     # use named dirs when possible
    setopt NO_BEEP            # no beep
    setopt NO_CASE_GLOB       # case insensitive globbing
    setopt NUMERIC_GLOB_SORT  # numeric sort the globs

    # oh-my-zsh
    x="${HOME}/.zsh.d/oh-my-zsh"
    [ -d "${x}" ] && {
      export ZSH="${x}"
      . "${x}/oh-my-zsh.sh"
    }

    # zsh-syntax-highliting
    x="${HOME}/.zsh.d/plugins/zsh-syntax-highlighting"
    [ -d "${x}" ] && {
      . "${x}/zsh-syntax-highlighting.plugin.zsh"
    }

    # zsh-completions
    x="${HOME}/.zsh.d/plugins/zsh-completions"
    [ -d "${x}" ] && {
      . "${x}/zsh-completions.plugin.zsh"
    }

    # zsh-autosuggestions
    x="${HOME}/.zsh.d/plugins/zsh-autosuggestions"
    [ -d "${x}" ] && {
      . "${x}/zsh-autosuggestions.plugin.zsh"
    }
  }

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

  # Wine
  # export WINEPREFIX='/tmp/wine'

  # Git
  export EDITOR="nano"
  export GIT_LFS_SKIP_SMUDGE=1
  export GIT_TERMINAL_PROMPT=1
  export GPG_TTY="$(tty)"

  # GPG
  export GPG_TTY=$(tty)

  # Golang
  export GOROOT="$HOME/.google/go"
  export GOPATH="${GOROOT}/pkg"
  export GOBIN="${GOROOT}/bin"
  export PATH="${PATH}:${GOROOT}:${GOPATH}:${GOBIN}"

  # Python
  export _VIRTUALENV="${HOME}/.lib/pyradox3"
  [ -d "$_VIRTUALENV" ] && . "${_VIRTUALENV}/bin/activate"

  # Zsh
  [ -f ~/.zsh_aliases ]   && . ~/.zsh_aliases
  [ -f ~/.zsh_functions ] && . ~/.zsh_functions
  [ -f /etc/zsh_command_not_found ] && . /etc/zsh_command_not_found
}

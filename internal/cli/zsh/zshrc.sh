[[ -o login && -o interactive ]] && {

  # Look-up commands in the database and suggest
  # installations available from the repository.
  [ -f /etc/zsh_command_not_found ] && {
    . /etc/zsh_command_not_found
  }

  #
  # Zsh configurations
  #

  {
    DISABLE_MAGIC_FUNCTIONS=true
    DISABLE_UPDATE_PROMPT=true
    DISABLE_AUTO_UPDATE=true
    # ZSH_THEME='evan'
    ZSH_THEME='fishy'

    setopt AUTOCD             # type the name of a directory to switch
    setopt NOCLOBBER          # prevent from accidentally overwriting an existing file (note: >!)
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
  }

  #
  # Zsh plugins
  #

  {
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

  #
  # Locale, encoding, colors
  #

  {
    # keep me here for zsh shell bug
    # export LANG=ko_KR.utf-8
    # export LANG="en_US.UTF-8"
    # export LANGUAGE="en_US.UTF-8"
    # export LC_ALL="en_US.UTF-8"
    # export LC_CTYPE="en_US.UTF-8"
    export LC_ALL="C.UTF-8"
    export LC_CTYPE="C.UTF-8"
    export LANGUAGE="C.UTF-8"
    export LANG="C.UTF-8"

    export TERM="xterm-256color"
    export LESS_TERMCAP_mb=$(printf '\e[01;31m')
    export LESS_TERMCAP_md=$(printf '\e[01;35m')
    export LESS_TERMCAP_me=$(printf '\e[0m')
    export LESS_TERMCAP_se=$(printf '\e[0m')
    export LESS_TERMCAP_so=$(printf '\e[01;33m')
    export LESS_TERMCAP_ue=$(printf '\e[0m')
    export LESS_TERMCAP_us=$(printf '\e[04;36m')
    export LS_COLORS="${LS_COLORS}:di=1;91:"
    export GREP_COLOR="97;45"
  }

  #
  # Programming toolkit
  #

  {
    export EDITOR="nano"

    # Golang
    export GOROOT="$HOME/.google/go"
    export GOPATH="${GOROOT}/pkg"
    export GOBIN="${GOROOT}/bin"
    export PATH="${PATH}:${GOROOT}:${GOPATH}:${GOBIN}"

    # Git
    export GIT_LFS_SKIP_SMUDGE=1

    # GCP
    # export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
    # export GCSFUSE_REPO="gcsfuse-$(lsb_release -c -s)"

    # GPG
    export GPG_TTY=$(tty)

    # Python
    export DEFAULT_VIRTUALENV="${HOME}/.lib/pyradox3"
    [ ! -d "$DEFAULT_VIRTUALENV" ] || {
      . "${DEFAULT_VIRTUALENV}/bin/activate"
    }

    # Vault by Hashivorp
    export VAULT_ADDR='http://127.0.0.1:8200'

    # Wine
    export WINEPREFIX='/tmp/wine'
  }
}

[ -f ~/.zsh_aliases ] && {
  . ~/.zsh_aliases
}

[ -f ~/.zsh_functions ] && {
  . ~/.zsh_functions
}

if [ -f "$HOME/.google-cloud-sdk/path.zsh.inc" ]; then source "$HOME/.google-cloud-sdk/path.zsh.inc"; fi
if [ -f "$HOME/.google-cloud-sdk/completion.zsh.inc" ]; then source "$HOME/.google-cloud-sdk/completion.zsh.inc"; fi
if [ -f "$HOME/.lib.d/gcloud/credentials.json" ]; then
    export GOOGLE_APPLICATION_CREDENTIALS="$HOME/.lib.d/gcloud/credentials.json"
fi

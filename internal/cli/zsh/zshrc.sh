[[ -o login && -o interactive ]] && {

  [ -f /etc/zsh_command_not_found ] && {
    . /etc/zsh_command_not_found;}

  {
    export TERM="xterm-256color"

    [ -n "$(command -v emacs)" ] && {
      export EDITOR="emacs"
    } || {
      export EDITOR="vi"
    }

    # keep me here for zsh shell bug
    # export LANG=ko_KR.utf-8
    # export LANG="en_US.UTF-8"
    # export LANGUAGE="en_US.UTF-8"
    # export LC_ALL="en_US.UTF-8"
    # export LC_CTYPE="en_US.UTF-8"
    export LC_ALL="C"
    export LC_CTYPE="C"
    export LANGUAGE="C"
    export LANG="C"

    export LESS_TERMCAP_mb=$(printf '\e[01;31m')
    export LESS_TERMCAP_md=$(printf '\e[01;35m')
    export LESS_TERMCAP_me=$(printf '\e[0m')
    export LESS_TERMCAP_se=$(printf '\e[0m')
    export LESS_TERMCAP_so=$(printf '\e[01;33m')
    export LESS_TERMCAP_ue=$(printf '\e[0m')
    export LESS_TERMCAP_us=$(printf '\e[04;36m')

    export GREP_COLOR="97;45"

    export LS_COLORS="${LS_COLORS}:di=1;91:"

    export WINEPREFIX='/tmp/wine'

    export GOROOT="$HOME/.google-golang/go"
    export GOPATH="${GOROOT}/pkg"
    export GOBIN="${GOROOT}/bin"
    export PATH="${PATH}:${GOROOT}:${GOPATH}:${GOBIN}"

    export GPG_TTY=$(tty)

    # Google Cloud
    export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
    export GCSFUSE_REPO=gcsfuse-$(lsb_release -c -s)

    # disable LFS clone
    export GIT_LFS_SKIP_SMUDGE=1

    # Hashivorp Vault
    export VAULT_ADDR=http://127.0.0.1:8200

    # default virtualenv
    export DEFAULT_VIRTUALENV=$HOME/.lib/pyradox3

    # redirect using Squid proxy
    # export http_proxy=http://127.0.0.1:8128

    # it's possible that XDG_RUNTIME_DIR is not declared at login.
    # So we need to explicitly declare it.
    # [ -n "$XDG_RUNTIME_DIR" ] || {
    #   export XDG_RUNTIME_DIR=/run/user/$(id -u)
    # }
  }

  DISABLE_UPDATE_PROMPT=true
  DISABLE_AUTO_UPDATE=true
  # ZSH_THEME="simple"
  ZSH_THEME="fishy"
  # ZSH_THEME="agnoster"
  plugins=(git)

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

  # oh-my-zsh
  x="${HOME}/.zsh.d/oh-my-zsh"
  [ -d "${x}" ] && {
    export ZSH="${x}"
    . "${x}/oh-my-zsh.sh"
  } || {
    echo -e "\e[35m[\e[31m#\e[35m] \e[97mPlugin: oh-my-zsh failed to load.\e[0m"
  }

  # zsh-syntax-highliting
  x="${HOME}/.zsh.d/plugins/zsh-syntax-highlighting"
  [ -d "${x}" ] && {
    . "${x}/zsh-syntax-highlighting.plugin.zsh"
  } || {
    echo -e "\e[35m[\e[31m#\e[35m] \e[97mPlugin: syntax highlighting failed to load.\e[0m"
  }

  # zsh-completions
  x="${HOME}/.zsh.d/plugins/zsh-completions"
  [ -d "${x}" ] && {
    . "${x}/zsh-completions.plugin.zsh"
  } || {
    echo "Failed to load completions"
  }

  # zsh-autosuggestions
  x="${HOME}/.zsh.d/plugins/zsh-autosuggestions"
  [ -d "${x}" ] && {
    . "${x}/zsh-autosuggestions.plugin.zsh"
  } || {
    echo "Failed to load suggestions"
  }

  [ ! -d "${DEFAULT_VIRTUALENV}" ] || {
    . "${DEFAULT_VIRTUALENV}/bin/activate"
  }

  [ -f ~/.zsh_aliases ] && { . ~/.zsh_aliases;}
  [ -f ~/.zsh_functions ] && { . ~/.zsh_functions;}
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/.google-cloud-sdk/path.zsh.inc" ]; then source "$HOME/.google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/.google-cloud-sdk/completion.zsh.inc" ]; then source "$HOME/.google-cloud-sdk/completion.zsh.inc"; fi

# Import Google Cloud storage credentials for development.
if [ -f "$HOME/.lib.d/gcloud/credentials.json" ]; then
    export GOOGLE_APPLICATION_CREDENTIALS="$HOME/.lib.d/gcloud/credentials.json"
fi

# export GIT_COMMITTER_DATE=$(date -R)
# export GIT_AUTHOR_DATE="${GIT_COMMITTER_DATE}"

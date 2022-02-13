# ~/.bash_aliases

# Imports
{
  # Linux
  [[ "${OSTYPE}" == "linux"* && -f "${HOME}/.bash_aliases.linux" ]] && {
    . "${HOME}/.bash_aliases.linux"
  }

  # Mac
  [[ "${OSTYPE}" == "darwin"* && -f "${HOME}/.bash_aliases.mac" ]] && {
    . "${HOME}/.bash_aliases.mac"
  }
}

# Aliases
{
  alias ...=".. && .."
  alias ..='cd ..'
  alias cb="cargo build"
  alias cbr="cargo build --release"
  alias chattr="chattr -V"
  alias di="docker image"
  alias dis="docker images"
  alias dl="docker logs"
  alias dp="docker ps"
  alias egrep='egrep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias gc="go build"
  alias gdb='gdb -q'
  alias gpg='gpg -q'
  alias gr="go run"
  alias grep='grep --color=auto'
  alias gtd='git diff'
  alias gtl="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
  alias gtp='git push origin --progress'
  alias gtpf='git push origin --progress --force'
  alias gtpu='git pull origin'
  alias gtr='git rebase -i'
  alias gts='git status --branch'
  alias htop="htop -u $USER"
  alias ktl="kubectl"
  alias l='ls -l'
  alias ll='ls -la'
  alias lsattr='lsattr -V'
  alias mp="mpv --vd-lavc-threads=0"
  alias mpa="mpv --vd-lavc-threads=0 --no-video"
  alias sa='ssh-add'
  alias sad='ssh-add -D'
  alias sal='ssh-add -l -c -t 3h'
  alias scp='scp -2 -C -v -p'
  alias sk='ssh-keygen -t rsa -b 4096 -a 2048 -E sha256 -v'
  alias skp='ssh-keygen -y -f'
  alias ssh='ssh -2 -C'
  alias sshfs="sshfs -o follow_symlinks"
}

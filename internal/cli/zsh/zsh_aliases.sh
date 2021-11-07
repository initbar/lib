# ~/.zsh_aliases

# Aliases
{
  {
    alias ..='cd ..'
    alias ...=".. && .."
  }

  alias di="docker image"
  alias dis="docker images"
  alias dl="docker logs"
  alias dp="docker ps"
  alias egrep='egrep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias grep='grep --color=auto'
  alias gtd='git diff'
  alias gtl="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
  alias gtp='git push origin --progress'
  alias gtpf='git push origin --progress --force'
  alias gtpu='git pull origin'
  alias gtr='git rebase -i'
  alias gts='git status --branch'
  alias l='ls -l'
  alias ll='ls -la'
  alias ssh='ssh -2 -C'
}

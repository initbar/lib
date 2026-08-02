# ~/.bash_aliases

{
  [ -n "$(which kubectl)" ] && {
    alias k='kubectl'
    alias kctx='kubectx'
    alias kns='kubens'
    source <(kubectl completion zsh)
  }
  alias ..='cd ..'
  alias bat='batcat --force-colorization --theme ansi'
  alias cal='ncal -M'
  alias chattr="chattr -V"
  alias cp='cp -v'
  alias df="df -hl | grep -v Filesystem | sort | egrep -i '[0-9]+%'"
  alias dis="docker images"
  alias disu='docker images --format "{{.Repository}}:{{.Tag}}" | grep -v "<none>" | xargs -L1 docker pull'
  alias dl="docker logs"
  alias dp="docker ps --format 'table {{.ID}}\t{{.Image}}\t{{.Command}}\t{{.Status}}'"
  alias du='du -xch'
  alias egrep='egrep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias fr="free -lh | egrep 'free|total|used' -A5"
  alias gdb='gdb -q'
  alias gpg='gpg -q'
  alias grep='grep --color=auto'
  alias gscp="gcloud alpha cloud-shell scp"
  alias gsh="gcloud alpha cloud-shell ssh --verbosity debug"
  alias gsshfs="gcloud alpha cloud-shell get-mount-command"
  alias gsutil='gsutil -m'
  alias gtd='git diff'
  alias gtl="git log --graph --abbrev-commit --decorate --all"
  alias gtp='git push origin --progress'
  alias gtpf='git push origin --progress --force'
  alias gtpu='git pull origin'
  alias gtr='git rebase -i'
  alias gts='git status --branch'
  alias l='ls -l'
  alias ll='ls -la'
  alias ls="ls -h --group-directories-first --classify --color=always"
  alias lsattr='lsattr -V'
  alias lsusb='lsusb -tv'
  alias mp='mpv'
  alias mpa='mpv --no-video'
  alias mv='mv -v'
  alias nano="nano --boldtext --mouse --smarthome --tabstospaces"
  alias ne='sudo netstat -ntupe | sort | grep ESTABLISHED'
  alias nec='sudo netstat -ntpe | sort | grep TIME_WAIT'
  alias nes='sudo netstat -ntpe | sort | grep CLOSED_WAIT'
  alias net='sudo netstat -ntpe | sort | grep ESTABLISHED'
  alias neu='sudo netstat -nupe | sort | grep ESTABLISHED'
  alias nl="sudo netstat -ntupl | sort | egrep '[0.]{7}'"
  alias nlt="sudo netstat -ntpl | sort | egrep '[0.]{7}'"
  alias nlu="sudo netstat -nupl | sort | egrep '[0.]{7}'"
  alias pip='python -m pip'
  alias pipi='python -m pip install --upgrade'
  alias pipu="python -m pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 python -m pip install -U"
  alias pw='acpi -V | grep Battery'
  alias pyc='python -OO -m py_compile'
  alias rc='rustc -C opt-level=3'
  alias rm='rm -v --preserve-root'
  alias sk='ssh-keygen -t ed25519 -a 1024'
  alias skp='ssh-keygen -y -f'
  alias ssh='ssh -C'
  alias sync="sync -f"
}

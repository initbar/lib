{
  function __docker() {
    docker run \
           --interactive \
           --rm \
           --tty \
           --user="${UID}:1000" \
           --volume="$(readlink -f ${PWD}):/sandbox" \
           --workdir=/sandbox \
           "$@"
  }

  function dsh() {
    __docker initbar/lib:latest "$@"
  }

  function 7z() {
    dsh 7z "$@"
  }

  function bat() {
    dsh batcat -p --theme base16 "$@"
  }

  unalias diff 2> /dev/null
  function diff() {
    dsh colordiff "$@"
  }

  function entropy() {
    dsh ent -b "$@"
  }

  function et() {
    dsh exiftool "$@"
  }

  function ffmpeg() {
    dsh ffmpeg "$@"
  }

  function lrzip() {
    dsh lrzip "$@"
  }

  function mat() {
    dsh mat2 --inplace "$@"
  }

  function mp3-dl() {
    dsh youtube-dl \
        --audio-format mp3 \
        --audio-quality 320k \
        --cache-dir /tmp \
        --extract-audio \
        --prefer-ffmpeg \
        --verbose \
        "$1"
  }

  function pdfmerge() {
    dsh gs \
        -dAutoRotatePages=/None \
        -dBATCH \
        -dNOPAUSE \
        -q \
        -sDEVICE=pdfwrite \
        -sOutputFile=_merged.pdf \
        "$@"
  }

  function rename() {
    dsh rename "$@"
  }

  function rchk() {
    md5sum \
      --binary \
      --tag \
      "$1"
  }

  function rsgn() {
    mv -v "$1" "$(md5sum $1 | awk '{print $1}').${1#*.}"
  }

  function strings() {
    dsh strings \
        --all \
        "$@"
  }

  function tcli() {
    __docker \
      --detach \
      --publish="127.0.0.1:${RANDOM}:46882/udp" \
      --publish="127.0.0.1:${RANDOM}:50052/udp" \
      --publish="127.0.0.1:${RANDOM}:51413/tcp" \
      --publish="127.0.0.1:${RANDOM}:51413/udp" \
      --publish="127.0.0.1:${RANDOM}:9091" \
      --volume="${HOME}/.torrents:/home/ubuntu/Downloads" \
      initbar/lib:latest \
      transmission-cli \
      --encryption-preferred \
      --no-downlimit \
      --uplimit 1 \
      --verify \
      "$1"
  }

  function valgrind() {
    dsh valgrind \
        --leak-check=full \
        --show-leak-kinds=all \
        "$@"
  }

  function wget() {
    dsh wget "$@"
  }

  function youtube-dl() {
    dsh youtube-dl \
        --cache-dir /tmp \
        --ignore-errors \
        --prefer-ffmpeg \
        --yes-playlist \
        "$1"
  }

  # Coding
  {
    alias d="cd ~/Downloads"

    {
      alias cb="cargo build"
      alias cbr="cargo build --release"
      alias rc='rustc -C opt-level=3'
    }

    {
      alias pipi='pip install --upgrade'
      alias pipu="pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U"
      alias pyc="python -OO -m py_compile"
    }

    {
      alias gtd='git diff'
      alias gtl="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
      alias gtp='git push origin --progress'
      alias gtpf='git push origin --progress --force'
      alias gtpu='git pull origin'
      alias gtr='git rebase -i'
      alias gts='git status --branch'
    }

    {
      alias gc='go build'
      alias gr='go run'
    }

    {
      [[ "${OSTYPE}" == "darwin"* ]] && {
        alias emacs="emacs -nw"
      }
      alias nano="nano --boldtext --mouse --smarthome --tabstospaces"
    }
  }

  # Docker
  {
    alias di="docker image"
    alias dis="docker images"
    alias dl="docker logs"
    alias dp="docker ps"
  }

  # Google Cloud Platform
  {
    alias gscp="gcloud alpha cloud-shell scp"
    alias gsh="gcloud alpha cloud-shell ssh --verbosity debug"
    alias gsshfs="gcloud alpha cloud-shell get-mount-command"
    alias gsutil='gsutil -m'
  }

  # Keybase
  {
    alias kbq="keybase fs quota"
    alias kbs="keybase fs uploads"
  }

  # Kubernetes
  {
    alias ktl="kubectl"
    alias kg="kubectl get -o wide"
  }

  # Media
  {
    alias mp="mpv -fs --vd-lavc-threads=0"
    alias mpa="mpv -fs --vd-lavc-threads=0 -shuffle --no-video"
  }

  # Security
  {
    alias aireplay-ng='aireplay-ng -Q -T4 -B'
    alias arp="arp -n | egrep -v 'incomplete|address' | sort -g"
    alias arping='arping -f -c 1 -w 5'
    alias cppcheck='cppcheck --enable=all'
    alias flawfinder='flawfinder -F -C --dataonly'
    alias gdb='gdb -q'
    alias gpg='gpg -q'
    alias hashcat='hashcat --status --status-timer 1'
    alias hd="hexyl -v --color=always"
    alias lsnse='ls /usr/share/nmap/scripts/'
    alias lssnort='ls /etc/snort/rules/'
    alias nmap='nmap -T3 -v -n'
    alias ping='ping -D -s0 -t 255 -A -U -v -W 10'
    alias pingflood='ping -i 0.2 -f -r -D -s0 -t 255'
    alias shd='shred -n 1 -u -z -f --random-source=/dev/urandom -v'
    alias sqlmap='sqlmap --random-agent --level=5 --risk=3 -a -b'
    alias srm='srm -d -r -v'
  }

  # Shell
  {
    alias ..='cd ..'
    alias ...=".. && .."

    {
      [[ "${OSTYPE}" == "darwin"* ]] && {
        alias ls="gls -h --group-directories-first --classify --color=always"
      } || {
        alias ls="ls -h --group-directories-first --classify --color=always"
      }
      alias l='ls -l'
      alias ll='ls -la'
    }

    {
      alias cp='cp -v'
      alias mv='mv -v'
      [[ "${OSTYPE}" == "darwin"* ]] && {
        alias rm="grm -v --preserve-root"
      } || {
        alias rm='rm -v --preserve-root'
      }
    }

    {
      alias grep='grep --color=auto'
      alias egrep='egrep --color=auto'
      alias fgrep='fgrep --color=auto'
    }

    {
      alias chattr="chattr -V"
      alias lsattr='lsattr -V'
    }
  }

  # SSH
  {
    alias scp='scp -2 -C -v -p'
    alias ssh='ssh -2 -C'
    alias sshfs="sshfs -o follow_symlinks"

    {
      alias skp='ssh-keygen -y -f'
      alias sk='ssh-keygen -t rsa -b 4096 -a 2048 -E sha256 -v'
    }

    {
      alias sa='ssh-add'
      alias sad='ssh-add -D'
      alias sal='ssh-add -l -c -t 3h'
    }
  }

  # System
  {
    alias ddf='sync && sync -f'
    alias ddt="cat /proc/vmstat | egrep 'dirty|write'"
    alias df="df -hl | grep -v Filesystem | sort | egrep -i '[0-9]+%'"
    alias du='du -xch'
    alias fr="free -lh | egrep 'total|used|free' -A5"
    alias htop="htop -u $USER"
    alias iotop='sudo iotop -o -a'
    alias lspci='lspci -tv'
    alias lsusb='lsusb -tv'
    alias pw="acpi -V | grep Battery"
    alias ser='sudo service --status-all | grep +'
    alias strace='strace -fttTCx -s 9999 -y'

    function aptu() {
      sudo apt update
      sudo apt upgrade
      sudo apt autoremove
    }
  }

  # Networking
  {
    alias host='host -t any -v -l'
    alias ipt="sudo iptables -L -v -n --line-numbers | egrep 'Chain [A-Za-z0-9-]+' -A100000"
    alias tracepath="tracepath -b -l 65535 -m 50"
    alias w='w -hus'

    {
      alias ne='sudo netstat -ntupe | sort | grep ESTABLISHED'
      alias nec='sudo netstat -ntpe | sort | grep TIME_WAIT'
      alias nes='sudo netstat -ntpe | sort | grep CLOSED_WAIT'
      alias net='sudo netstat -ntpe | sort | grep ESTABLISHED'
      alias neu='sudo netstat -nupe | sort | grep ESTABLISHED'
      alias nl="sudo netstat -ntupl | sort | egrep '[0.]{7}'"
      alias nlt="sudo netstat -ntpl | sort | egrep '[0.]{7}'"
      alias nlu="sudo netstat -nupl | sort | egrep '[0.]{7}'"
    }
  }

  # Veracrypt
  # {
  #   alias getm='veracrypt -t /dev/sdb1 -k ~/.lib.d/vera ~/Public'
  # }

  # VirtualBox
  {
    alias va="vboxmanage registervm"
    alias vi="vboxmanage list vms"
    alias vp="vboxmanage list runningvms"
    alias vr="vboxmanage startvm --type headless"
  }
}

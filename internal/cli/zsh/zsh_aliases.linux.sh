# ~/.zsh_aliases

# Docker
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
}

# Functions
{
  function 7z() {
    dsh 7z "$@"
  }

  function aptu() {
    sudo apt update
    sudo apt upgrade
    sudo apt autoremove
    sudo apt clean
  }

  function bat() {
    dsh batcat -p "$@"
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

  function gcc() {
    dsh go \
        build \
        "$@"
  }

  function gr() {
    dsh go \
        run \
        "$@"
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
    dsh md5sum \
        --binary \
        --tag \
        "$@"
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
}

# Aliases
{
  {
    [ -d ~/Downloads ] && {
      alias d="cd ~/Downloads"
    }

    [ -d ~/private ] && {
      alias k="cd ~/private"
    }

    [ -d ~/project ] && {
      alias j="cd ~/project"
    }

    [ -d ~/public ] && {
      alias h="cd ~/public"
    }
  }

  alias aireplay-ng='aireplay-ng -Q -T4 -B'
  alias arp="arp -n | egrep -v 'incomplete|address' | sort -g"
  alias arping='arping -f -c 1 -w 5'
  alias cb="cargo build"
  alias cbr="cargo build --release"
  alias chattr="chattr -V"
  alias cp='cp -v'
  alias cppcheck='cppcheck --enable=all'
  alias df="df -hl | grep -v Filesystem | sort | egrep -i '[0-9]+%'"
  alias dt="perl -pi -e 'chomp if eof'"
  alias du='du -xch'
  alias fr="free -lh | egrep 'total|used|free' -A5"
  alias gdb='gdb -q'
  alias gpg='gpg -q'
  alias gscp="gcloud alpha cloud-shell scp"
  alias gsh="gcloud alpha cloud-shell ssh --verbosity debug"
  alias gsshfs="gcloud alpha cloud-shell get-mount-command"
  alias gsutil='gsutil -m'
  alias hashcat='hashcat --status --status-timer 1'
  alias hd="hexyl -v --color=always"
  alias host='host -t any -v -l'
  alias ipt="sudo iptables -L -v -n --line-numbers | egrep 'Chain [A-Za-z0-9-]+' -A100000"
  alias kbh="keybase fs history"
  alias kbq="keybase fs quota"
  alias kbs="keybase fs uploads"
  alias ktl="kubectl"
  alias ls="ls -h --group-directories-first --classify --color=always"
  alias lsattr='lsattr -V'
  alias lsnse='ls /usr/share/nmap/scripts/'
  alias lspci='lspci -tv'
  alias lssnort='ls /etc/snort/rules/'
  alias lsusb='lsusb -tv'
  alias mp="mpv -fs --vd-lavc-threads=0"
  alias mpa="mpv -fs --vd-lavc-threads=0 --no-video"
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
  alias nmap='nmap -T3 -v -n'
  alias ping='ping -D -s0 -t 255 -A -U -v -W 10'
  alias pingflood='ping -i 0.2 -f -r -D -s0 -t 255'
  alias pipi='pip install --upgrade'
  alias pipu="pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U"
  alias pw="acpi -V | grep Battery"
  alias rm='rm -v --preserve-root'
  alias sa='ssh-add'
  alias sad='ssh-add -D'
  alias sal='ssh-add -l -c -t 3h'
  alias scp='scp -2 -C -v -p'
  alias shd='shred -n 1 -u -z -f --random-source=/dev/urandom -v'
  alias sk='ssh-keygen -t rsa -b 4096 -a 2048 -E sha256 -v'
  alias skp='ssh-keygen -y -f'
  alias sqlmap='sqlmap --random-agent --level=5 --risk=3 -a -b'
  alias sshfs="sshfs -o follow_symlinks"
  alias strace='strace -fttTCx -s 9999 -y'
  alias tracepath="tracepath -b -l 65535 -m 50"
  alias va="vboxmanage registervm"
  alias vi="vboxmanage list vms"
  alias vp="vboxmanage list runningvms"
  alias vr="vboxmanage startvm --type headless"
  alias w='w -hus'
  # alias pyc="python -OO -m py_compile"
  # alias rc='rustc -C opt-level=3'
}

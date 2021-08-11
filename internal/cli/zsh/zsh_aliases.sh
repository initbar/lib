{
  function __docker() {
    docker run \
           --interactive \
           --rm \
           --tty \
           --user="${UID}:1000" \
           --volume="${PWD}:/sandbox" \
           --workdir=/sandbox \
           "$@"
  }

  function dsh() {
    __docker initbar/lib:latest "$@"
  }

  function bat() {
    dsh batcat "$@"
  }

  function emacs() {
    dsh emacs "$@"
  }

  function et() {
    dsh exiftool "$@"
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
      --blocklist \
      --encryption-preferred \
      --no-downlimit \
      --uplimit 1 \
      --verify \
      "$1"
  }

  function youtube-dl() {
    dsh youtube-dl \
        --cache-dir /tmp \
        --ignore-errors \
        --prefer-ffmpeg \
        --yes-playlist \
        "$1"
  }

  # Compression/Encryption
  {
    alias ark-secure='7z a -t7z -m0=lzma2 -mx=9 -mfb=128 -md=64m -ms=on -mhe=on -p'
    alias ark='7z a -t7z -m0=lzma2 -mx=9 -mfb=128 -md=64m -ms=on -mhe=on'
    alias xz="xz --threads=$(cat /proc/cpuinfo|grep cores|wc -l)"
    alias gpg='gpg -q'
    alias gzip="gzip --rsyncable"
    alias lrzip="lrzip --threads=$(nproc)"
    alias shd='shred -n 1 -u -z -f --random-source=/dev/urandom -v'
    alias srm='srm -d -r -v'
  }

  # Debugging
  {
    alias strace='strace -fttTCx -s 9999 -y'
    alias valgrind='valgrind --leak-check=full --show-leak-kinds=all'
    alias entropy="ent -b"
  }

  # Docker
  {
    alias de="docker exec"
    alias di="docker image"
    alias dis="docker images"
    alias dl="docker logs"
    alias dp="docker ps -q"
  }

  # Documentation
  {
    alias pdfmerge="gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -dAutoRotatePages=/None -sOutputFile=_merged.pdf"
  }

  # Google Cloud Platform
  {
    alias gsutil='gsutil -m'
    alias gsh="gcloud alpha cloud-shell ssh --verbosity debug"
    alias gscp="gcloud alpha cloud-shell scp"
    alias gsshfs="gcloud alpha cloud-shell get-mount-command"
  }

  # Hashing
  {
    function rsgn() {
      local signature="$(md5sum "$1" | awk '{print $1}')"
      local extension="$(echo "$1" | egrep -o '[.][a-z0-9]{3,}' | tail -1)"
      mv -v "$1" "${signature:0:10}$extension"
    }

    function rchk() {
      local signature="$(md5sum "$1" | awk '{print $1}')"
      local extension="$(echo "$1" | egrep -o '[.][a-z0-9]{3,}' | tail -1)"
      local original="$(basename "$1")"
      signature="${signature:0:10}"
      original="${original:0:10}"
      [[ "$signature" == "$original" ]] && {
        echo "${original}"
      } || {
        echo "${original} <- BAD HASH"
      }
    }
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
    alias mpa="mpv -fs --vd-lavc-threads=0 --no-video"
  }

  # Programming
  {
    alias em="emacs"
    alias nano='nano -E -D -A -m -u'

    alias cpan='cpanm'
    alias cb="cargo build --jobs $(nproc)"
    alias cbr="cargo build --release --jobs $(nproc)"

    alias pyc="python -OO -m py_compile"
    alias pipi='pip install --upgrade'
    alias pipu="pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U"

    alias gtd='git diff'
    alias gtl="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
    alias gtp='git push origin --progress'
    alias gtpf='git push origin --progress --force'
    alias gtpu='git pull origin'
    alias gtr='git rebase -i'
    alias gts='git status --branch'

    alias gr='go run'
    alias gb='go build'
    alias gg='go get'

    alias rc='rustc -C opt-level=3'

    alias diff='colordiff'
    alias strings='strings -a'
  }

  # Security
  {
    alias hd="hexyl -v --color=always"
    alias lssnort='ls /etc/snort/rules/'
    alias aireplay-ng='aireplay-ng -Q -T4 -B'
    alias arp="arp -n | egrep -v 'incomplete|address' | sort -g"
    alias arping='arping -f -c 1 -w 5'
    alias cppcheck='cppcheck --enable=all'
    alias curl='curl -js -4 --compressed --globoff'
    alias dotdotpwn="cd ${HOME}/storj/stack/dotdotpwn && perl dotdotpwn.pl"
    alias flawfinder='flawfinder -F -C --dataonly'
    alias gdb='gdb -q'
    alias hashcat='hashcat --status --status-timer 1'
    alias lsnse='ls /usr/share/nmap/scripts/'
    alias nmap='nmap -T3 -v -n'
    alias ping='ping -D -s0 -t 255 -A -U -v -W 10'
    alias pingflood='ping -i 0.2 -f -r -D -s0 -t 255'
    alias shellcheck='shellcheck --color=always'
    alias speedtest='speedtest --secure'
    alias sqlmap='sqlmap --random-agent --level=5 --risk=3 -a -b'
  }

  # Shell
  {
    alias ls='ls -Q --classify --group-directories-first --color=auto'
    alias l='ls -lh'
    alias ll='ls -lah'

    alias ca="chattr -V"
    alias la='lsattr'

    alias ..='cd ..'
    alias ...=".. && .."
    alias cp='cp -v'
    alias cpr='rsync -ahHAXu --info=progress2'
    alias mv='mv -v'
    alias rm='rm -v --preserve-root'

    alias grep='grep --color=auto'
    alias egrep='egrep --color=auto'
    alias fgrep='fgrep --color=auto'
  }

  # SSH
  {
    alias sa='ssh-add'
    alias sb='ssh-keygen -B -f'
    alias sd='ssh-add -D'
    alias sk='ssh-keygen -t rsa -b 4096 -a 2048 -E sha256 -v'
    alias skn='ssh-keygen -t rsa -b 4096 -o -a 2048 -E sha256 -v'
    alias skp='ssh-keygen -y -f'
    alias sl='ssh-add -l -c -t 3h'
    alias ssh='ssh -2 -C'
    alias scp='scp -2 -C -v -p'
  }

  # System
  {
    alias ddf='sync && sync -f'
    alias ddt="cat /proc/vmstat | egrep 'dirty|write'"
    alias df="df -hl | grep -v Filesystem | sort | egrep -i '[0-9]+%'"
    alias du='du -xch'
    alias fr="free -lh | egrep 'total|used|free' -A5"
    alias htop="htop -u ${USER}"
    alias iotop='sudo iotop -o -a'
    alias lspci='lspci -tv'
    alias lsusb='lsusb -tv'
    alias pw="acpi -V | grep Battery"
    alias ser='sudo service --status-all | grep +'

    function aptu() {
      local payload="
    ZnVuY3Rpb24gaW5pdCgpIHsKICBsb2NhbCB1c2FnZT0iXGVbOTJtW1xlWzkxbSFcZVs5Mm1dXGVb
    OTdtICQwIDxmbGFnPiA8dGFyZ2V0PlxlWzBtIgogIGxvY2FsIHF1ZXVlPSgKICAgICJ1cGRhdGUi
    CiAgICAidXBncmFkZSIKICAgICJhdXRvcmVtb3ZlIgogICk7CgogIGZ1bmN0aW9uIHVzYWdlKCkK
    ICB7IGVjaG8gLWUgIiR1c2FnZSImJmV4aXQgMTt9CgogIGZ1bmN0aW9uIHN0YXRlX2NoZWNrKCkK
    ICB7IFsgIiQoL3Vzci9iaW4vaWQgLXUpIiAtbmUgMCBdfHxyZXR1cm4gJD87fQoKICBmdW5jdGlv
    biBzdGF0ZV9raWxsKCkKICB7IHN0YXRlX2NoZWNrOyBbICQ/IC1uZSAwIF0mJnVzYWdlO30KCiAg
    aWYgW1sgJChzdGF0ZV9raWxsOyBlY2hvICQ/KSAtZXEgMSBdXQogIHRoZW4KICAgICAgZm9yICgo
    IGk9MDsgaTwkeyNxdWV1ZVtAXX07IGkrKyApKQogICAgICBkbwogICAgICAgIHN1ZG8gYXB0ICR7
    cXVldWVbaV19CiAgICAgIGRvbmUKICBmaQp9O2luaXQ="
      bash -c "$(echo -n "$payload" | tr -d '\n' | tr -d ' ' | base64 -d)"
    }
  }

  # Networking
  {
    alias host='host -t any -v -l'
    alias ipt="sudo iptables -L -v -n --line-numbers | egrep 'Chain [A-Za-z0-9-]+' -A100000"
    alias mosh='mosh -n --family=prefer-inet'
    alias tracepath="tracepath -b -l 65535 -m 50"
    alias w='w -hus'
    alias ne='sudo netstat -ntupe | sort | grep ESTABLISHED'
    alias nec='sudo netstat -ntpe | sort | grep TIME_WAIT'
    alias nes='sudo netstat -ntpe | sort | grep CLOSED_WAIT'
    alias net='sudo netstat -ntpe | sort | grep ESTABLISHED'
    alias neu='sudo netstat -nupe | sort | grep ESTABLISHED'
    alias nl="sudo netstat -ntupl | sort | egrep '[0.]{7}'"
    alias nlt="sudo netstat -ntpl | sort | egrep '[0.]{7}'"
    alias nlu="sudo netstat -nupl | sort | egrep '[0.]{7}'"
  }

  # Veracrypt
  {
    alias getm='veracrypt -t /dev/sdb1 -k ~/.lib.d/vera ~/Public'
  }

  # VirtualBox
  {
    alias va="vboxmanage registervm"
    alias vi="vboxmanage list vms"
    alias vp="vboxmanage list runningvms"
    alias vr="vboxmanage startvm --type headless"
  }
}

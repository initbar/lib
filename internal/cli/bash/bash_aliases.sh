# ~/.bash_aliases

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

  function binwalk() {
    dsh binwalk
  }

  function cal() {
    dsh ncal
  }

  function ent() {
    dsh ent -b "$@"
  }

  function et() {
    dsh exiftool "$@"
  }

  function thumbnail() {
    local filepath="$(basename "$1")"  # $filename + $extension
    local filename="${filepath%.*}"
    local extension="${filepath##*.}"

    (
      # Generate thumbnail seed.
      local seed=$(openssl rand $RANDOM | md5sum | awk '{print $1}')

      # Get total video duration in seconds.
      local duration=$(ffprobe -i "$filepath" -show_entries format=duration -v quiet -of csv="p=0")

      # Generate 20 snapshots.
      ffmpeg -i "$filepath" -vf fps="20/${duration}" -vcodec png ${seed}-%002d.png &> /dev/null

      # Collage snapshots.
      montage -geometry +4+4 ${seed}-*.png "$filename.png" &> /dev/null

      rm ${seed}-*.png
    )
  }

  function lrzip() {
    dsh lrzip "$@"
  }

  function mat() {
    dsh mat2 --inplace "$@"
  }

  function mp3-dl() {
    dsh yt-dlp \
        --audio-format mp3 \
        --audio-quality 320k \
        --cache-dir /tmp \
        --extract-audio \
        --geo-bypass \
        --prefer-ffmpeg \
        --verbose \
        "$@"
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

  function rchk() {
    dsh md5sum \
        --binary \
        --tag \
        "$@"
  }

  function rsgn() {
    local signature="$(md5sum $1 | head -c 8)"
    local extension="$(echo $1 | tr . \\n | tail -n 1)"
    mv -v "$1" "${signature}.${extension}"
  }

  function strings() {
    dsh strings \
        --all \
        "$@"
  }

  function skaffold() {
    docker run \
           gcr.io/k8s-skaffold/skaffold:latest \
           skaffold \
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
      --blocklist \
      --encryption-preferred \
      --no-downlimit \
      --uplimit 1 \
      --verify \
      "$1"
  }

  function unzip() {
    dsh unzip "$@"
  }

  function valgrind() {
    dsh valgrind \
        --leak-check=full \
        --show-leak-kinds=all \
        "$@"
  }

  function whois() {
    dsh whois "$@"
  }

  function youtube-dl() {
    dsh yt-dlp \
        --cache-dir /tmp \
        --geo-bypass \
        --ignore-errors \
        --prefer-ffmpeg \
        --yes-playlist \
        "$@"
  }
}

{
  alias ..='cd ..'
  alias aireplay-ng='aireplay-ng -Q -T4 -B'
  alias arp="arp -n | egrep -v 'incomplete|address' | sort -g"
  alias arping='arping -f -c 1 -w 5'
  alias bat='batcat --force-colorization --theme "Monokai Extended Bright"'
  alias bup="b2 upload-file --threads=$(nproc)"
  alias bls='b2 ls --recursive'
  alias cal='ncal -M'
  alias cb="cargo build"
  alias cbr="cargo build --release"
  alias chattr="chattr -V"
  alias cp='cp -v'
  alias cppcheck='cppcheck --enable=all'
  alias cpuinfo="cat /proc/cpuinfo"
  alias df="df -hl | grep -v Filesystem | sort | egrep -i '[0-9]+%'"
  alias di="docker image"
  alias dis="docker images"
  alias dl="docker logs"
  alias dp="docker ps"
  alias dt="perl -pi -e 'chomp if eof'"
  alias du='du -xch'
  alias egrep='egrep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias fr="free -lh | egrep 'total|used|free' -A5"
  alias gc="go build"
  alias gdb='gdb -q'
  alias gip="curl https://ipinfo.io"
  alias gpg='gpg -q'
  alias gr="go run"
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
  alias hashcat='hashcat --status --status-timer 1'
  alias hexyl="hexyl -v --color=always"
  alias host='host -t any -v -l'
  alias htop="htop -u $USER"
  alias ipt="sudo iptables -L -v -n --line-numbers | egrep 'Chain [A-Za-z0-9-]+' -A100000"
  alias kbh="keybase fs history"
  alias kbq="keybase fs quota"
  alias kbs="keybase fs uploads"
  alias ktl="kubectl"
  alias l='ls -l'
  alias ll='ls -la'
  alias ls="ls -h --group-directories-first --classify --color=always"
  alias lsattr='lsattr -V'
  alias lsnse='ls /usr/share/nmap/scripts/'
  alias lspci='lspci -tv'
  alias lssnort='ls /etc/snort/rules/'
  alias lsusb='lsusb -tv'
  alias mp="mpv --vd-lavc-threads=0"
  alias mpa="mpv --vd-lavc-threads=0 --no-video"
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
  alias pip='python -m pip'
  alias pipi='python -m pip install --upgrade'
  alias pipu="python -m pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 python -m pip install -U"
  alias pvn="protonvpn-cli"
  alias pw="acpi -V | grep Battery"
  alias pyc="python -OO -m py_compile"
  alias rc='rustc -C opt-level=3'
  alias rm='rm -v --preserve-root'
  alias sa='ssh-add'
  alias sad='ssh-add -D'
  alias sal='ssh-add -l -c -t 3h'
  alias scp='scp -2 -C -v -p'
  alias shd='shred -n 1 -u -z -f --random-source=/dev/urandom -v'
  alias sk='ssh-keygen -t rsa -b 4096 -a 2048 -E sha256 -v'
  alias skp='ssh-keygen -y -f'
  alias sqlmap='sqlmap --random-agent --level=5 --risk=3 -a -b'
  alias ssh='ssh -2 -C'
  alias sshfs="sshfs -o follow_symlinks"
  alias strace='strace -fttTCx -s 9999 -y'
  alias sync="sync -f"
  alias tracepath="tracepath -b -l 65535 -m 50"
  alias va="vboxmanage registervm"
  alias vi="vboxmanage list vms"
  alias vp="vboxmanage list runningvms"
  alias vr="vboxmanage startvm --type headless"
  alias w='w -hus'
}

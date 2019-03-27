{
  [ -d "${HOME}/Downloads" ] && alias d="cd ${HOME}/Downloads"
  [ -d "${HOME}/private" ] && alias k="cd ${HOME}/private"
  [ -d "${HOME}/public" ] && alias j="cd ${HOME}/public"
  [ -d /sandbox ] && alias s='cd /sandbox'
  [ -d /cache ] && alias c='cd /cache'

  function cd() {
    [ -z "$1" ] && {
      builtin cd ~
    } || {
      builtin cd "$1"
    }

    # automatically detect and inherit virtualenv
    [ -z "$(which virtualenv)" ] || {
      deactivate || true
      if [ -d ./.venv ]; then
          . ./.venv/bin/activate
      else
        [ -d "${DEFAULT_VIRTUALENV}" ] && {
          . "${DEFAULT_VIRTUALENV}/bin/activate"
        }
      fi
    }
  }

  alias df="df -hl | grep -v Filesystem | sort | egrep -i '[0-9]+%'"
  alias du='du -xch'
  alias fr="free -lh | egrep 'total|used|free' -A5"
  alias gl='glances -t2 -1 -d'
  alias gpg='gpg -q'
  alias gsutil='gsutil -m'
  alias host='host -t any -v -l'
  alias htop="htop -u ${USER}"
  alias iotop='sudo iotop -o -a'
  alias ipt="sudo iptables -L -v -n --line-numbers | egrep 'Chain [A-Za-z0-9-]+' -A100000"
  alias lspci='lspci -tv'
  alias lsusb='lsusb -tv'
  alias ncdu='ncdu -r -x'
  alias mosh='mosh -n --family=prefer-inet'
  alias pw="acpi -V | grep Battery"
  alias ser='sudo service --status-all | grep +'
  alias sort="sort --parallel=$(nproc)"
  alias tracepath="tracepath -b -l 65535 -m 50"
  alias w='w -hus'

  {
    alias ca="chattr -V"
    alias la='lsattr'
    alias ls='ls -Q --classify --group-directories-first --color=auto'
    [ -n "$(which ls++)" ] && {
      alias l='ls++ --potsf'
      alias ll='ls++ --potsf -a'
    } || {
      alias l='ls -lh'
      alias ll='ls -lah'
    }
  }

  {
    alias ..='cd ..'
    alias cp='cp -v'
    alias cpr='rsync -ahHAXu --progress'
    alias mv='mv -v'
    alias rm='rm -v --preserve-root'
  }

  {
    alias egrep='egrep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias grep='grep --color=auto'
  }

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

  {
    alias ddf='sync -f'
    alias ddt="cat /proc/vmstat | egrep 'dirty|write'"
  }

  {
    alias shd='shred -n 1 -u -z -f --random-source=/dev/urandom -v'
    alias srm='srm -d -r -v'
  }

  {
    alias de="docker exec"
    alias di="docker images"
    alias dl="docker logs"
    alias dp="docker ps -s"
  }

  {
    alias getvm='veracrypt -t /dev/sdb1 -k ~/.lib.d/veracrypt/ ~/.virtual'
    alias setvm='veracrypt -d ~/.virtual'
  }
}

{
  alias lssnort='ls /etc/snort/rules/'
  alias aireplay-ng='aireplay-ng -Q -T4 -B'
  alias arp="arp -n | egrep -v 'incomplete|address' | sort -g"
  alias arping='arping -f -c 1 -w 5'
  alias cppcheck='cppcheck --enable=all'
  alias curl='curl -js -4 --compressed --globoff'
  alias curl2="http --json --pretty all"
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
  alias strace='strace -fttTCx -s 9999 -y'
  alias valgrind='valgrind --leak-check=full --show-leak-kinds=all'
  alias entropy="ent -b"

  function wpscan() {
    docker pull wpscanteam/wpscan
    docker run -it \
           --rm wpscanteam/wpscan \
           --random-agent \
           --threads 2 \
           --enumerate t \
           --enumerate p \
           --enumerate u \
           --wp-content-dir custom-content \
           --wp-plugins-dir wp-content/custom-plugins \
           "$@"
  }
}

{
  alias diff='colordiff'
  alias dt="perl -pi -e 'chomp if eof'"
  alias grip='grip --norefresh'
  alias jd='python -mjson.tool'
  alias md='pygmentize -g -O ansi,style=colorful,python=cool,bg=light'
  alias strings='strings -a'

  {
    alias gscp="gcloud alpha cloud-shell scp"
    alias gssh="gcloud alpha cloud-shell ssh --verbosity debug"
    alias gsshfs="gcloud alpha cloud-shell get-mount-command"

    alias sa='ssh-add'
    alias sb='ssh-keygen -B -f'
    alias scp='scp -2 -C -v -p'
    alias sd='ssh-add -D'
    alias sk='ssh-keygen -t rsa -b 4096 -a 2048 -E sha256 -v'
    alias ski='openssl rsa -text -noout <'
    alias skn='ssh-keygen -t rsa -b 4096 -o -a 2048 -E sha256 -v'
    alias skp='ssh-keygen -y -f'
    alias sl='ssh-add -l -c -t 3h'
    alias ssh='ssh -2 -C'
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
    alias cpan='cpanm'
  }

  {
    alias cb="cargo build --jobs $(nproc)"
    alias cbr="cargo build --release --jobs $(nproc)"
  }

  {
    alias em="$(which emacs)"
    alias nano='nano -E -D -A -m -u'
  }

  {
    alias pycc="python -OO -m py_compile"
    alias pipi='pip install'
    alias pipu="pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U"
  }

  {
    alias gemu='sudo gem install rubygems-update && sudo update_rubygems && sudo gem update --system'
  }

  {
    alias gr='go run'
    alias gb='go build'
    alias gg='go get'
  }

  {
    alias rustc='rustc -C opt-level=3'
  }

  {
    alias sass="sass -C"
    alias sassm="sass -C --style compressed"
    alias sassw="sass -C --style compressed --watch ."
  }

  {
    alias yui='yui-compressor'
  }

  {
    alias pyserver='python -m SimpleHTTPServer 8000'
    alias wserverl="bundle exec jekyll server --watch --port ${1:-8080}"
    alias wserverg='bundle exec jekyll server --watch --host 0.0.0.0 --port 8080'
  }
}

{
  {
    alias pdf='evince'
    alias pdftex='xelatex'
  }

  {
    alias disp='display'
    alias ditaa='ditaa -r -S'
    alias et='exiftool'
    alias jpegm='jpegoptim -s'
  }

  {
    alias mp='mplayer -cache 4096'
    alias vlc='vlc -vv'

    function youtube-dl() {
      docker run \
             -v $PWD:/root \
             --dns 8.8.8.8 \
             --rm \
             --hostname container \
             'docker.init.bar/initbar/lib:latest' \
             'youtube-dl' \
             "$1"
    }

    function mp3-dl() {
      docker run \
             -v ${PWD}:/downloads \
             --dns 8.8.8.8 \
             --rm -d \
             --hostname container \
             'docker.init.bar/initbar/lib:latest' \
             'youtube-dl' \
             '--audio-format mp3' \
             '--audio-quality 320k' \
             '--extract-audio' \
             '--prefer-ffmpeg' \
             "$1"
    }
  }
}

{
  alias cryfs="cryfs --cipher aes-256-gcm --blocksize 32768"
}

{
  alias ark-secure='7z a -t7z -m0=lzma2 -mx=9 -mfb=128 -md=64m -ms=on -mhe=on -p'
  alias ark='7z a -t7z -m0=lzma2 -mx=9 -mfb=128 -md=64m -ms=on -mhe=on'
  alias xz="xz --threads=$(cat /proc/cpuinfo|grep cores|wc -l)"
}

{
  function tcli() {
    docker run \
           -v $HOME/.torrents:/root/Downloads \
           -p $RANDOM:9091 \
           -p $RANDOM:51413/tcp \
           -p $RANDOM:51413/udp \
           --dns 1.1.1.1 \
           --rm -d \
           --hostname container \
           'docker.init.bar/initbar/lib:latest' \
           '/usr/bin/transmission-cli' \
           '-D' \
           '-b' \
           '-er' \
           '-m' \
           '-t 0x28' \
           '-u 1' \
           '-v' \
           "$1"
  }

  # function webtorrent-desktop() {
  #   # xhost local:root
  #   docker run \
  #          -e DISPLAY=$DISPLAY \
  #          -v /tmp/.X11-unix:/tmp/.X11-unix \
  #          --device /dev/snd \
  #          --privileged \
  #          --rm -it -d \
  #          'docker.init.bar/initbar/webtorrent-desktop'
  # }
}
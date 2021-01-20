{
  [ -d "${HOME}/Downloads" ] && alias d="cd ${HOME}/Downloads"
  [ -d "${HOME}/private" ] && alias k="cd ${HOME}/private"
  [ -d "${HOME}/public" ] && alias j="cd ${HOME}/public"
  [ -d /sandbox ] && alias s='cd /sandbox'
  [ -d /cache ] && alias c='cd /cache'

  alias tpd='xinput set-prop $(xinput list | grep -i touchpad | egrep -o "id=[0-9]+" | sed "s/id=//") "Device Enabled" 0'
  alias tpe='xinput set-prop $(xinput list | grep -i touchpad | egrep -o "id=[0-9]+" | sed "s/id=//") "Device Enabled" 1'

  alias df="df -hl | grep -v Filesystem | sort | egrep -i '[0-9]+%'"
  alias du='du -xch'
  alias fr="free -lh | egrep 'total|used|free' -A5"
  alias gl='glances -t2 -1 -d'
  alias gpg='gpg -q'
  alias gsutil='gsutil -m'
  alias hd="hexyl"
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
    [ -n "$(command -v ls++)" ] && {
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
    alias cpr='rsync -ahHAXu --info=progress2'
    alias mv='mv -v'
    alias rm='rm -v --preserve-root'
  }

  {
    alias grep='grep --color=auto'
    alias egrep='egrep --color=auto'
    alias fgrep='fgrep --color=auto'
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
    alias ddf='sync && sync -f'
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
    alias vl="vboxmanage list vms"
    alias vr="vboxmanage startvm --type headless"
    alias va="vboxmanage registervm"
    function vboxs() {
      # vboxmanage controlvm "${1}" acpipowerbutton
      vboxmanage controlvm "${1}" poweroff
    }
  }

  {
    alias getm='veracrypt -t /dev/sdb1 -k ~/.lib.d/vera ~/Public'
    alias setm='veracrypt -d ~/Public'
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
  alias mat="mat2 --inplace --verbose"
}

{
  alias diff='colordiff'
  alias dt="perl -pi -e 'chomp if eof'"
  alias grip='grip --norefresh'
  alias jd='python -m json.tool'
  alias md='pygmentize -g -O ansi,style=colorful,python=cool,bg=light'
  alias strings='strings -a'

  {
    alias gsh="gcloud alpha cloud-shell ssh --verbosity debug"
    alias gscp="gcloud alpha cloud-shell scp"
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
    alias pipi='pip install --upgrade'
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
    alias wserverl="bundle exec jekyll server --watch --port ${1:-8080}"
    alias wserverg='bundle exec jekyll server --watch --host 0.0.0.0 --port 8080'
  }

  {
    alias py.server="python -m http.server"
    alias nginx.server="docker run -it --rm -p 8000:80 -v ${PWD}:/usr/share/nginx/html nginx:latest"
  }
}

{
  {
    # alias pdf='evince'
    alias pdf="google-chrome-stable"
    alias pdftex='xelatex'
  }

  {
    alias disp='display'
    alias ditaa='ditaa -r -S'
    alias et='exiftool'
    alias jpegm='jpegoptim -s'
  }

  {
    alias mp="mplayer -quiet -lavdopts threads=$(nproc)"
  }
}

{
  alias ark-secure='7z a -t7z -m0=lzma2 -mx=9 -mfb=128 -md=64m -ms=on -mhe=on -p'
  alias ark='7z a -t7z -m0=lzma2 -mx=9 -mfb=128 -md=64m -ms=on -mhe=on'
  alias xz="xz --threads=$(cat /proc/cpuinfo|grep cores|wc -l)"
}

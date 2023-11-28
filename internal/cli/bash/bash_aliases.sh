# ~/.bash_aliases

{
  {
    alias ..='cd ..'
    alias ...='cd ../..'
  }

  {
    alias bat='batcat --force-colorization --theme ansi'
  }

  {
    alias cal='ncal -M'
    alias chattr="chattr -V"
    alias cp='cp -v'
  }

  {
    alias df="df -hl | grep -v Filesystem | sort | egrep -i '[0-9]+%'"
    alias dis="docker images"
    alias dl="docker logs"
    alias dp="docker ps"
    alias du='du -xch'
  }

  {
    alias egrep='egrep --color=auto'
  }

  {
    alias fgrep='fgrep --color=auto'
    alias fr="free -lh | egrep 'free|total|used' -A5"
  }

  {
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
  }

  {
    alias k='kubectl'
    alias kg='kubectl get'
    alias kl='kubectl logs'
  }

  {
    alias l='ls -l'
    alias ll='ls -la'
    alias ls="ls -h --group-directories-first --classify --color=always"
    alias lsattr='lsattr -V'
    alias lsusb='lsusb -tv'
  }

  {
    alias mp='mpv'
    alias mpa='mpv --no-video'
    alias mv='mv -v'
  }

  {
    alias nano="nano --boldtext --mouse --smarthome --tabstospaces"
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
    alias pip='python -m pip'
    alias pipi='python -m pip install --upgrade'
    alias pipu="python -m pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 python -m pip install -U"
    alias pw='acpi -V | grep Battery'
    alias py='ipython'
    alias pyc='python -OO -m py_compile'
  }

  {
    alias rc='rustc -C opt-level=3'
    alias rm='rm -v --preserve-root'
  }

  {
    alias sk='ssh-keygen -t rsa -b 4096 -a 2048 -E sha256 -v'
    alias skp='ssh-keygen -y -f'
    alias ssh='ssh -C'
    alias sync="sync -f"
  }

  # alias aireplay-ng='aireplay-ng -Q -T4 -B'
  # alias arp="arp -n | egrep -v 'incomplete|address' | sort -g"
  # alias arping='arping -f -c 1 -w 5'
  # alias bls='b2 ls --recursive'
  # alias bup="b2 upload-file --threads=$(nproc)"
  # alias cppcheck='cppcheck --enable=all'
  # alias cpuinfo="cat /proc/cpuinfo"
  # alias dt="perl -pi -e 'chomp if eof'"
  # alias firefox='firejail firefox'
  # alias hashcat='hashcat --status --status-timer 1'
  # alias hexyl="hexyl -v --color=always"
  # alias host='host -t any -v -l'
  # alias ipt="sudo iptables -L -v -n --line-numbers | egrep 'Chain [A-Za-z0-9-]+' -A100000"
  # alias kbh="keybase fs history"
  # alias kbq="keybase fs quota"
  # alias kbs="keybase fs uploads"
  # alias lsnse='ls /usr/share/nmap/scripts/'
  # alias lspci='lspci -tv'
  # alias lssnort='ls /etc/snort/rules/'
  # alias nmap='nmap -T3 -v -n'
  # alias ping='ping -D -s0 -t 255 -A -U -v -W 10'
  # alias pingflood='ping -i 0.2 -f -r -D -s0 -t 255'
  # alias shd='shred -n 1 -u -z -f --random-source=/dev/urandom -v'
  # alias sqlmap='sqlmap --random-agent --level=5 --risk=3 -a -b'
  # alias sshfs="sshfs -o follow_symlinks"
  # alias strace='strace -fttTCx -s 9999 -y'
  # alias tracepath="tracepath -b -l 65535 -m 50"
  # alias va="vboxmanage registervm"
  # alias vi="vboxmanage list vms"
  # alias vp="vboxmanage list runningvms"
  # alias vr="vboxmanage startvm --type headless"
}

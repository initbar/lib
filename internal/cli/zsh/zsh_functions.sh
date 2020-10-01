{
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

  {
    {
      function sgn() {
        local signature="$(cat "$1" | sha512sum)"
        echo ${signature:0:10} > "$(basename "$1").sha512"
      }

      function chk() {
        local f_name="$(basename "$1").sha512"
        [ -f "$f_name" ] && {
          local f_orig=$(sha512sum "$1" | cut -d" " -f1)
          local f_hash="$(cat "$f_name" | head -1 | awk '{print $0}')"
          local f_Hash=${f_orig:0:10}
          [[ $f_hash == $f_Hash ]] && {
            echo -e "\e[35m[\e[31m#\e[35m] \e[97mHash matched.\e[0m"
          } || {
            echo -e "\e[35m[\e[31m!\e[35m] \e[97mHash mismatched.\e[0m"
          }
        } || {
          echo -e '\e[35m[\e[31m#\e[35m] \e[97mHash src not found.\e[0m'
        }
      }

      function xsgn() {
        echo $(cat "$1" | openssl dgst -sha256 -binary | openssl enc -base64 -A)
      }

      function rsgn() {
        local signature="$(md5sum "$1" | awk '{print $1}')"
        local extension="$(echo "$1" | egrep -o '[.][a-z0-9]{3,}' | tail -1)"
        mv "$1" "${signature:0:10}$extension"
      }

      function rchk() {
        local signature="$(md5sum "$1" | awk '{print $1}')"
        local extension="$(echo "$1" | egrep -o '[.][a-z0-9]{3,}' | tail -1)"
        local original=$(basename "$1")
        signature=${signature:0:10}
        original=${original:0:10}
        [[ $signature == $original ]] && {
          echo -e "\e[35m[\e[31m#\e[35m] \e[97mHash matched!\e[0m"
        } || {
          echo -e "\e[35m[\e[31m!\e[35m] \e[97mHash mismatched -> $original.\e[0m"
        }
      }
    }
  }
}

{
  {
    function dsh() {
      docker run -it \
             --rm \
             -v $PWD:/host \
             --dns 45.90.28.198 \
             --dns 45.90.30.198 \
             --hostname dsh \
             initbar/lib:latest
    }
  }

  function youtube-dl() {
    docker run \
           -v $PWD:/home/ubuntu \
           --dns 45.90.28.198 \
           --dns 45.90.30.198 \
           --rm \
           --user=$UID:1000 \
           --hostname container \
           'initbar/lib:latest' \
           'youtube-dl' \
           -i \
           --yes-playlist \
           --cache-dir /tmp \
           --prefer-ffmpeg \
           "$1"
  }

  function mp3-dl() {
    docker run \
           -v ${PWD}:/home/ubuntu \
           --dns 45.90.28.198 \
           --dns 45.90.30.198 \
           --rm \
           --user=$UID:1000 \
           --hostname container \
           'initbar/lib:latest' \
           'youtube-dl' \
           --verbose \
           --cache-dir /tmp \
           --audio-format mp3 \
           --audio-quality 320k \
           --extract-audio \
           --prefer-ffmpeg \
           "$1"
  }

  function tcli() {
    docker run \
           -v $HOME/.torrents:/home/ubuntu/Downloads \
           -p $RANDOM:9091 \
           -p $RANDOM:51413/tcp \
           -p $RANDOM:51413/udp \
           --dns 45.90.28.198 \
           --dns 45.90.30.198 \
           --rm -d \
           --user=$UID:1000 \
           --hostname container \
           'initbar/lib:latest' \
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

  function pdf() {
    [ -n "$(which evince)" ] && {
      alias pdf="evince"
      [ -n "$(which google-chrome-stable)" ] && {
        alias pdf="google-chrome-stable"
      }
    }
  }
}

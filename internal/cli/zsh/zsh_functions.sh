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
      # function xsgn() {
      #   echo $(cat "$1" | openssl dgst -sha256 -binary | openssl enc -base64 -A)
      # }

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
  }
}

{
  {
    function dsh() {
      docker run -it \
             --rm \
             --dns 1.1.1.1 \
             --dns 1.0.0.1 \
             --hostname dsh \
             initbar/lib:latest
    }
  }

  {
    function kli() {
      docker run -it \
             --rm \
             --dns 1.1.1.1 \
             --dns 1.0.0.1 \
             --hostname kli \
             initbar/kli:latest
    }
  }

  function youtube-dl() {
    docker run \
           -v $PWD:/home/ubuntu \
           --dns 1.1.1.1 \
           --dns 1.0.0.1 \
           --rm \
           --user=$UID:1000 \
           --hostname $(echo $RANDOM | md5sum | awk '{print $1}') \
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
           --dns 1.1.1.1 \
           --dns 1.0.0.1 \
           --rm \
           --user=$UID:1000 \
           --hostname $(echo $RANDOM | md5sum | awk '{print $1}') \
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
           --dns 1.1.1.1 \
           --dns 1.0.0.1 \
           --rm -d \
           --user=$UID:1000 \
           --hostname $(echo $RANDOM | md5sum | awk '{print $1}') \
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

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

  # function xsgn() {
  #   echo $(cat "$1" | openssl dgst -sha256 -binary | openssl enc -base64 -A)
  # }
}

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
    __docker \
      initbar/lib:latest \
      "$@"
  }

  function emacs() {
    dsh \
      emacs \
      "$@"
  }

  function et() {
    dsh \
      exiftool \
      "$@"
  }

  function mat() {
    dsh \
      mat2 \
      --inplace \
      "$@"
  }

  function mp3-dl() {
    dsh \
      youtube-dl \
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
    dsh \
      youtube-dl \
      --cache-dir /tmp \
      --ignore-errors \
      --prefer-ffmpeg \
      --yes-playlist \
      "$1"
  }
}

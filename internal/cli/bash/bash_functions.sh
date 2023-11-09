# ~/.bash_functions

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
    dsh \
      7z "$@"
  }

  function aptu() {
    sudo apt update
    sudo apt upgrade
    sudo apt autoremove
    sudo apt clean
  }

  function binwalk() {
    dsh \
      binwalk
  }

  function cal() {
    dsh \
      ncal
  }

  function ent() {
    dsh \
      ent \
        -b \
        "$@"
  }

  function et() {
    dsh \
      exiftool "$@"
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
    dsh \
      lrzip "$@"
  }

  function mat() {
    dsh \
      mat2 \
        --inplace \
        "$@"
  }

  function mp3-dl() {
    dsh \
      yt-dlp \
        --audio-format mp3 \
        --audio-quality 320k \
        --extract-audio \
        --no-cache-dir \
        --no-sponsorblock \
        --prefer-ffmpeg \
        --verbose \
        "$@"
  }

  function pdfmerge() {
    dsh \
      gs \
        -dAutoRotatePages=/None \
        -dBATCH \
        -dNOPAUSE \
        -q \
        -sDEVICE=pdfwrite \
        -sOutputFile=_merged.pdf \
        "$@"
  }

  function rchk() {
    dsh \
      md5sum \
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
    dsh \
      strings \
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
    dsh \
      unzip "$@"
  }

  function valgrind() {
    dsh \
      valgrind \
        --leak-check=full \
        --show-leak-kinds=all \
        "$@"
  }

  function whois() {
    dsh \
      whois "$@"
  }

  function youtube-dl() {
    dsh \
      yt-dlp \
        --ignore-errors \
        --no-cache-dir \
        --no-sponsorblock \
        --prefer-ffmpeg \
        --yes-playlist \
        "$@"
  }
}

# ~/.bash_functions

{
  function aptu() {
    sudo apt update
    sudo apt upgrade
    sudo apt autoremove
    sudo apt clean
  }

  function thumbnail() {
    local filepath="$(basename "$1")"  # $filename + $extension
    local filename="${filepath%.*}"
    local extension="${filepath##*.}"

    {
      # Generate thumbnail seed.
      local seed=$(openssl rand $RANDOM | md5sum | awk '{print $1}')

      # Get total video duration in seconds.
      local duration=$(ffprobe -i "$filepath" -show_entries format=duration -v quiet -of csv="p=0")

      # Generate 20 snapshots.
      ffmpeg -i "$filepath" -vf fps="20/${duration}" -vcodec png ${seed}-%002d.png &> /dev/null

      # Collage snapshots.
      montage -geometry +4+4 ${seed}-*.png "$filename.png" &> /dev/null

      # Compress collage.
      mogrify -quality '60%' "$filename.png"
    } && rm ${seed}-*.png
  }
}

{
  function __vpn_check() {
    [ -n "$(docker network ls | grep wireguard)" ] || {
      docker network create wireguard
    }

    [ -n "$(docker ps | grep vpn)" ] || {
      # __vpn_openvpn
      __vpn_wireguard
    }
  }

  function __vpn_wireguard() {
    docker run \
      --cap-add=NET_ADMIN \
      --cap-add=SYS_MODULE \
      --detach \
      --device /dev/net/tun \
      --env PGID="$(id -g)" \
      --env PUID="$(id -u)" \
      --name vpn \
      --publish="127.0.0.1:${RANDOM}:46882/udp" \
      --publish="127.0.0.1:${RANDOM}:50052/udp" \
      --publish="127.0.0.1:${RANDOM}:51413/tcp" \
      --publish="127.0.0.1:${RANDOM}:51413/udp" \
      --publish="127.0.0.1:${RANDOM}:9091" \
      --rm \
      --sysctl net.ipv4.conf.all.src_valid_mark=1 \
      --volume "$HOME/.vpn:/config" \
      linuxserver/wireguard
  }

  function __docker() {
    __vpn_check && {
      docker run \
        --interactive \
        --network "container:vpn" \
        --rm \
        --tty \
        --user "$(id -u):$(id -u)" \
        --volume "$(readlink -f ${PWD}):/sandbox" \
        --workdir /sandbox \
        "$@"
    }
  }

  function dsh() {
    __docker initbar/lib:latest "$@"
  }

  function 7z() {
    dsh \
      7z "$@"
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

  function strings() {
    dsh \
      strings \
        --all \
        "$@"
  }

  function tcli() {
    __docker \
      --detach \
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

  function tclis() {
    docker ps |\
      egrep -v 'vpn|CONTAINER' |\
      awk '{print $1}' |\
      sort |\
      xargs -I{} sh -c 'PROGRESS=$(docker logs --tail 1 {} | egrep -o "(Progress: [0-9.]+%)|Seeding" | sort -u | tail -1 | sed "s/^/\[/; s/$/\]/"); echo "> Container: {} ${PROGRESS}"'
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
        --add-header "Origin: https://www.google.com" \
        --add-header "Referer: https://www.google.com" \
        --user-agent "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.4 Safari/605.1.15" \
        --ignore-errors \
        --no-cache-dir \
        --no-sponsorblock \
        --yes-playlist \
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
        --verbose \
        "$@"
  }
}

# youtube-dl

Docker-packaged [youtube-dl](https://github.com/rg3/youtube-dl) w/ ffmpeg.

## Dependencies

- [Docker](https://docs.docker.com)

## Usage

```bash
~$ # sudo docker pull initbar/docker-youtube-dl:latest
~$ sudo docker run \
        -v $PWD:/downloads \
        --rm -d \
        initbar/docker-youtube-dl
```

## License

**youtube-dl** is under [MIT License](./LICENSE.md).

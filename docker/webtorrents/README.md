# webtorrents-desktop

Docker-packaged webtorrents-desktop.

## Dependencies

- [Docker](https://docs.docker.com)

## Usage

```bash
~$ # sudo docker pull initbar/docker-webtorrents-desktop:latest
~$ sudo docker run \
        -e DISPLAY=$DISPLAY \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        --rm -it \
        initbar/docker-webtorrents-desktop
```

## License

**webtorrents-desktop** is under [MIT License](./LICENSE.md).

# transmission-cli

Docker-packaged [transmission-cli](https://github.com/transmission/transmission) w/ blocklists.

## Dependencies

- [Docker](https://docs.docker.com)

## Usage

```bash
~$ # sudo docker pull initbar/docker-transmission-cli:latest
~$ docker run \
          -v ${PWD}:/root/Downloads \
          -p $RANDOM:9091 \
          -p $RANDOM:51413/tcp \
          -p $RANDOM:51413/udp \
          --dns 80.80.80.80 \
          --dns 8.8.8.8 \
          --rm \
          initbar/docker-transmission-cli \
          <magnet_link>
```

## License

**transmission-cli** is under [MIT License](./LICENSE.md).

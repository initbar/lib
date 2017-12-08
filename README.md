# lib

## Installation

```bash
~$ # gcloud source repos clone lib --project=initbar-master
~$ git clone https://source.developers.google.com/p/initbar-master/r/lib ~/.lib
```

## Docker

```
~$ docker run \
          --rm -it \
          --security-opt seccomp:unconfined \
          --user root \
          -v $PWD:/sandbox \
          "lib:latest"
```

## License

**lib** is under [MIT License](./LICENSE.md).

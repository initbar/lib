# dotfiles

## Installation

```bash
~$ curl https://raw.githubusercontent.com/initbar/dotfiles/master/scripts/install.sh | bash
```

## Installation (Manual)

```bash
~$ git clone https://github.com/initbar/dotfiles.git ~/.lib
~$ cd ~/.lib && git submodule update --init --recursive
```

## Docker

```bash
~$ # docker pull initbar/lib:latest
~$ docker run -it --rm initbar/lib:latest /bin/bash
```

## License

**dotfiles** is under [MIT License](./LICENSE).

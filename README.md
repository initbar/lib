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

## Docker (Nightly)

```bash
~$ docker image rm initbar/lib:latest; docker pull initbar/lib:latest
```

## Docker (Manual)

```bash
~$ docker build https://github.com/initbar/dotfiles.git#master
```

## License

**dotfiles** is under [MIT License](./LICENSE).

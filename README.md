[![Build and Containerize Dotfiles](https://github.com/initbar/dotfiles/actions/workflows/docker-build-deploy.yml/badge.svg?branch=main)](https://github.com/initbar/dotfiles/actions/workflows/docker-build-deploy.yml)

<p align="center">
  <img src="https://media.githubusercontent.com/media/initbar/initbar/main/github/dotfiles.png">
</p>

## Dependencies

```bash
sudo apt install curl git
```

## Installation

```bash
curl https://raw.githubusercontent.com/initbar/dotfiles/main/scripts/linux-cli.sh | bash
curl https://raw.githubusercontent.com/initbar/dotfiles/main/scripts/linux-gui.sh | bash
```

## Docker

```
docker pull initbar/lib:latest
```

## License

**dotfiles** is under [MIT License](./LICENSE).

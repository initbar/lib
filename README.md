[![Build and Containerize Dotfiles](https://github.com/initbar/dotfiles/actions/workflows/docker-build-deploy.yml/badge.svg?branch=main)](https://github.com/initbar/dotfiles/actions/workflows/docker-build-deploy.yml)

# dotfiles

## Dependencies

```bash
docker pull initbar/lib:latest
```

## Scripts

```bash
curl https://raw.githubusercontent.com/initbar/dotfiles/main/scripts/linux-cli.sh | bash
curl https://raw.githubusercontent.com/initbar/dotfiles/main/scripts/linux-gui.sh | bash
```

## Packages

#### dnscrypt-proxy

```bash
curl https://raw.githubusercontent.com/initbar/dotfiles/main/scripts/packages/dnscrypt-proxy.sh | bash
```

#### Docker

```bash
curl https://raw.githubusercontent.com/initbar/dotfiles/main/scripts/packages/docker.sh | bash
```

#### Git LFS

```bash
curl https://raw.githubusercontent.com/initbar/dotfiles/main/scripts/packages/git-lfs.sh | bash
```

#### Go

```bash
curl https://raw.githubusercontent.com/initbar/dotfiles/main/scripts/packages/go.sh | bash
```

#### Gocryptfs

```
curl https://raw.githubusercontent.com/initbar/dotfiles/main/scripts/packages/gocryptfs.sh | bash
```

#### Gocryptfs

```
curl https://raw.githubusercontent.com/initbar/dotfiles/main/scripts/packages/gocryptfs.sh | bash
```

#### Skaffold

Please see [Dockerized alias](./internal/cli/bash/bash_aliases.sh).

## License

**dotfiles** is under [MIT License](./LICENSE).

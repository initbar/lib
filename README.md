[![Build and Containerize Lib](https://github.com/initbar/lib/actions/workflows/docker-build-deploy.yml/badge.svg?branch=main)](https://github.com/initbar/lib/actions/workflows/docker-build-deploy.yml)

# lib

## Docker

```bash
docker pull initbar/lib:latest
```

## Hosts

### [Xubuntu 23.10](https://xubuntu.org)

```bash
{
  scripts=(
    https://raw.githubusercontent.com/initbar/lib/main/scripts/dnscrypt-proxy.sh
    https://raw.githubusercontent.com/initbar/lib/main/scripts/docker.sh
    https://raw.githubusercontent.com/initbar/lib/main/scripts/git-lfs.sh
    https://raw.githubusercontent.com/initbar/lib/main/scripts/go.sh
    https://raw.githubusercontent.com/initbar/lib/main/scripts/laptop/patch-system76.sh
    https://raw.githubusercontent.com/initbar/lib/main/scripts/laptop/linux-cli.sh
    https://raw.githubusercontent.com/initbar/lib/main/scripts/laptop/linux-gui.sh
    https://raw.githubusercontent.com/initbar/lib/main/scripts/laptop/linux-etc.sh
  ); for script in ${scripts[@]}; do curl ${script} | bash; done
}
```

### [Windows 11 WSL](https://learn.microsoft.com/en-us/windows/wsl/install)

```bash
{
  scripts=(
    https://raw.githubusercontent.com/initbar/lib/main/scripts/dnscrypt-proxy.sh
    https://raw.githubusercontent.com/initbar/lib/main/scripts/git-lfs.sh
    https://raw.githubusercontent.com/initbar/lib/main/scripts/go.sh
    https://raw.githubusercontent.com/initbar/lib/main/scripts/laptop/linux-cli.sh
    https://raw.githubusercontent.com/initbar/lib/main/scripts/laptop/linux-etc.sh
  ); for script in ${scripts[@]}; do curl ${script} | bash; done
}
```

## License

**lib** is under [MIT License](./LICENSE).

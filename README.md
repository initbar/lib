[![Containerize and Upload to Docker Hub](https://github.com/initbar/lib/actions/workflows/docker-build-deploy.yml/badge.svg?branch=main)](https://github.com/initbar/lib/actions/workflows/docker-build-deploy.yml)

# lib

```bash
{
  scripts=(
    https://raw.githubusercontent.com/initbar/lib/main/scripts/pre.sh
    https://raw.githubusercontent.com/initbar/lib/main/scripts/packages.sh
    https://raw.githubusercontent.com/initbar/lib/main/scripts/linux-cli.sh
    https://raw.githubusercontent.com/initbar/lib/main/scripts/linux-gui.sh
    https://raw.githubusercontent.com/initbar/lib/main/scripts/linux-etc.sh
    https://raw.githubusercontent.com/initbar/lib/main/scripts/post.sh
  ); for script in ${scripts[@]}; do curl "${script}" | bash; done
}
```

## License

**lib** is under [MIT License](./LICENSE).

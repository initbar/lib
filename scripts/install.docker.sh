# install.docker.sh

(
  # golang
  {
    rm -vrf ~/.google/ && mkdir -p ~/.google/
    curl -L --output - https://golang.org/dl/go1.17.linux-amd64.tar.gz  | tar -xz -C ~/.google
  }
)

{
  cd ~/.lib/ && {

    #
    # internal
    #
    (
      cd internal/ && {

        (
          cd cli/ && {

            # bash
            {
              test -L ~/.bashrc && unlink ~/.bashrc
              ln -vsf ~/.lib/internal/cli/zsh/zshrc.sh ~/.bashrc
            }
          }
        )
      }
    )
  }
}

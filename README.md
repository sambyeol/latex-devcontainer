# Devcontainer with TeX Live
Pre-installed TeX Live for [Devcontainer](https://code.visualstudio.com/docs/remote/containers).
You can create your own LaTeX document with one of the provided images.
Images can be found at [Docker Hub](https://hub.docker.com/repository/docker/sambyeol/latex-devcontainer).

## Quickstart
Make a devcontainer setting file at `.devcontainer/devcontainer.json`.
```json
{
    "image": "sambyeol/latex-devcontainer:alpine-nonroot",
    "runArgs": [ "--init" ],
    "settings": {
        "[latex][bibtex]": {
            "editor.formatOnSave": true,
            "editor.wordWrap": "on"
        }
    },
    "extensions": [
        "james-yu.latex-workshop"
    ],
}
```
Then, reopen in container.

## Cross-compile Images
All images are cross-compiled with [Docker Buildx](https://docs.docker.com/buildx/working-with-buildx/).

### Requirements
Some system libraries are needed.
```bash
$ sudo apt-get update
$ sudo apt-get install -y binfmt-support qemu qemu-user-static
```

You need `buildx` to cross-compile images.
If you see the following output, see [here](https://docs.docker.com/buildx/working-with-buildx/) to install `buildx`.
```bash
$ docker buildx version
docker: 'buildx' is not a docker command.
See 'docker --help'
```

### Compile
You can build images for `linux/amd64` and `linux/arm64` with following command.
```bash
$ docker buildx bake --push
```
Note that `--push` option will push to [Docker Hub](https://hub.docker.com/repository/docker/sambyeol/latex-devcontainer) right after building images.

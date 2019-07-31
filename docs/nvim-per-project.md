# Per-project vim config
I'm using direnv to configure per-project nvim config. This is based on
https://github.com/direnv/direnv/wiki/Vim
but tweaked for Neovim.

This adds an extra function named `add_extra_vimrc` to direnv, which you then
invoke in a project directory by placing it in `.envrc`. There's template one
you can install here:

```shell
cp ~/.sys-config/templates/envrc .envrc
```

Once this is added to a directory, it'll search for a `.nvimrc`

## Configuring vim-test with docker
To use vim-test with a docker container, you'll need to override vim-tests
commands to interact with docker. Grab the template thusly:

```shell
cp ~/.sys-config/templates/vimtest-docker-transform .nvimrc
```

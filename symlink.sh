#!/usr/bin/env fish

ln -s ~/.sys-config/gitignore ~/.gitignore
git config --global core.excludesfile ~/.gitignore

ln -s ~/.sys-config/tmux.conf ~/.tmux.conf

rm -rf ~/.config
ln -fs ~/src/sys-config/config/  ~/.config

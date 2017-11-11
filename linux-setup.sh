#!/usr/bin/env bash

./symlink

# Fish
sudo apt-add-repository ppa:fish-shell/release-2
sudo apt-get update
sudo apt-get install fish
chsh -s /usr/bin/fish

# Docker
sudo apt-get update
sudo apt-get install docker-ce
curl -O https://download.docker.com/linux/ubuntu/dists/zesty/pool/stable/amd64/docker-ce_17.09.0~ce-0~ubuntu_amd64.deb
sudo dpkg -i docker-ce_17.09.0~ce-0_ubuntu_amd64.deb

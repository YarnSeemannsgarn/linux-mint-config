#!/bin/bash

# Generate private/public key pair
ssh-keygen -t rsa -C $EMAIL
eval `ssh-agent -s`
ssh-add ~/.ssh/id_rsa

# Add public key to GitHub
curl -u "${EMAIL}" --data "{\"title\":\"$(whoami)@$(hostname)\",\"key\":\"$(cat ${HOME}/.ssh/id_rsa.pub)\"}" https://api.github.com/user/keys
ssh -o "StrictHostKeyChecking no" -T git@github.com

# Install git
sudo apt-get -y install git

# Download this repository into the correct location
cd
git init
git remote add origin git@github.com:YarnSeemannsgarn/linux-mint-config.git
# Instead of pull use fetch and reset to overwrite local files
git fetch --all
git reset --hard origin/master

git submodule update --init --recursive

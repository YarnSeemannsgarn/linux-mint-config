#!/bin/bash

# Generate private/public key pair
ssh-keygen -t rsa -C $EMAIL
eval `ssh-agent -s`
ssh-add ~/.ssh/id_rsa

# Add public key to GitHub and Bitbucket
KEY_LABEL=$(whoami)@$(hostname)
SSH_KEY=$(cat $HOME/.ssh/id_rsa.pub)
curl -u "${EMAIL}" --data "{\"title\":\"$KEY_LABEL\",\"key\":\"$SSH_KEY\"}" https://api.github.com/user/keys
curl --user JanSchlenkerSTI -X POST https://bitbucket.org/api/1.0/users/JanSchlenkerSTI/ssh-keys --data-urlencode "key=$SSH_KEY" --data-urlencode "label=$KEY_LABEL"

# Download this repository into the correct location
cd
git init
git remote add origin git@github.com:YarnSeemannsgarn/linux-mint-config.git
# Instead of pull use fetch and reset to overwrite local files
git fetch --all
git reset --hard origin/master

git submodule update --init --recursive

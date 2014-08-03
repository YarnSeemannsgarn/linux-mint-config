#!/bin/sh

ssh-keygen -t rsa -C $EMAIL
eval `ssh-agent -s`
ssh-add ~/.ssh/id_rsa
echo "Add public rsa key to GitHub manually, to enable git pushes without password request. You can find add instructions under https://help.github.com/articles/generating-ssh-keys#step-3-add-your-ssh-key-to-github"
read -p "Press any key to continue... " -n1 -s
ssh -T git@github.com

sudo apt-get -y install git
cd
git init
git remote add origin git@github.com:YarnSeemannsgarn/ubuntu-config.git
# Instead of pull use fetch and reset to overwrite local files
git fetch --all
git reset --hard origin/master

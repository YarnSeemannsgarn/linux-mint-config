#!/bin/sh

GIT_NAME="YarnSeemannsgarn"
EMAIL="janschlenker1990@gmail.com"

sudo apt-get -y update
sudo apt-get -y dist-upgrade
sudo apt-get -y autoclean

sudo apt-get -y install emacs24

#TODO: find and add config file
sudo apt-get -y install nautilus-dropbox

#TODO: add config file /keepassx/config.ini
sudo apt-get -y install keepassx
 
#TODO: add config file ~/.config/chromium
sudo apt-get -y install chromium-browser chromium-browser-l10n chromium-codecs-ffmpeg
sudo apt-get -y install chromium-codecs-ffmpeg-extra

ssh-keygen -t rsa -C $EMAIL
eval `ssh-agent -s`
ssh-add ~/.ssh/id_rsa
echo "Add public rsa key to GitHub manually, to enable git pushes without password request. You can find add instructions under https://help.github.com/articles/generating-ssh-keys#step-3-add-your-ssh-key-to-github"
read -p "Press any key to continue... " -n1 -s
ssh -T git@github.com

sudo apt-get -y install git
git config --global user.name $GIT_NAME
git config --global user.email $EMAIL
git config --global color.ui "auto"
git config --global pack.threads "0"  
git config --global push.default simple
cd ~
git init
git remote add origin git@github.com:YarnSeemannsgarn/ubuntu-config.git
# Instead of pull use fetch and reset to overwrite local files
git fetch --all
git reset --hard origin/master

# Normal flash player plugin doesn't work anymore
sudo apt-get -y install pepperflashplugin-nonfree

# Included in Linux Mint defaultly, but not in Ubuntu
# Use e.g. to export jpeg as pdf
sudo apt-get -y install gimp

sudo apt-get -y install texlive texlive-lang-german texlive-latex-extra

sudo apt-get -y install xfce4

# Add, because of sizing issues in LibreDraw
sudo apt-get -y install pdfshuffler

# German language package
sudo apt-get -y install libreoffice-l10n-de

# Dynamic Kernel Module Support (e.g. for automatic VirtualBox update when updating Linux Kernel)
sudo apt-get -y install build-essential dkms

sudo apt-get install -y virtualbox virtualbox-qt virtualbox-dkms virtualbox-guest-dkms
sudo adduser $USER vboxusers
newgrp - vboxusers
sudo apt-get -y install virtualbox-guest-additions-iso 
echo "You have to mount the .iso file under /usr/share/virtualbox/ via VirtualBox, to enable guest additions (e.g. Copy & Paste). 

Afterwards you can install the guest addition on the host.
Windows: The .exe file is part of the CD/DVD drive
Linux: Execute 'sudo sh ./VBoxLinuxAdditions.run' under a mounted CD/DVD drive

"
read -p "Press any key to continue... " -n1 -s


#!/bin/sh

sudo apt-get update

sudo apt-get install emacs24 -y

#TODO: find and add config file
sudo apt-get install nautilus-dropbox -y

#TODO: add config file /keepassx/config.ini
sudo apt-get install keepassx -y
 
#TODO: add config file ~/.config/chromium
sudo apt-get install chromium-browser chromium-browser-l10n chromium-codecs-ffmpeg -y
sudo apt-get install chromium-codecs-ffmpeg-extra -y

sudo apt-get install git -y
git config --global user.name YarnSeemannsgarn
git config --global user.email janschlenker1990@gmail.com
git config --global color.ui "auto"
git config --global pack.threads "0"  
git config --global push.default simple
cd ~
git init
git remote add origin https://github.com/YarnSeemannsgarn/ubuntu-config
# Instead of pull use fetch and reset to overwrite local files
git fetch --all
git reset --hard origin/master

sudo apt-get install flashplugin-installer -y

sudo apt-get update

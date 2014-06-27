#!/bin/sh

sudo apt-get -y update
sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove

sudo apt-get -y install emacs24

#TODO: find and add config file
sudo apt-get -y install nautilus-dropbox

#TODO: add config file /keepassx/config.ini
sudo apt-get -y install keepassx
 
#TODO: add config file ~/.config/chromium
sudo apt-get -y install chromium-browser chromium-browser-l10n chromium-codecs-ffmpeg
sudo apt-get -y install chromium-codecs-ffmpeg-extra

sudo apt-get -y install git
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

# Normal flash player plugin doesn't work anymore
sudo apt-get -y install pepperflashplugin-nonfree

# Included in Linux Mint defaultly, but not in Ubuntu
# Use e.g. to export jpeg as pdf
sudo apt-get -y install gimp

sudo apt-get -y install texlive texlive-lang-german texlive-latex-extra

sudo apt-get -y install xfce4


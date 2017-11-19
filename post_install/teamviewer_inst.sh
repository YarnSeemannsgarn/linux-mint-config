#!/bin/bash

# Commands copied and adapted from https://wiki.ubuntuusers.de/TeamViewer/
sudo apt-get -y purge teamviewer
sudo apt-get -y purge teamviewer:i386
sudo dpkg --add-architecture i386
sudo apt-get -y update
sudo apt-get -y install libasound2:i386 libfontconfig1:i386 libfreetype6:i386 libjpeg62:i386 libpng12-0:i386 libsm6:i386 libxrandr2:i386 libxrender1:i386 libxtst6:i386 libxinerama1:i386
wget --continue 'http://download.teamviewer.com/download/teamviewer_i386.deb'
sudo dpkg -i teamviewer_i386.deb
rm teamviewer_i386.deb
sudo apt-get -y install -f

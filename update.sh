#!/bin/bash
sudo apt-get -y update 
sudo apt-get -y dist-upgrade 
sudo apt-get -y autoclean
cd
git pull
git submodule foreach git pull --recursive
cd ~/.rbenv
git pull

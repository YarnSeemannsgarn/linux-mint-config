#!/bin/bash

set -x # Print each command

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Read config
source $DIR/config.cfg

# Add adaptions to .basrhc
cat $DIR/.bashrc_custom >> $HOME/.bashrc

# First upgrade the whole system
sudo apt-get -y update
sudo apt-get -y dist-upgrade
sudo apt-get -y autoclean

# Install chromium first, because password for GitHub Account is saved here
# chromium-codecs-ffmpeg chromium-codecs-ffmpeg-extra  --> couldn't be installed due to unmet dependencies
sudo apt-get -y install chromium-browser

# Must be installed before running emacs, otherwise there will be an error
# See here: http://stackoverflow.com/questions/14214714/cedet-wrong-type-argument-stringp-1
sudo apt-get -y install g++

sudo apt-get -y install emacs

sudo apt-get -y install nemo-dropbox

. $DIR/git_inst.sh

# Skype
wget https://repo.skype.com/latest/skypeforlinux-64.deb
sudo apt install $DIR/skypeforlinux-64.deb
rm skypeforlinux-64.deb

#TODO: add config file /keepassx/config.ini
sudo apt-get -y install keepassx

# Only for Ubuntu
# sudo apt-get -y flashplugin-installer 

# Included in Linux Mint defaultly, but not in Ubuntu
# Use e.g. to export jpeg as pdf
sudo apt-get -y install gimp

sudo apt-get -y install texlive texlive-lang-german texlive-latex-extra lmodern latex-xcolor pgf

# Burn programme - defaultly included in Ubuntu, but noteworthy for other distributions
sudo apt-get -y install brasero

sudo apt-get -y install openjdk-9-jre 

# Simple image editor like paint
sudo apt-get -y install pinta

# Ubuntu needs canonical partner for Skype: https://wiki.ubuntuusers.de/Canonical_Partner/
# sudo add-apt-repository "deb http://archive.canonical.com/ubuntu $(lsb_release -sc) partner"
# sudo apt-get update

sudo apt-get -y install redshift redshift-gtk geoclue-2.0

sudo apt-get -y install gcolor2

# Add indicator-sticknotes
sudo apt-add-repository -y ppa:umang/indicator-stickynotes
sudo apt-get -y update
sudo apt-get -y install indicator-stickynotes

# Crypto
. $DIR/exodus_inst.sh

# Jetbrains
. $DIR/php_storm_inst.sh
. $DIR/pycharm_inst.sh

# Teamviewer
. $DIR/teamviewer_inst.sh

# PDF Editor MasterPDFEditor
read -p "Please install MasterPDFEditor manually from: https://code-industry.net/free-pdf-editor/"

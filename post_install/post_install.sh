#!/bin/bash

set -x # Print each command

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Read config
source $DIR/config.cfg

# First upgrade the whole system
sudo apt-get -y update
sudo apt-get -y dist-upgrade
sudo apt-get -y autoclean

# Must be installed before running emacs, otherwise there will be an error
# See here: http://stackoverflow.com/questions/14214714/cedet-wrong-type-argument-stringp-1
sudo apt-get -y install g++

sudo apt-get -y install emacs

. $DIR/git_inst.sh

#TODO: find and add config file
sudo apt-get -y install nautilus-dropbox

#TODO: add config file /keepassx/config.ini
sudo apt-get -y install keepassx

# Only for Ubuntu
# sudo apt-get -y flashplugin-installer 

# Included in Linux Mint defaultly, but not in Ubuntu
# Use e.g. to export jpeg as pdf
sudo apt-get -y install gimp

sudo apt-get -y install texlive texlive-lang-german texlive-latex-extra lmodern latex-xcolor pgf

# Use for slow computers
# sudo apt-get -y install xfce4

# Add, because of sizing issues in LibreDraw
sudo apt-get -y install pdfshuffler

# German language package
sudo apt-get -y install libreoffice-l10n-de

#. $DIR/vbox_inst.sh

#. $DIR/evoluspencil_inst.sh

# Burn programme - defaultly included in Ubuntu, but noteworthy for other distributions
sudo apt-get -y install brasero

# Other webbrowser, to check website development
sudo apt-get -y install chromium-browser chromium-browser-l10n chromium-codecs-ffmpeg chromium-codecs-ffmpeg-extra 

sudo apt-get -y install openjdk-9-jre 

# Simple image editor like paint
sudo apt-get -y install pinta

# Ubuntu needs canonical partner for Skype: https://wiki.ubuntuusers.de/Canonical_Partner/
# sudo add-apt-repository "deb http://archive.canonical.com/ubuntu $(lsb_release -sc) partner"
# sudo apt-get update

sudo apt-get -y install redshift redshift-gtk geoclue-2.0

# sudo apt-get -y install libatk-adaptor libgail-common

# sudo apt-get -y install libatk-adaptor:i386 libgail-common:i386

# sudo apt-get -y install valgrind

# Add indicator-sticknotes
sudo apt-add-repository -y ppa:umang/indicator-stickynotes
sudo apt-get -y update
sudo apt-get -y install indicator-stickynotes


# PDF Editor MasterPDFEditor
read -p "Please install MasterPDFEditor manually from: https://code-industry.net/free-pdf-editor/"

# PDF Editor MasterPDFEditor
read -p "Please install Skype manually from: https://www.skype.com/en/download-skype/skype-for-linux/downloading/?type=weblinux-deb"


# This repositories I need when I work for smart dato
. $DIR/smart_dato_inst.sh

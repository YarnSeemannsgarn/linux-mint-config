#!/bin/sh

EMAIL="janschlenker1990@gmail.com"
LAST_PENCIL_VERSION="2.0.5"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

sudo apt-get -y update
sudo apt-get -y dist-upgrade
sudo apt-get -y autoclean

sudo apt-get -y install emacs24

. $DIR/git_inst.sh

#TODO: find and add config file
sudo apt-get -y install nautilus-dropbox

#TODO: add config file /keepassx/config.ini
sudo apt-get -y install keepassx
 
# Normal flash player plugin doesn't work anymore
sudo apt-get -y install pepperflashplugin-nonfree

# Included in Linux Mint defaultly, but not in Ubuntu
# Use e.g. to export jpeg as pdf
sudo apt-get -y install gimp

sudo apt-get -y install texlive texlive-lang-german texlive-latex-extra

# Use e.g. for VirtualBox
sudo apt-get -y install xfce4

# Add, because of sizing issues in LibreDraw
sudo apt-get -y install pdfshuffler

# German language package
sudo apt-get -y install libreoffice-l10n-de

# Dynamic Kernel Module Support (e.g. for automatic VirtualBox update when updating Linux Kernel)
sudo apt-get -y install build-essential dkms

. $DIR/vbox_inst.sh

. $DIR/evoluspencil_inst.sh

# Burn programme - defaultly included in Ubuntu, but noteworthy for other distributions
sudo apt-get -y install brasero

sudo apt-get -y install xournal

. $DIR/ruby_on_rails_inst.sh

# Other webbrowser, to check website development
sudo apt-get -y install sudo apt-get install chromium-browser chromium-browser-l10n

git submodule update --init --recursive

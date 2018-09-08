#!/bin/bash

set -x # Print each command

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Read config
source $DIR/config.cfg

# Add adaptions to .basrhc
cat $DIR/.bashrc_custom >> $HOME/.bashrc

# First upgrade the whole system
sudo pacman -Syu --noconfirm

# To install third party libraries
sudo pacman -Syu --noconfirm yaourt

sudo pacman -Syu --noconfirm chromium
sudo pacman -Syu --noconfirm emacs
sudo pacman -Syu --noconfirm keepassx2

yaourt -S --noconfirm dropbox

# TODO: Set dropbox support for dolhpin via https://wiki.archlinux.org/index.php/Dolphin#Installation

# To enable mouse support (was not working defaulty on T580)
sudo pacman -Syu --noconfirm xf86-input-synaptics

# TODO: Invert touchpad scroll via Touchpad --> Scrolling

# Inkscape is the default graphic programme... TODO: try out instead of gimp

. $DIR/git_inst.sh # git is already installed

# Skype is already installed

sudo pacman -Syu --noconfirm texlive-most

# sudo pacman -Syu --noconfirm k3b # TODO should depend on laptop

sudo pacman -Syu --noconfirm redshift
sudo cat $DIR/.manjaro_redshift_custom >> /etc/geoclue/geoclue.conf

sudo pacman -Syu --noconfirm gpick

sudo pacman -Syu --noconfirm knotes

. $DIR/exodus_inst.sh

yaourt -S --noconfirm teamviewer

yaourt -S --noconfirm masterpdfeditor

sudo pacman -Syu --noconfirm filezilla

yaourt -S --noconfirm docear

# TOR
# AUR package tor-browser did not work
# Downloaded TOR via https://dist.torproject.org/torbrowser/8.0/tor-browser-linux64-8.0_en-US.tar.xz

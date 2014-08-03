#!/bin/sh

EMAIL="janschlenker1990@gmail.com"
LAST_PENCIL_VERSION="2.0.5"

sudo apt-get -y update
sudo apt-get -y dist-upgrade
sudo apt-get -y autoclean

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

sudo apt-get -y install emacs24
git submodule init
git submodule update
cd $HOME/.emacs.d/rinari
git submodule init
git submodule update
cd

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
echo "Windows programm list for VirtualBox:
  - Antivir
  - Elster
  - Dropbox (only sync necessary files e.g. Elster formulas)"
read -p "Press any key to continue... " -n1 -s

# Burn programme - defaultly included in Ubuntu, but noteworthy for other distributions
sudo apt-get -y install brasero

echo "We have to check manually, whether there is a newer version of the mockup-tool pencil, because they don't provide a symlink for the newest version. So the last installed version was ${LAST_PENCIL_VERSION}. Please check http://pencil.evolus.vn/Downloads.html for a newer version."
read -p "Is there a newer version?" -s answer
case $answer in
        [Yy]* ) echo "Then download the newer version and install it with sudo dpkg -i *.deb. Also don't forget to change the version in this post_install script. As a last step you could also check, whether they finally provide a symlink."; read -p "Press any key to continue... " -n1 -s; break;; 
        [Nn]* ) echo "Allright! Then we just install the last version automatically =)"; read -p "Press any key to continue... " -n1 -s; wget http://evoluspencil.googlecode.com/files/evoluspencil_2.0.5_all.deb; sudo dpkg -i evoluspencil_2.0.5_all.deb; break;; 
        * ) echo "Please answer yes or no.";
esac

sudo apt-get -y install xournal

. ~/post_install/ruby_on_rails_inst.sh

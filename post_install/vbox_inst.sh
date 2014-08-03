#!/bin/sh

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

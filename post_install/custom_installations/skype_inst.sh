#!/bin/bash

cd
file_name=skypeforlinux-64.deb
wget https://code-industry.net/public/${file_name}
sudo dpkg -i ${file_name}
rm ${file_name}

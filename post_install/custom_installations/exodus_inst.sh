#!/bin/bash

cd /opt/
file_name=exodus-linux-x64-${EXODUS_VERSION}
dir_name=Exodus-linux-x64
sudo rm -rf $dir_name
sudo wget https://exodusbin.azureedge.net/releases/${file_name}.zip
sudo unzip ${file_name}.zip
sudo chown -R $USER:$USER $dir_name
sudo rm ${file_name}.zip

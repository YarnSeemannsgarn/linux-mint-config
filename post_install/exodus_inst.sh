#!/bin/bash

cd /opt/
file_name=exodus-linux-x64-${EXODUS_VERSION}
sudo wget https://exodusbin.azureedge.net/releases/${file_name}.zip
sudo unzip ${file_name}.zip
sudo chown -R $USER:$USER Exodus-linux-x64*
sudo rm ${file_name}.zip

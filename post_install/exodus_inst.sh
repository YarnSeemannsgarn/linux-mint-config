#!/bin/bash

echo
echo "We have to check manually, whether there is a newer version of Exodus, because they don't provide a symlink for the newest version. So the last installed version was ${LAST_EXODUS_VERSION}. Please check https://www.exodus.io/releases/ for a newer version."

while true; do
    read -p "Is there a newer version?" -s answer
    case $answer in
        [Yy]* )
            echo "Then download the newer version and follow the instructions of https://www.exodus.io/releases/. Also don't forget to change the version in this post_install script. As a last step you could also check, whether they finally provide a symlink."
            read -p "Press any key to continue... " -n1 -s
            break;; 
        [Nn]* )
            echo "Allright! Then we just install the last version automatically =)"
            read -p "Press any key to continue... " -n1 -s
            cd /opt/
            fileName=exodus-linux-x64-${LAST_EXODUS_VERSION}
            sudo wget https://exodusbin.azureedge.net/releases/${fileName}.zip
            sudo unzip ${fileName}.zip # TODO: change to unzzip for manjaro
            sudo chown -R $USER:$USER Exodus-linux-x64*
            sudo rm ${fileName}.zip
            read -p "Don't forget to add a desktop symbol;) Press any key to continue... " -n1 -s
            break;;
        * )
            echo "Please answer yes or no.";;
    esac
done

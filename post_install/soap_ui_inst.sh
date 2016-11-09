#!/bin/bash

echo
echo "We have to check manually, whether there is a newer version of SOAP UI, because they don't provide a symlink for the newest version. So the last installed version was ${LAST_SOAP_UI_VERSION}. Please check https://www.soapui.org/downloads/latest-release.html for a newer version."

while true; do
    read -p "Is there a newer version?" -s answer
    case $answer in
        [Yy]* )
            echo "Then download the newer version and follow the instructions of https://www.soapui.org/getting-started/installing-soapui/installing-on-linux-or-unix.html. Also don't forget to change the version in this post_install script. As a last step you could also check, whether they finally provide a symlink."
            read -p "Press any key to continue... " -n1 -s
            break;; 
        [Nn]* )
            echo "Allright! Then we just install the last version automatically =)"
            read -p "Press any key to continue... " -n1 -s
            cd /opt/
            fileName=SoapUI-x64-${LAST_SOAP_UI_VERSION}.sh
            sudo wget http://cdn01.downloads.smartbear.com/soapui/${LAST_SOAP_UI_VERSION}/${fileName}
            sudo chown $USER:$USER $fileName
            chmod +x $fileName
            sudo ./$filename
            read -p "Don't forget to add a desktop symbol;) Press any key to continue... " -n1 -s
            break;;
        * )
            echo "Please answer yes or no.";;
    esac
done

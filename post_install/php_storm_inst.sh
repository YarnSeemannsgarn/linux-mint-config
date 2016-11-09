#!/bin/bash

echo
echo "We have to check manually, whether there is a newer version of PHP Storm, because they don't provide a symlink for the newest version. So the last installed version was ${LAST_PHP_STORM_VERSION}. Please check https://www.jetbrains.com/phpstorm/download/#section=linux-version for a newer version."

while true; do
    read -p "Is there a newer version?" -s answer
    case $answer in
        [Yy]* )
            echo "Then download the newer version and follow the instructions of https://www.jetbrains.com/phpstorm/download/#section=linux-version. Also don't forget to change the version in this post_install script. As a last step you could also check, whether they finally provide a symlink."
            read -p "Press any key to continue... " -n1 -s
            break;; 
        [Nn]* )
            echo "Allright! Then we just install the last version automatically =)"
            read -p "Press any key to continue... " -n1 -s
            cd /opt/
            fileName=PhpStorm-${LAST_PHP_STORM_VERSION}
            sudo wget https://download.jetbrains.com/webide/${fileName}.tar.gz
            sudo tar xfz ${fileName}.tar.gz
            sudo chown -R $USER:$USER PhpStorm-*
            rm ${fileName}.tar.gz
            read -p "Don't forget to add a desktop symbol;) Press any key to continue... " -n1 -s
            break;;
        * )
            echo "Please answer yes or no.";;
    esac
done

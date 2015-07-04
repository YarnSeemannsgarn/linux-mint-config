#!/bin/bash

echo "We have to check manually, whether there is a newer version of the mockup-tool pencil, because they don't provide a symlink for the newest version. So the last installed version was ${LAST_PENCIL_VERSION}. Please check http://pencil.evolus.vn/Downloads.html for a newer version."
read -p "Is there a newer version?" -s answer
case $answer in
        [Yy]* ) echo "Then download the newer version and install it with sudo dpkg -i *.deb. Also don't forget to change the version in this post_install script. As a last step you could also check, whether they finally provide a symlink."; read -p "Press any key to continue... " -n1 -s; break;; 
        [Nn]* ) echo "Allright! Then we just install the last version automatically =)"; read -p "Press any key to continue... " -n1 -s; wget http://evoluspencil.googlecode.com/files/evoluspencil_2.0.5_all.deb; sudo dpkg -i evoluspencil_2.0.5_all.deb; break;; 
        * ) echo "Please answer yes or no.";
esac

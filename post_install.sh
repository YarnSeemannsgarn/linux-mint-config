#!/bin/sh

GITNAME="YarnSeemannsgarn"
EMAIL="janschlenker1990@gmail.com"

apt-get -y update
apt-get -y dist-upgrade
apt-get -y autoclean

apt-get -y install emacs24

#TODO: find and add config file
apt-get -y install nautilus-dropbox

#TODO: add config file /keepassx/config.ini
apt-get -y install keepassx
 
#TODO: add config file ~/.config/chromium
apt-get -y install chromium-browser chromium-browser-l10n chromium-codecs-ffmpeg
apt-get -y install chromium-codecs-ffmpeg-extra

ssh-keygen -t rsa -C $EMAIL
eval `ssh-agent -s`
ssh-add ~/.ssh/id_rsa
echo "Add public rsa key to GitHub manually, to enable git pushes without password request. You can find add instructions under https://help.github.com/articles/generating-ssh-keys#step-3-add-your-ssh-key-to-github"
while true; do
    read -p "Have you added your public key to GitHub?" answer
    case $answer in
	 [Yy]* ) break;;
	 [Nn]* ) echo "Then do it!";;
	 * ) echo "Please answer yes or no.";;
    esac
done
ssh -T git@github.com

apt-get -y install git
git config --global user.name $GITNAME
git config --global user.email $EMAIL
git config --global color.ui "auto"
git config --global pack.threads "0"  
git config --global push.default simple
cd ~
git init
git remote add origin git@github.com:YarnSeemannsgarn/ubuntu-config.git
# Instead of pull use fetch and reset to overwrite local files
git fetch --all
git reset --hard origin/master

# Normal flash player plugin doesn't work anymore
apt-get -y install pepperflashplugin-nonfree

# Included in Linux Mint defaultly, but not in Ubuntu
# Use e.g. to export jpeg as pdf
apt-get -y install gimp

apt-get -y install texlive texlive-lang-german texlive-latex-extra

apt-get -y install xfce4


#!/bin/bash

set -x # Print each command

DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)

# Read config
source $DIR/config.cfg

# Add adaptions to .basrhc
cat $DIR/.bashrc_custom >> $HOME/.bashrc

# Upgrade the whole system
sudo apt-get -y update
sudo apt-get -y dist-upgrade
sudo apt-get -y autoclean

# Install packages
PACKAGES=$(sed -E '/^[[:blank:]]*(#|$)/d; s/#.*//' $DIR/packages.txt)
sudo apt-get install $PACKAGES

# Run custom installations
for SCRIPT in $DIR/custom_installations/*
do
    if [ -f $SCRIPT -a -x $SCRIPT ]
	then
		$SCRIPT
	fi
done

# Show final comments
$DIR/final_comments.sh

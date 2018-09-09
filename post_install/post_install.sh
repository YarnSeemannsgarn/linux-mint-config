#!/bin/bash

set -x # Print each command

DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)
CUSTOM_INST_DIR=$DIR/custom_installations
PROGRAM_ADAPT_DIR=$DIR/program_adaptions

# Read config
source $DIR/config.cfg

# Upgrade the whole system
sudo apt-get -y update
sudo apt-get -y dist-upgrade
sudo apt-get -y autoclean

# Install packages
PACKAGES=$(sed -E '/^[[:blank:]]*(#|$)/d; s/#.*//' $DIR/packages.txt)
sudo apt-get install $PACKAGES

# Run custom installations
for SCRIPT in $CUSTOM_INST_DIR/*
do
    if [ -f $SCRIPT -a -x $SCRIPT ]
	then
		$SCRIPT
	fi
done

# Run program adaptions
for SCRIPT in $PROGRAM_ADAPT_DIR/*
do
    if [ -f $SCRIPT -a -x $SCRIPT ]
	then
		$SCRIPT
	fi
done

# Show final comments
$DIR/final_comments.sh

#!/bin/bash

set -x # Print each command

DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)
CUSTOM_INST_DIR=$DIR/custom_installations
PROGRAM_ADAPT_DIR=$DIR/program_adaptions

# Read config
source $DIR/config.cfg

# Upgrade the whole system
apt update -y
apt dist-upgrade -y
apt autoclean -y

# Install packages
PACKAGES=$(cat $DIR/packages.txt)
apt install -y $PACKAGES

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

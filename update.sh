#!/bin/bash

apt update -y
apt dist-upgrade -y
apt autoclean -y

cd
git pull
git submodule update --init --recursive

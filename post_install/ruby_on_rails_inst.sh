#!/bin/sh

# Following the guide under https://gorails.com/setup/ubuntu/14.04
sudo apt-get -y update
sudo apt-get -y install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties

cd
git clone git://github.com/sstephenson/rbenv.git .rbenv
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
exec $SHELL

rbenv install 2.1.2
rbenv global 2.1.2

sudo add-apt-repository -y ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get -y install nodejs

gem install rails

rbenv rehash

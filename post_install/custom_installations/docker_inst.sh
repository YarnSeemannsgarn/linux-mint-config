#!/bin/bash

# Docker
apt remove -y docker docker-engine docker.io
apt update -y
apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

cd /tmp
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

. /etc/upstream-release/lsb-release
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   ${DISTRIB_CODENAME} \
   stable"

apt update -y
apt install -y docker-ce

# Manage Docker as a non-root user
sudo groupadd docker
sudo usermod -aG docker $USER

# Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

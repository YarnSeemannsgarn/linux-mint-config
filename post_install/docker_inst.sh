# Docker
sudo apt-get remove docker docker-engine docker.io
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

cd /tmp
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   ${DOCKER_PARENT_UBUNTU_DISTRO} \
   stable"

sudo apt-get update
sudo apt-get install docker-ce

# Docker Compose
sudo curl -L https://github.com/docker/compose/releases/download/${LAST_DOCKER_COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

# Bash completion
sudo curl -L https://raw.githubusercontent.com/docker/compose/${LAST_DOCKER_COMPOSE_VERSION}/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose

# Manage Docker as a non-root user
sudo groupadd docker
sudo usermod -aG docker $USER

#!/bin/bash

# Docker compose releases
# https://github.com/docker/compose/releases
DOCKER_COMPOSE_RELEASE="1.27.3"

#### Install Docker Engine on Ubuntu ####

# Uninstall possible old versions of docker
cd ~
sudo apt-get remove docker docker-engine docker.io containerd runc

### INSTALL USING THE REPOSITORY ###

## SET UP THE REPOSITORY ##
# Update and install some packages
sudo apt-get update -qq
sudo apt-get install -yy \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
# Add Docker’s official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# Set up the stable repository
# You might need to change $(lsb_release -cs) to your parent Ubuntu distribution.
# For example, if you are using Linux Mint Tessa, you could use bionic
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable"
# Update de packages
sudo apt update -qq
# Certificate that will be installed from the Docker repository
apt-cache policy docker-ce

## INSTALL DOCKER ENGINE ##
sudo apt-get install -yy docker-ce docker-ce-cli containerd.io

### MANAGE DOCKER AS A NON-ROOT USER ###

# Add your user to the docker group
sudo usermod -aG docker ${USER}
# # Apply the new group membership
# echo "Confirm new group membership:"
# su - ${USER}
# # Check that your user is now added to the docker group
# echo "Check user:"
# id -nG

### VERIFY THAT YOU CAN RUN DOCKER ###
echo "run hello-world from docker"
docker run hello-world

#### Install Docker Compose ####

# Go to Downloads folder
cd /home/$USER/Downloads
# Download the current stable release of Docker Compose
sudo wget -O  \
/usr/local/bin/docker-compose \
"https://github.com/docker/compose/releases/\
download/${DOCKER_COMPOSE_RELEASE}/docker-compose-$(uname -s)-$(uname -m)"
# Apply executable permissions to the binary
sudo chmod +x /usr/local/bin/docker-compose

# If the command docker-compose fails after installation,
# check your path. You can also create a symbolic link
# to /usr/bin or any other directory in your path.
# Ex: sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# Test the installation
echo "Show current docker compose version:"
docker-compose --version

#### Uninstall Docker Engine ####

# # Uninstall the Docker Engine, CLI, and Containerd packages
#sudo apt-get purge  -yy docker-ce docker-ce-cli containerd.io
# # Delete all images, containers, and volumes
#sudo rm -rf /var/lib/docker
#sudo rm -rf /usr/local/bin/docker-compose

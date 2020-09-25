#!/bin/bash

RED='\033[0;31m'
NC='\033[0m'
BIYellow='\033[1;93m'

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

echo -e "${BIYellow}-----> AFTER INSTALLATION <-----${NC} \n"
echo -e "${BIYellow}Manage Docker as a non-root user ${NC}"
echo -e "Add your user to the docker group:${RED} sudo usermod -aG docker \${USER} ${NC} \n"
echo -e "${BIYellow}Apply the new group membership${NC}"
echo -e "Confirm new group membership:${RED} su - \${USER} ${NC} \n"
echo -e "${BIYellow}Check that your user is now added to the docker group${NC}"
echo -e "Check user:${RED} id -nG ${NC} \n"
echo -e "${BIYellow}Verify that you can run docker${NC}"
echo -e "Run hello-world from docker:${RED} docker run hello-world ${NC} \n"

#### Uninstall Docker Engine ####

# # Uninstall the Docker Engine, CLI, and Containerd packages
#sudo apt-get purge  -yy docker-ce docker-ce-cli containerd.io
# # Delete all images, containers, and volumes
#sudo rm -rf /var/lib/docker
#sudo rm -rf /usr/local/bin/docker-compose

#!/bin/bash

RED='\033[0;31m'
NC='\033[0m'
BIYellow='\033[1;93m'

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

if [ $(lsb_release -cs) == 'focal' ]
then
echo -e "Code Name: Focal Fossa \n"
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/11.0.3/local_installers/cuda-repo-ubuntu2004-11-0-local_11.0.3-450.51.06-1_amd64.deb
dpkg -i cuda-repo-ubuntu2004-11-0-local_11.0.3-450.51.06-1_amd64.deb
apt-key add /var/cuda-repo-ubuntu2004-11-0-local/7fa2af80.pub
mv cuda-repo-ubuntu2004-11-0-local_11.0.3-450.51.06-1_amd64.deb /Downloads
elif [ $(lsb_release -cs) == 'bionic' ]
then
echo -e "Code Name: Bionic Beaver \n"
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-ubuntu1804.pin
mv cuda-ubuntu1804.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/11.0.3/local_installers/cuda-repo-ubuntu1804-11-0-local_11.0.3-450.51.06-1_amd64.deb
dpkg -i cuda-repo-ubuntu1804-11-0-local_11.0.3-450.51.06-1_amd64.deb
apt-key add /var/cuda-repo-ubuntu1804-11-0-local/7fa2af80.pub
mv cuda-repo-ubuntu1804-11-0-local_11.0.3-450.51.06-1_amd64.deb /Downloads
else
echo "The script installs Ubuntu versions 18.04 or 20.04 only."
exit 1
fi

apt-get update -qq
echo -e "Installig cuda \n"
apt-get install -y -qq cuda > /dev/null
echo -e "Finished install cuda \n"

echo -e "${BIYellow}-----> After installation <-----${NC} \n"
echo -e "Set your path to point to CUDA binaries:\
${RED} echo 'export PATH=/usr/local/cuda/bin\${PATH:+:\${PATH}}' >> ~/.bashrc ${NC} \n"
echo -e "Reload .bashrc typing: ${RED}source ~/.bashrc ${NC} \n"
echo -e "Check cuda version to confirm instalation: ${RED}nvcc --version${NC} \n"

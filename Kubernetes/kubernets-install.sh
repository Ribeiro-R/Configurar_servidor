#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

### Install and Set Up kubectl ###

# Install kubectl binary with curl on Linux
#Download the latest release
curl -LO "https://storage.googleapis.com/kubernetes-release/release/\
$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)\
/bin/linux/amd64/kubectl"
# Make the kubectl binary executable.
chmod +x ./kubectl
# Move the binary in to your PATH.
mv ./kubectl /usr/local/bin/kubectl
echo " "
echo -e "Test to ensure the version you installed is up-to-date: \n"
kubectl version --client

### Install Minikube ###

# check if virtualization is supported on Linux
# and verify that the output is non-empty
grep -E --color 'vmx|svm' /proc/cpuinfo

# Install Minikube via direct download
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
  && chmod +x minikube

mkdir -p /usr/local/bin/
install minikube /usr/local/bin/

rm -f minikube

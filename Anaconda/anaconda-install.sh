#!/bin/bash

# Anaconda installer archive
# https://repo.anaconda.com/archive/
CONDA_INSTALL="Anaconda3-2020.07-Linux-x86_64.sh"

cd ~
echo "Start update and upgrade"
sudo apt-get update -qq
sudo apt-get upgrade -yy
sudo apt-get install -yy libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 \
libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6
echo " "
echo "Finished update and upgrade"

cd /home/$USER/Downloads
if [ -f ${CONDA_INSTALL} ]; then
    echo " "
    echo -e "${CONDA_INSTALL} file found. \n"
else
    echo " "
    echo -e "${CONDA_INSTALL} file not found . \n"
    echo -e "Downloading ... \n"
    wget https://repo.anaconda.com/archive/${CONDA_INSTALL}
fi

# -b—Batch mode with no PATH modifications to ~/.bashrc
# -p—Installation prefix/path.
# -f—Force installation even if prefix -p already exists.
bash ${CONDA_INSTALL} -b -p $HOME/anaconda3 &&

eval "$(/home/$USER/anaconda3/bin/conda shell.${SHELL##*/} hook)" &&

conda init

echo "====>  IF YOU DON'T WANT TO RE-OPEN YOUR CURRENT SHELL TYPE: source ~/.bashrc  <===="

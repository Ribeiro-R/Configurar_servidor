#!/bin/bash

sudo apt-get update -qq
sudo apt-get upgrade -yy
sudo apt-get install -yy libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2\
libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6

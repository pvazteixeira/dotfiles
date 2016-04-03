#!/bin/zsh

# sudo apt-get update

# install packages from list
sudo apt-get  install $( sed '/^#/ d' < install.txt)
			   

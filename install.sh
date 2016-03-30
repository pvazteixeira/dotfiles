#!/bin/sh

# install packages from list
sudo apt-get -y install $(< install.txt)

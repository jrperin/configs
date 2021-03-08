#!/bin/bash

# Update the Raspbian
echo "Updating Raspbian..."
sudo apt update

# Prerequisites
echo "Install prerequisites..." 
sudo apt-get install -y build-essential tk-dev libncurses5-dev libncursesw5-dev libreadline6-dev libdb5.3-dev libgdbm-dev libsqlite3-dev libssl-dev libbz2-dev libexpat1-dev liblzma-dev zlib1g-dev libffi-dev tar wget vim

# Download Python
echo "Removendo pasta e download antigo..."
rm Python-3.8.0.tgz
rm -rf Python-3.8.0 

echo "Download python3.8..."
wget https://www.python.org/ftp/python/3.8.0/Python-3.8.0.tgz

# Install Python 3.8
echo "Install Python 3.8"
sudo tar zxf Python-3.8.0.tgz
cd Python-3.8.0
sudo ./configure --enable-optimizations
sudo make -j `nproc`
sudo make altinstall

echo "Checking Python version..."
python3.8 -V


echo "Acertando links simbolicos..."
sudo rm /usr/bin/python3 /usr/bin/python
ln -s /usr/bin/python3.8 /usr/bin/python3
ln -s /usr/bin/python3   /usr/bin/python

ls -la /usr/bin/python*


#!/bin/bash

# Update the Raspbian
echo "Updating Raspbian..."
sudo apt update

# Prerequisites
echo "Install prerequisites..." 
sudo apt-get install -y build-essential tk-dev libncurses5-dev libncursesw5-dev libreadline6-dev libdb5.3-dev libgdbm-dev libsqlite3-dev libssl-dev libbz2-dev libexpat1-dev liblzma-dev zlib1g-dev libffi-dev tar wget vim

# Download Python
echo "Removendo pasta e download antigo..."
rm Python-3.8.8.tar.xz
rm -rf Python-3.8.8 

echo "Download python3.8..."
wget https://www.python.org/ftp/python/3.8.8/Python-3.8.8.tar.xz

# Install Python 3.8
echo "Install Python 3.8.8"
sudo tar xf Python-3.8.8.tar.xz
cd Python-3.8.8
sudo ./configure --enable-optimizations
sudo make 
sudo make install

echo "Checking Python version..."
python3 --version


echo "Acertando links simbolicos..."
# sudo rm /usr/bin/python3 /usr/bin/python
# ln -s /usr/bin/python3.8 /usr/bin/python3
# ln -s /usr/bin/python3   /usr/bin/python

ls -la /usr/bin/python*


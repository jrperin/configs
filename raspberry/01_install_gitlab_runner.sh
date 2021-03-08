#!/bin/bash

# Based On: https://blog.sebastian-martens.de/technology/install-gitlab-runner-on-raspberry-pi/

echo
echo -e "\e[32;1m --- Instalando Docker --- \e[39;0m"
echo

echo "Installing required packages..."
sudo apt install -y apt-transport-https ca-certificates software-properties-common

echo "Downloading & Installing docker..."
curl -fsSL get.docker.com -o get-docker.sh && sh get-docker.sh


echo "Allowing ${USER} to run docker commands..."
sudo usermod -aG docker ${USER}

echo "Adding docker key..."
sudo curl https://download.docker.com/linux/raspbian/gpg

echo "Adding docker to $SOURCESLIST..."
SOURCESLIST="/etc/apt/sources.list"
sed -i 'deb https://download.docker.com/linux/raspbian/ stretch stable' $SOURCESLIST
echo 'deb https://download.docker.com/linux/raspbian/ stretch stable' >> $SOURCESLIST

echo "Updating and Upgrading raspbian"
sudo apt update && sudo apt upgrade -y

echo "Installing the docker service (systemclt start docker.service)..."
systemctl start docker.service

echo
echo -e "\e[32;1m --- Instalando Gitlab Runner --- \e[39;0m"
echo

echo "Running GitLab package script..."
curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh | sudo bash

echo "Installing GitLab runner..."
sudo apt- install -y gitlab-runner

echo "You need to reboot the system befor go ahead"
echo "sudo shutdown -r now"

echo
echo "Check if everything is ok with:"
echo "$ docker info"
echo "$ sudo gitlab-runner status"
echo
echo "Register GitLab Runner with:"
echo "$ sudo gitlab-runner register"
echo
echo "--- END ---"

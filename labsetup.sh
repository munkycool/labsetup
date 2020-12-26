#!/bin/bash

# Homelab deployment automation script

cd ~/Downloads
touch deployerlog.txt

sudo apt update
sudo apt-get update
sudo apt upgrade

# Install VIM
sudo apt install vim -y
vim --version >> ~/Downloads/deployerlog.txt

# Install curl
sudo apt install curl -y
curl --version >> ~/Downloads/deployerlog.txt

# Install Virtalbox using latest .deb file
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian eoan contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list

# Install Virtualbox Extension Pack
sudo apt update
sudo apt install linux-headers-$(uname -r) dkms
sudo apt-get install virtualbox-6.1 -y
wget https://download.virtualbox.org/virtualbox/6.1.6/Oracle_VM_VirtualBox_Extension_Pack-6.1.6.vbox-extpack
vboxmanage extpack install Oracle_VM_VirtualBox_Extension_Pack-6.1.6.vbox-extpack
virtualbox --version >> ~/Downloads/deployerlog.txt

# Install GNS3
sudo add-apt-repository ppa:gns3/ppa
sudo apt install gns3-server gns3-gui -y
echo "Press Yes for both the next prompts"
gns3 --version >> ~/Downloads/deployerlog.txt
sudo usermod -aG kvm $(whoami)
sudo apt install xtightvncviewer -y

# Install Git
sudo apt install git -y
git --version >> ~/Downloads/deployerlog.txt

# Install VS Code
sudo apt install software-properties-common apt-transport-https wget -y
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code -y
code --version >> ~/Downloads/deployerlog.txt

echo "Deployment script completed. Here's what is now installed:"
cat ~/Downloads/deployerlog.txt

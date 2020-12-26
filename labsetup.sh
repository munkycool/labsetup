#!/bin/bash

```
Homelab deployment automation script
```

sudo apt update
sudo apt-get update
sudo apt upgrade

# Install VIM
sudo apt install vim -y
vim --version

# Install Virtalbox using latest .deb file
cd ~/Downloads
curl -O https://download.virtualbox.org/virtualbox/6.1.16/virtualbox-6.1_6.1.16-140961~Ubuntu~eoan_amd64.deb
sudo dpkg -i virtualbox-6.1_6.1.16-140961~Ubuntu~eoan_amd64.deb
virtualbox --version

# Install Virtualbox Extension Pack
curl -O https://download.virtualbox.org/virtualbox/6.1.16/Oracle_VM_VirtualBox_Extension_Pack-6.1.16.vbox-extpack
sudo VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-6.1.16.vbox-extpack

# Install GNS3
sudo add-apt-repository ppa:gns3/ppa
sudo apt install gns3-server gns3-gui -y
echo "Press Yes for both the next prompts"
gns3 --version
sudo usermod -aG kvm $(whoami)
sudo apt install xtightvncviewer -y

# Install Git
sudo apt install git -y
git --version

# Install VS Code
sudo apt install software-properties-common apt-transport-https wget -y
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code -y
code --version

# Remove installation files
rm virtualbox-6.1_6.1.16-140961~Ubuntu~eoan_amd64.deb
rm Oracle_VM_VirtualBox_Extension_Pack-6.1.16.vbox-extpack

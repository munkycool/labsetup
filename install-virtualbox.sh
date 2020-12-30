function install-virtualbox {
    # Install Virtalbox using latest .deb file
    wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
    wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
    echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian eoan contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
    
    # Install Virtualbox Extension Pack
    sudo apt update
    sudo apt install linux-headers-$(uname -r) dkms -y
    sudo apt-get install virtualbox-6.1 -y
    wget https://download.virtualbox.org/virtualbox/6.1.16/Oracle_VM_VirtualBox_Extension_Pack-6.1.16-140961.vbox-extpack
    vboxmanage extpack install Oracle_VM_VirtualBox_Extension_Pack-6.1.16-140961.vbox-extpack --accept-license=33d7284dc4a0ece381196fda3cfe2ed0e1e8e7ed7f27b9a9ebc4ee22e24bd23c
    
    # Create a shortcut to Virtualbox
    gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | sed s/.$//), 'virtualbox.desktop']"
}

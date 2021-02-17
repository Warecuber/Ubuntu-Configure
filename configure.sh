#!/bin/bash
echo "===== Starting configuration script ====="
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install htop neofetch glances -y
echo "===== Creating SSH Group ====="
sudo groupadd sshuser
sudo usermod -aG sshuser $USER
echo "===== Configuring SSH ====="
sh ./ssh.sh
sudo ufw enable
mv ./update.sh ~/update.sh
echo "===== Adding custom shortcuts ====="
echo "alias update='sh ~/update.sh'" >> ~/.bashrc
echo "Added update command
#!/bin/bash
echo "===== Starting configuration script ====="
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install htop neofetch glances -y
echo "===== Configuring SSH ====="
sh ./ssh.sh
sudo ufw enable

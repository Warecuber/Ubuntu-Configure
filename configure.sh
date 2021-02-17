#!/bin/bash
# echo "===== Starting configuration script ====="
# sudo apt-get update
# sudo apt-get upgrade -y
# sudo apt-get install htop neofetch glances -y
# echo "===== Creating SSH Group ====="
# sudo groupadd sshuser
# sudo usermod -aG sshuser $USER
# echo "===== Configuring SSH ====="
# sh ./ssh.sh
# sudo ufw enable
# mv ./update.sh ~/update.sh
# echo "===== Adding custom shortcuts ====="
# echo "alias update='sh ~/update.sh'" >> ~/.bashrc
# echo "Added update command to shell"
read -n1 -p "Do you want to configure a static IP? y/n: " staticip
if [[ $staticip == "y" || $staticip == "Y" ]]
then
    echo "\nconfiguring a static IP"
    read -p "What shoud be the IP of the server? " serverip
    read -p "What is the IP of the gateway? " gatewayip
    read -p "Is the DNS the same as gateway? y/n: " isDNSSame
    if [[ $isDNSSame == "n" || $isDNSSame == "N"]]
    then
        read -p "What DNS server should it use? " dnsIP
    else
        dnsIP=$gatewayip
    fi
    echo "IP: $serverip\nGateway: $gatewayip\nDNS Server: $dnsIP"
else
    echo "\nNot configuring static IP" 
fi
echo "Done with IP"
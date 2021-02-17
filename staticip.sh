#!/bin/bash

echo "\nconfiguring a static IP"
read -p "What shoud be the IP of the server? " serverip
read -p "What is the IP of the gateway? " gatewayip
read -n1 -p "Is the DNS the same as gateway? y/n: " isDNSSame
if [[ $isDNSSame == "n" || $isDNSSame == "N" ]]
then
    read -p "What DNS server should it use? " dnsIP
else
    dnsIP=$gatewayip
fi
touch ./00-installer-config.yaml
echo "network:" >> ./00-installer-config.yaml
echo "  ethernets:" >> ./00-installer-config.yaml
echo "    ens160:" >> ./00-installer-config.yaml
echo "      dhcp4: no" >> ./00-installer-config.yaml
echo "      addresses: [$serverip/24]" >> ./00-installer-config.yaml
echo "      gateway4: $gatewayip" >> ./00-installer-config.yaml
echo "      nameservers:" >> ./00-installer-config.yaml
echo "        addresses: [$dnsIP]" >> ./00-installer-config.yaml
echo "  version: 2" >> ./00-installer-config.yaml
sudo mv ./00-installer-config.yaml /etc/netplan/00-installer-config.yaml
sudo netplan --debug apply

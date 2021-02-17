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
echo "network:"\
"\n  ethernets:"\
"\n    ens160:"\
"\n      dhcp4: no"\
"\n      addresses: [$serverip/24]"\
"\n      gateway4: $gatewayip"\
"\n      nameservers:"\
"\n        addresses: [$dnsIP]"\
"\n  version: 2" >> 00-installer-config.yaml
sudo mv 00-installer-config.yaml /etc/netplan/00-installer-config.yaml
sudo netplan --debug apply

#!/bin/bash

### Still need to tidy up configuring PermitRootLogin yes instead of simply appending, for text file neatness.


### Create backup
sudo cp /etc/netplan/00-installer-config.yaml /etc/netplan/00-installer-config.yaml.bak

KPgateway=192.168.1.254
DNS1=8.8.8.8
DNS2=8.8.4.4
ipPrefix=192.168.1.
cidr=/24

nic=`ip addr show ens32 | awk 'NR==1{print $2}' | tr -d ':'`

# Ask for input on desired static IP address
read -p "Enter the desired last octet between 1 and 253, includisve): " octet


echo
cat > /etc/netplan/00-installer-config.yaml <<EOF
network:
  version: 2
  renderer: networkd
  ethernets:
    $nic:
      addresses:
        - $ipPrefix$octet$cidr
      gateway4: $KPgateway
      nameservers:
        addresses: [$DNS1, $DNS2]
EOF
sudo netplan apply                                              # apply yaml configuration change for static IP
echo 'Applying requested static IP...'
echo "This host's static IP is now $ipPrefix$octet$cidr"
sudo apt update
sudo apt upgrade -y
sudo apt install ssh -y
sudo echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
sudo systemctl restart sshd
sudo apt autoremove -y

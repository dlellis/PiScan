#!/bin/bash

#Sets up the raspberry pi
#http://tinyurl.com/piSetupScript
#Run as sudo (sorry)

apt-get -y update
apt-get -y upgrade
apt-get -y install nmap
apt-get -y install xsltproc
apt-get -y install inotify-tools
apt-get -y install openssh-server

#Check if something is installed:
#apt-cache policy nmap | grep Installed | awk '{ print $2}'
#result is either package name or none
#if (none), install package



#To install Masscan on Ubuntu 14.04.03 LTS Desktop :

apt-get -y install git build-essential libpcap-dev

cd ~
mkdir arsenal
cd arsenal
git clone https://github.com/robertdavidgraham/masscan.git
cd masscan
make
ln -s ~/arsenal/masscan/bin/masscan /usr/bin/masscan #not sure this works on every system
chmod 755 /usr/bin/masscan
#next time set this to a specific user^ (?)

#Allow of usb tethering to ssh into pi
echo >> /etc/network/interfaces
echo "allow-hotplug usb0" >> /etc/network/interfaces
echo "iface usb0 inet dhcp" >> /etc/network/interfaces
/etc/init.d/networking restart

wget -q http://tinyurl.com/piScript -O /home/pi/piScript.sh
wget -q http://tinyurl.com/zjmpffr -O /home/pi/wait2.sh
wget -q http://tinyurl.com/piBack -O /home/pi/piBack.sh

#Changes from UK layout to US
sed -i -e 's/gb/us/g' /etc/default/keyboard

init 6

exit 0



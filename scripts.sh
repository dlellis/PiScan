#!/bin/bash

MASK=$"24"

ip=$(ip addr list eth0 | grep "inet " | cut -d' ' -f6 | cut -d/ -f1)


netm="0/$MASK"

first3=$(printf $ip | cut -d'.' -f1-3) #Problem Spot

scan=$(printf "$first3.$netm") #Problem Spot

nmap -e eth0 -sV -p 22,53,80,110,143,4564 -oX "/home/pi/$ip-intense.xml" > /dev/null 2>&1
xsltproc /home/pi/$ip-intense.xml -o "/home/pi/$ip-intense.html" > /dev/null 2>&1

while true; do

	ip=$(ip addr list eth0 | grep "inet " | cut -d' ' -f6 | cut -d/ -f1)

	if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
		:
		#echo "Is connected"
	

	else
		#echo "Is not connected"
		break;

	fi

	sleep 5

done

{ ./wait2.sh & } 2>/dev/null


exit 0








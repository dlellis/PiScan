#!/bin/bash

#wget http://tinyurl.com/piBack -O piBack.sh

#Backs up the other two scrips. 
while true; do
	#Check if it has internet, wget
	if ping -q -c 1 -W 1 8.8.8.8 > /dev/null 2>&1; then
		wget -q http://tinyurl.com/piScript -O /tmp/piScript.sh
	else
		:
	fi

	#Check if it has internet, wget
	if ping -q -c 1 -W 1 8.8.8.8 > /dev/null 2>&1; then
		wget -q http://tinyurl.com/zjmpffr -O /tmp/wait2.sh
	else
		:
	fi

	#Create patch, apply patch
	diff /home/pi/piScript.sh /tmp/piScript.sh > /tmp/piPatch
	patch /home/pi/piScript.sh < /tmp/piPatch > /dev/null

	diff /home/pi/wait2.sh /tmp/wait2.sh > /tmp/wtPatch
	patch /home/pi/wait2.sh < /tmp/wtPatch > /dev/null


	sleep 5


done
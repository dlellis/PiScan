#!/bin/bash

#inotifywait -e modify /sys/class/net/eth0/carrier



while true; do
	ip=$(ip addr list eth0 | grep "inet " | cut -d' ' -f6 | cut -d/ -f1)

	
	 if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
		#echo "Is connected"
		{ ./home/pi/piScript.sh & } 2>/dev/null
		break;

	else
		:
	fi

	sleep 5

done

exit 0
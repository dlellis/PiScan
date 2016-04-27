# PiScan
A tool that helps a raspberry pi become an automated scanning device for collecting information about a network. It is still in early stages of of development but when it is completed it should perform some of the following tasks:
- Install everything required and initialize start up scripts
- Wait for a connection to the pi
- Scan network it is connected to with nmap or masscan
- Wait for network unplug and begin again at waiting

Additional features can be added if an lcd screen is used which can help with:
- Identifying the current IP
- Pressing buttons to run repeated commands

This tool was created from the need to connect to and scan a large number of ports without carrying a laptop to each one and manually running nmap. Any comments and help with the bash scripts is welcome. Python scripts also welcome.
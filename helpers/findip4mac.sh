#/bin/bash
echo 'Looking for IP addr ...'

sudo nmap -sP 172.16.0.1/22 | awk '/Nmap scan report for/{printf $5;}/MAC Address:/{print " => "$3;}' | sort

echo "Done!"
exit 0

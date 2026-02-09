#!/bin/bash

VERDE='\033[0;32m'
NC='\033[0m'
INTERFAZ='wlp0s20f3'

arp-scan -I "$INTERFAZ" --localnet | grep -v "Interface" | grep -v "Starting" | grep -v "Ending" | grep -v "packets" | awk '{print $1}' | tr -d ' ' > ips.txt

while read -r ip; do
	echo -e "$VERDE Escanenado con nmap $ip$NC"
	nmap -p- -sS -sC -sV --min-rate=5000 -n -Pn "$ip" -oN "escaneo_$ip.txt"
	
done < ips.txt
 
rm -r ips.txt

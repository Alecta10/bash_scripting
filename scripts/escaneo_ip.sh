#!/bin/bash

ip=$1

ROJO='\033[0;31m'
AMARILLO='\033[0;33m'
AZUL='\033[0;34m'
NC='\033[0m' # No Color / Reset

if ping -c 1 "$ip" > /dev/null; then
	echo -e "El host es accesible"
	ttl=$(ping -c 1 $ip | grep "ttl=" | awk '{print $6}' | tr -d 'ttl=')
	echo -e "El ttl es $ttl"
	
	if [ $ttl -gt 60 ] && [ $ttl -lt 70 ]; then
	echo -e "$AZUL Se trata de un Linux$NC"

	elif [ $ttl -gt 100 ] && [ $ttl -lt 130 ]; then
		echo -e "$AMARILLO Se trata de un Windows$NC"
	fi

else
	echo -e "$ROJO No tenemos conectividad con esa IP$NC"
fi

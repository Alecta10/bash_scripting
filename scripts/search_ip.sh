#!/bin/bash

VERDE='\033[0;32m'
NC='\033[0m'
RED="192.168.1."

function control_c(){
	echo "Detenido por usuario"
	exit
}

trap control_c SIGINT

# Se hace desde el 129 porque en mi red solo hay dispositivos en este rango
# Y se podria hacer todo el rango pero tardaria mas tiempo
for i in {129..254}; do
	timeout 1 bash -c "ping -c 1 -W 1 $RED$i" >/dev/null
	
	if [ $? -eq 0 ]; then
		echo -e "\e[K${VERDE}Host activo $RED$i${NC}"
	else
		echo -ne "Probando $RED$i\r"
	fi
done

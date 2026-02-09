#!/bin/bash

add_user(){
	read -p "Introduce el nombre para añadirlo: " username
	sudo adduser "$username"
	clear
	echo  "Usario creado correctamente "
}

del_user(){
	read -p "Introduce el nombre para elminarlo: " username
	sudo deluser --remove-home "$username"
	clear
	echo  "Usario elminado correctamente "
}

while true; do
	echo -e "\n1. Añadir usuario"
	echo -e "2. Borrar usuario"
	echo -e "3. Salir"
	read -p "Introduce 1,2,3 para elegir la opcion deseada: " eleccion

	case $eleccion in
		1)
			add_user;;
		2)
			del_user;;
		3)
			clear
			exit 1;;
		*)
			"Introduce un valor válido"
	esac
done

#!/bin/bash


# Variables globales
archivo_local='copia_seguridad.zip'
mi_nombre=$(basename "$0")

# Creamos las carpetas organizadas
organizar(){
	mkdir -p scripts documentos configuracion
	
	for archivo in *
	do
		# SEGURIDAD: Si el archivo es este script o el zip final, NO lo muevas
		if [[ "$archivo" == "$mi_nombre" || "$archivo" == "$archivo_local" ]]; then
			continue
		fi

		# IGNORAR si es un directorio (para no ver errores vacíos)
		if [[ -d "$archivo" ]]; then
			continue
		fi
		
		base=$(basename "$archivo")
		ext=$(echo "$base" | awk -F '.' '{print $NF}')
	
		case "$ext" in
			sh|py)
				mv "$archivo" scripts/ ;;
			pdf|txt)
				mv "$archivo" documentos/ ;;
			yml)
				mv "$archivo" configuracion/ ;;
			*)
				echo "no se ha comprimo $archiivo, porque no se ha encontrado su extension" ;;
		esac
	done
	
	zip -r "$archivo_local" documentos/ scripts/ configuracion/
	rm -r documentos/ scripts/ configuracion/
}

# Funcion para subir el zip por ftp
subir(){
	# IP y usuario para iniciar sesion ftp
	servidor='192.168.1.152'
	usuario='adm_server'
	password='contraseña_segura'
		
	# Ruta donde guardar el archivo
	ruta_archivo_server="/home/adm_server/copia_seguridad.zip"
	
	# Comando para subir el archivo
	curl -u "$usuario:$password" -T "$archivo_local" ftp://$servidor/$ruta_archivo_server
}

# --- Ejecución ---
organizar
subir


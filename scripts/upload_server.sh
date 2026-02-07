#!/bin/bash

# IP y usuario para iniciar sesion ftp
servidor='192.168.1.152'
usuario='adm_server'
password='contraseña_segura'

# Ruta y archivo para subir
# Solo añadimos el archivo porque esta en la misma direccion que el script
ruta_archivo_local="texto.txt"

# Ruta donde guardar el archivo
ruta_archivo_server="/home/adm_server/texto.txt"

# Comando para subir el archivo
curl -u "$usuario:$password" -T "$ruta_archivo_local" ftp://$servidor/$ruta_archivo_remoto

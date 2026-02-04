#!/bin/bash
# Como parametro
archivo=$1

# Como entrada de datos (opcional si no pasas parámetro)
# read -p "Introduce el nombre del archivo a buscar: " archivo

# Ejecución de la búsqueda
resultado=$(find / -name "$archivo" 2> /dev/null)

resultado_final=$(echo "$resultado" | tr '/' ' ' | awk '{print $NF}')
size=$(du -h "$resultado" 2>/dev/null | awk '{print $1}')

# Salida con formato y colores
echo "El archivo $resultado_final$, se encontró."
echo "El archivo pesa: $size"

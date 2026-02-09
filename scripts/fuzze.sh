#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Introduce <diccionario> <URL>"
    exit 1
fi

diccionario="$1"
url="$2"

total_lines=$(wc -l "$diccionario" | awk '{print $1}')
current_line=0

while read -r linea; do
    # Se añade esto porque al usarlo en ubuntu y clonar el repo del diccionario
    # Tiene saltos de lineas para windows son \r \n y linux solo \n 
    linea="${linea//$'\r'/}"
    current_line=$((current_line + 1))

    echo -ne "Progreso: $current_line/$total_lines\r"
    respuesta=$(curl -s -o /dev/null -w "%{http_code}" "$url/$linea/")

    # Si es 200 (OK) o 304 (Caché), es que existe
    if [[ "$respuesta" -eq 200 || "$respuesta" -eq 304 ]]; then
        echo "URL accesible: $url/$linea"
    fi

done < "$diccionario"

#!/bin/bash

read -r $'Introduce una extensión\n> ' ext
for archivo in *
do
        # Se encuentra despues del . la extension
        extension=$(echo "$archivo" | awk -F '.' '{print $NF}')
        case "$extension" in
                "$ext")
                    zip -r documentos.zip $archivo >/dev/null
                ;;
        esac
done

# -p, si ya existe no se sobreescribe
mkdir -p servidor/ && mv documentos.zip servidor/
ip=$(hostname -I)

echo "Introduce $ip en el navegador para descargar los archivos"
cd servidor/ && python3 -m http.server 80

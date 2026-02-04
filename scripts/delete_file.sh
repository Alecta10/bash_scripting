#!/bin/bash
# Este script sirva para eliminar archivos mas grandes que 10000 bytes
for archivo in *
do
# Solo la primera fila porque awk nos trae peso y despues el nombre
peso=$(du -b "$archivo" | awk '{print $1}')

		#Peso en byte
        if [ "$peso" -gt 10000 ]; then
        
	        #Para automatizar deberia estar sin confirmacion
            echo "Vamos a borrar $archivo ya que pesa más de 1MB"
            read -p $'¿Estás seguro? (y/yes): \n' conf
            
            if [ "$conf" = "y" ] || [ "$conf" = "yes" ]; then
                    echo "Borrando $archivo"
                    rm "$archivo"
                else
                    echo "No se ha borrado $archivo"
            fi
        fi
done

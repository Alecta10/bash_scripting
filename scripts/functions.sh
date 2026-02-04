#!/bin/bash
# 1. Definimos las funciones primero
crear_archivo(){
    touch archivoCreado.txt
    echo "Archivo creado."
}

crear_carpeta(){
    mkdir carpetaCreada
    echo "Carpeta creada."
}


read -p "Introduce 1 para crear archivo y 2 para crear carpeta: " num
while [[ "$num" != "1" && "$num" != "2" ]]; do
    echo "Opción no válida."
    read -p "Introduce 1 para crear archivo y 2 para crear carpeta: " num
done


if [ "$num" == "1" ]; then
    crear_archivo
else
    crear_carpeta
fi

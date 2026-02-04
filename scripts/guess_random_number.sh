#!/bin/bash
# script para adivinar un numero del 1 al 10
read -p "Introduce un numero para adivinarlo: " num_usuario
num=$((RANDOM % 10 + 1))

while [ "$num" -ne "$num_usuario" ] 2>/dev/null; do
        read -p "Introduce otro nuevo numero: " num_usuario

        if [ "$num" -eq "$num_usuario" ] 2>/dev/null; then
                echo "ENHORABUENA ESE ERA EL NUMERO CORRECTO "
                break
        fi
done

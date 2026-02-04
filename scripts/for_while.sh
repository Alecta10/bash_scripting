#!/bin/bash
for signa in $(cat examenes.txt)
do
        echo "$signa"
done

# Imprime:
#Mates
#Conocimientos
#del
#medio

#Esto para escribir lineas completas, read -r → no interpreta "\" como escape
while IFS= read -r signa
do
        echo $signa
done < examenes.txt 

# Imprime:
#Mates
#Conocimientos del medio

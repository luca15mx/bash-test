#!/bin/bash

echo "Ejericio de pares"
read -p "Introduce un numero : " NUMERO
if [ $((NUMERO%2)) -eq 0 ]; then
    echo "El numero introducido es par "
else
    echo "El numero introducido es impar"
fi    
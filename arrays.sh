#!/bin/bash

# Info de.. https://linuxhandbook.com/bash-arrays/

mis_hijos=("Zury" "Perla" "Chunku" "Palomo")

echo ${mis_hijos[*]}

# agregar un elemento
mis_hijos+=("Benji")

echo ${mis_hijos[*]}

echo "Numero de elementos en el areglo ${#mis_hijos[@]}"

# quitar un elemento
unset mis_hijos[4]

echo ${mis_hijos[*]}

#!/bin/bash
###############################################################################
#
#NOMBRE:multiplo.sh
#OBJETIVO: Utilizar bucles para ver si un numero es multiplo
#           de otros que se han dado como entrada
#AUTOR: Adrián Herrera Brito <adrian.herrera.br@gmail.com>
#       Raúl Rodríguez Farrais <raulrodrigue87@gmail.com>
#ARGUMENTOS: Todos aquellos que se introduzcan por teclado
#SALIDAS: Si el numero es o no multiplo
#
#VERSIONES: 1.0: Código inicial (15/02/2023)
#
###############################################################################

valores="$@"
read -p "Introduzca el multiplo a analizar: " mult

echo "Analizando si los numeros $valores son o no multiplos de $mult"
for i in $valores:
do
    res=$((i%$mult))
    if [ $res -eq 0 ]
    then
        echo "El numero $i SI es multiplo de $mult"
    else
        echo "El numero $i NO es multiplo de $mult"
    fi
done

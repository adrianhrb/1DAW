#!/bin/bash
###############################################################################
#
#NOMBRE:compara.sh
#OBJETIVO: comparar dos números y ver cual es mayor
#AUTOR: Adrián Herrera Brito <adrian.herrera.br@gmail.com>
#		Raúl Rodríguez Farrais <raulrodrigue87@gmail.com>
#ARGUMENTOS: total=2, primer numero = num1, segundo numero = num2
#SALIDAS:cuál es mayor de los dos
#:
#VERSIONES: 1.0: código inicial (15/02/2023)
#	    1.1: Se comparan más condiciones (15/02/2023)
###############################################################################

num1=$1
num2=$2

if [ "$num1" -gt "$num2" ]
then
	echo "El numero 1 ($num1) es mayor que el numero 2 ($num2)"
elif [ "$num1" -lt "$num2" ]
then
	echo "El numero 2 ($num2) es mayor que el numero 1 ($num1)"
else
	echo "Los numeros $num1 y $num2 son iguales"
fi

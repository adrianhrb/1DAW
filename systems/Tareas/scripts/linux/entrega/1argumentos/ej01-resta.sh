#!/bin/bash
###############################################################################
#
#NOMBRE:resta.sh
#OBJETIVO: que se calcule la resta entre dos números de entrada
#AUTOR: Adrián Herrera Brito <adrian.herrera.br@gmail.com>
#		Raúl Rodríguez Farrais <raulrodrigue87@gmail.com>
#ARGUMENTOS: total=2,  número1 = 1, número2 = 2 
#SALIDAS:el resultado de la resta
#
#VERSIONES: 1.0: Código inicial (15/02/23)
#
###############################################################################

num1=$1
num2=$2

if [ -z $num1 ]
then
	read -p "Indica el número 1 para realizar la resta: " num1
fi

if [ -z $num2 ]
then
	read -p "Indica el número 2 para realizar la resta: " num2
fi

result=$((num1 - num2))

echo "El resultado de la operación $num1 - $num2 = $result"

#!/bin/bash
#############################################################
#
# NOMBRE: F_grados.sh
#OBJETIVO: Pasar los grados celsius a grados fahrenheit
#AUTOR: Adrián Herrera Brito <adrian.herrera.br@gmail.com>
#		Raúl Rodríguez Farrais <raulrodrigue87@gmail.com>
#ARGUMENTOS: total=1, grados celsius=1
#SALIDAS: Los grados celsius de entrada transformado a fahrenheit
#
#
#VERSIONES: 1.0 (código inicial) 13/01/2023
#	    1.1 (Se pide entrada con un read) 17/01/2023
#	    1.2 (Se piden argumentos) 17/01/2023
#	    1.3 (Se comprueba que al menos haya un argumento) 17/01/2023
#		1.4 (Se finaliza el programa) 15/02/2023
############################################################
celsius=$1
if [ $# == 0 ]
then
	echo "ERROR! Debe indicar la temperatura en grados celcius"
	read -p "Introduce la temperatura: " celsius
fi
conversion=$(echo "$celsius * 1.8 + 32" | bc)

echo "El intercambio de $celsius grados celsius a fahrenheit es igual a $conversion Fª"

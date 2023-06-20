#!/bin/bash
###############################################################################
#
#NOMBRE:pares.sh
#OBJETIVO:Calculo de pares entre dos numeros y sus cuadrados
#AUTOR: Adrián Herrera Brito <adrian.herrera.br@gmail.com>
#		Raúl Rodríguez Farrais <raulrodrigue87@gmail.com>
#ARGUMENTOS: total=2,  num1=1 , num2=2
#SALIDAS: Los números pares en el rango indicado y el cáculo de sus cuadrados
#
#VERSIONES: 1.0: Código inicial (00/00/00)
#
###############################################################################
num1=$1
num2=$2

for i in $(seq $num1 1 $num2)
do
	par=$((i%2))
	if [ $par -eq 0 ]
	then
		cuad=$((i*i))
		echo "El cuadrado del numero par $i es $cuad"
	fi
done

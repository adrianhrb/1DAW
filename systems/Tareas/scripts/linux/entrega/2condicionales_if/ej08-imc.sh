#!/bin/bash
###############################################################################
#
#NOMBRE:imc.sh
#OBJETIVO:calcular el índice de masa corporal de una persona
#
#
#AUTOR: Adrián Herrera Brito <adrian.herrera.br@gmail.com>
#		Raúl Rodríguez Farrais <raulrodrigue87@gmail.com>
#ARGUMENTOS: total=2  altura=1 , peso=2
#SALIDAS: el calculo de su imc con un mensaje que indica el rango
#		  en el que se encuentra
#VERSIONES: 1.0: Código inicial (15/02/2023)
#
###############################################################################

altura=$1
peso=$2


if [ $# == 0 ]
then
	echo "ERROR! No se han introducido datos de entrada"
	read -p "Introduzca su altura: " altura
	read -p "Introduzca su peso: " peso 
fi

imc=$(echo " 10000 * $peso / ($altura * $altura)" | bc)

if [[ $imc -lt 16 ]]
then
	echo "Su índice de masa corporal, $imc, indica que tiene delgadez severa"

elif [[ $imc -lt 17 ]]
then
	 echo "Su índice de masa corporal, $imc, indica que tiene delgadez moderada"

elif [[ $imc -lt 19 ]]
then
	echo "Su índice de masa corporal, $imc, indica que tiene delgadez leve"

elif [[ $imc -lt 25 ]]
then
	echo "Su índice de masa corporal, $imc, indica que tiene un peso normal"

elif [[ $imc -lt 30 ]]
then
	echo "Su índice de masa corporal, $imc, indica que tiene sobrepeso"
else
	echo "Su índice de masa corporal, $imc, indica que tiene obesidad"
fi

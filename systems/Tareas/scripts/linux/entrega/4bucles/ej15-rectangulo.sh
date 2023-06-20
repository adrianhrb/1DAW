#!/bin/bash
###############################################################################
#
#NOMBRE:rectangulo.sh
#OBJETIVO:que pinte un rectángulo con unas medidas que se piden como entrada
#AUTOR: Adrián Herrera Brito <adrian.herrera.br@gmail.com>
#		Raúl Rodríguez Farrais <raulrodrigue87@gmail.com>
#ARGUMENTOS: Base y altura que se piden como entrada
#SALIDAS:un rectángulo pintado con las medidas indicadas
#
#VERSIONES: 1.0: Código inicial (10/02/23)
#
###############################################################################

base=$1
altura=$2

if [ -z $base ]
then
	base=7
elif [ -z $altura ]
then
	altura=4
fi

echo "Vamos a pintar un rectangulo de base $base y altura $altura, por tanto con area = $(( $base * $altura ))"

for i in $(seq 1 1 $altura)
do
	echo -e " "
	for j in $(seq 1 1 $base)
	do
		echo -n "#"
	done
	echo -e "\n"
done

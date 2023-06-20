#!/bin/bash
###############################################################################
#
#NOMBRE: calcula_segundos.sh
#OBJETIVO:Programa que pasa un tiempo a segundos
#AUTOR: Adrián Herrera Brito <adrian.herrera.br@gmail.com>
#       Raúl Rodríguez Farrais <raulrodrigue87@gmail.com>
#ARGUMENTOS: total=4, dias=1, horas=2, minutos=3, segundos=4
#SALIDAS: Los segundos totales del tiempo indicado
#
#VERSIONES: 1.0: Código inicial (15/02/2023)
#
###############################################################################

dias=$1
horas=$2
minutos=$3
segundos=$4  

if [ -z $dias ]
then
    echo "Error, no ha indicado los dias"
    read -p "Indique la cantidad de días: " dias
fi  

if [ -z $horas ]
then
    echo "Error, no ha indicado las horas"
    read -p "Indique la cantidad de horas: " horas
fi  

if [ -z $minutos ]
then
    echo "Error, no ha indicado los minutos"
    read -p "Indique la cantidad de minutos: " minutos
fi

if [ -z $segundos ]
then
    echo "Error, no ha indicado los segundos"
    read -p "Indique la cantidad de segundos: " segundos
fi

dias_seg=$(($dias * 86400))
horas_seg=$(($horas * 3600))
minutos_seg=$(($minutos * 60))

total_seg=$(($dias_seg + $horas_seg + $minutos_seg + $segundos))

echo "En $dias dias, $horas horas, $minutos minutos y $segundos segundos hay en total $total_seg segundos"

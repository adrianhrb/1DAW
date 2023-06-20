#!/bin/bash
###############################################################################
#
#NOMBRE: dia_semana.sh
#OBJETIVO: Saber el dia de una fecha que se indique
#AUTOR: Adrián Herrera Brito <adrian.herrera.br@gmail.com>
#       Raúl Rodríguez Farrais <raulrodrigue87@gmail.com>
#ARGUMENTOS: total=3, dia=1, mes=2, año=3
#SALIDAS: El día de la semana de la fecha indicada
#
#VERSIONES: 1.0: Código inicial (15/02/2023)
#
###############################################################################

dia=$1
mes=$2
anyo=$3

if [ -z $dia ]
then
    echo "Error, no ha indicado el dia"
    exit
fi  

if [ -z $mes ]
then
    echo "Error, no ha indicado mes"
    exit
fi  

if [ -z $anyo ]
then
    echo "Error, no ha indicado el año"
    exit
fi

diasem=$(date -d $anyo-$mes-$dia +"%A")
echo "El día de la semana de la fecha indicada($dia/$mes/$anyo) fue un $diasem"

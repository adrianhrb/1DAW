#!/bin/bash
###############################################################################
#
#NOMBRE:deposito.sh
#OBJETIVO: Calcular un deposito a plazo fijo de interés compuesto
#AUTOR: Adrián Herrera Brito <adrian.herrera.br@gmail.com>
#		Raúl Rodríguez Farrais <raulrodrigue87@gmail.com>
#ARGUMENTOS: total=3,  deposito=1, TAE=2, años=3
#SALIDAS: Las ganancias del deposito año a año
#
#VERSIONES: 1.0: Código inicial (15/02/23)
#
###############################################################################
deposito=$1
TAE=$2
anyos=$3

if [ -z $deposito ]
then
	echo "Se deben indicar tres valores: Deposito, TAE y años"
	exit 100
elif [ -z $TAE ]
then
	echo "Se deben indicar tres valores: Deposito, TAE y años"
	exit 100
elif [ -z $anyos ]
then
	echo "Se deben indicar tres valores: Deposito, TAE y años"
	exit 100
fi

echo "Mostrando los datos para un depósito de $deposito euros con interés compuesto del $TAE % a $anyos años:"
echo ""
nuevo_saldo="$saldo"
plus=0
for i in $(seq 1 1 $anyos)
do
	intereses=$(echo "$nuevo_saldo * $TAE / 100" | bc)
	nuevo_saldo=$(echo "$intereses + $deposito" | bc)
	plus=$(echo "$nuevo_saldo - $saldo" | bc)

        echo "Año $i: $nuevo_saldo (has ganado $plus euros)"
done
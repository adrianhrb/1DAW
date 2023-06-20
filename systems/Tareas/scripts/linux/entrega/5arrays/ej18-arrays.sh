#!/bin/bash
###############################################################################
#
#NOMBRE:arrays.sh
#OBJETIVO: meter de una lista de entrada a otra lista pares al principio
#		   e impares al final y hacer cálculos
#AUTOR: Adrián Herrera Brito <adrian.herrera.br@gmail.com>
#		Raúl Rodríguez Farrais <raulrodrigue87@gmail.com>
#ARGUMENTOS: Los de entrada del usuario
#SALIDAS: las listas resultantes y los cálculos de max, min y avg
#
#VERSIONES: 1.0: Código inicial (15/02/23)
#
###############################################################################
numbers=$@
final_array=()
echo "Se han recibido $# argumentos: $@"
for i in ${numbers[@]}
do
	mod=$(echo "$i % 2" | bc)
	if [ $i -lt 0 ]
	then
		echo "$i es negativo y por tanto es ignorado"
		echo ""
	elif [ $mod -eq 0 ]
	then
		echo "$i es par, asi que lo insertamos por el PRINCIPIO"
		echo ""
		final_array=("$i" "${final_array[@]}")
	else
		echo "$i es impar, asi que lo insertamos por el FINAL"
		echo ""
		final_array+=($i)
	fi
done

elements="${#final_array[@]}"
echo "El array construido ($elements elementos): ${final_array[@]}"

MIN="${final_array[0]}"
MAX="${final_array[0]}"
total_sum=0
for j in "${final_array[@]}"
do
	if [ $j -lt $MIN ]
	then
		MIN=$j
	fi
	if [ $j -gt $MAX  ]
	then
		MAX=$j
	fi
	total_sum=$((total_sum + $j))
done

media=$(echo "$total_sum / $elements" | bc)
echo "MIN= $MIN , MAX = $MAX , MEDIA = $media"

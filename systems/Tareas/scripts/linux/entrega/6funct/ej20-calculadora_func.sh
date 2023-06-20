#!/bin/bash
###############################################################################
#
#NOMBRE:calculadora.sh
#OBJETIVO:Realizar una calculadora con funciones
#AUTOR: Adrián Herrera Brito <adrian.herrera.br@gmail.com>
#
#ARGUMENTOS: dos números
#SALIDAS: Resultado de la operación que se pide con un menú por pantalla
#
#VERSIONES: 1.0: Código inicial (15/02/23)
#
###############################################################################
num1=$1
num2=$2

opciones=("Sumar" "Restar" "Dividir" "Multiplicar" "Salir")

function sumar {
        suma=$(($1 + $2))
        echo "El resultado de sumar $1 + $2 es $suma"
}

function restar {
        resta=$(($1 - $2))
        echo "El resultado de restar $1 - $2 es $resta"
}

function multiplicar {
        multi=$(($1 * $2))
        echo "El resultado de multiplicar $1 * $2 es $multi"
}

function dividir {
	divi=$(($1 / $2))
        echo "El resultado de dividir $1 / $2 es $divi"
}

while true
do
        echo "¿Qué operación desea realizar?"
        select opcion in "${opciones[@]}"
        do
                case $opcion in
                        Sumar)
                                sumar $num1 $num2
                                break
                                ;;
                        Restar)
                                restar $num1 $num2
                                break
                                ;;
                        Multiplicar)
                                multiplicar $num1 $num2
                                break
                                ;;
                        Dividir)
                                dividir $num1 $num2
                                break
                                ;;
                        Salir)
                                exit 0
                                ;;
                        *)
                                echo "Opción incorrecta. Elija una del menú."
                                ;;
                esac
        done
done

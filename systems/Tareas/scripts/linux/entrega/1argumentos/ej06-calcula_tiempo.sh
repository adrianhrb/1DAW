###############################################################################
#
#NOMBRE: calcula_tiempo.sh
#OBJETIVO: Pasar de segundos a días, horas, minutos y segundos
#AUTOR: Adrián Herrera Brito <adrian.herrera.br@gmail.com>
#       Raúl Rodríguez Farrais <raulrodrigue87@gmail.com>
#ARGUMENTOS: total = 1, segundos=1
#SALIDAS: La conversión que hagamos de los segundos devuelta
#         en forma de días, horas, minutos y segundos
#
#VERSIONES: 1.0: Código inicial (15/02/2023)
#
###############################################################################

segundos=$1

if [ -z $segundos ]
then
    echo "ERROR, no ha indicado los segundos en el programa"
    exit
fi

dias=$(($segundos / 86400))
horas=$((($segundos - ($dias * 86400)) / 3600))
minutos=$((($segundos - ($dias * 86400) - ($horas * 3600)) / 60))
segundos_finales=$((($segundos - ($dias * 86400) - ($horas * 3600) - ($minutos * 60))))

echo "El total de $segundos segundos son: $dias dias, $horas horas, $minutos minutos y $segundos_finales segundos"

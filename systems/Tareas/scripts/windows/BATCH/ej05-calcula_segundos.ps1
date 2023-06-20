###############################################################
##
#NOMBRE: calcula_segundos.cmd
#OBJETIVO: Script que pasa de un tiempo a segundos
#AUTOR: Adrián Herrera Brito <adrian.herrera.br@gmail.com>
##      Raúl Rodríguez Farrais <raulrodrigue87@gmail.com>
#ARGUMENTOS: total=4, 1=dias, 2=horas, 3=minutos, 4= segundos
#SALIDAS: Los segundos del tiempo indicado
##
##
#FECHA:15/02/23
#VERSIONES: 1.0 (código inicial)
###############################################################

$dias_seg = $arg[0] * 86400
$horas_seg = $arg[1] * 3600
$minutos_seg = $arg[2] * 60

$total_seg = $dias_seg + $horas_seg + $minutos_seg + $arg[3]

Write-Host "El total de segundos en los datos indicados es $total_seg"
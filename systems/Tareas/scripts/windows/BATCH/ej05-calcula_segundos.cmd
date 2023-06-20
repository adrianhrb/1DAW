@echo off
REM ##############################################################
REM #
REM NOMBRE: calcula_segundos.cmd
REM OBJETIVO: Script que pasa de un tiempo a segundos
REM AUTOR: Adrián Herrera Brito <adrian.herrera.br@gmail.com>
REM #      Raúl Rodríguez Farrais <raulrodrigue87@gmail.com>
REM ARGUMENTOS: total=4, 1=dias, 2=horas, 3=minutos, 4= segundos
REM SALIDAS: Los segundos del tiempo indicado
REM #
REM #
REM FECHA:15/02/23
REM VERSIONES: 1.0 (código inicial)
REM ##############################################################


set /A dias_seg = %1 * 86400
set /A horas_seg = %2 * 3600
set /A minutos_seg = %3 * 60

set /A total_seg = %dias_seg% + %horas_seg% + %minutos_seg% + %4

echo El total de segundos en los datos indicados son %total_seg%
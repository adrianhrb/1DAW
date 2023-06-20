@echo off
REM ##############################################################
REM #
REM NOMBRE: crear_usuarios.cmd
REM OBJETIVO: Script que pase segundos a fecha con dia, hora, minutos y seg.
REM AUTOR: Adrián Herrera Brito <adrian.herrera.br@gmail.com>
REM #      Raúl Rodríguez Farrais <raulrodrigue87@gmail.com>
REM ARGUMENTOS: total=1, 1=segundos de entrada
REM SALIDAS: Los segundos pasados a fehca completa
REM #
REM #
REM FECHA:15/02/23
REM VERSIONES: 1.0 (código inicial)
REM               
REM ##############################################################

set /A dias = %1 / 86400
set /A horas = (%1 - (%dias% * 86400)) / 3600
set /A minutos = (%1 - (%dias% * 86400) - (%horas% * 3600)) / 60
set /A segundos = %1 - (%dias% * 86400) - (%horas% * 3600) - (%minutos% * 60)

echo Transformando los segundos nos quedamos con %dias% dias, %horas% horas, %minutos% minutos y %segundos% segundos
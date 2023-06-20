@echo off
REM ##############################################################
REM #
REM NOMBRE: calcula_cambio.cmd
REM OBJETIVO: script que calcula el cambio que hay que devolver
REM AUTOR: Adrián Herrera Brito <adrian.herrera.br@gmail.com>
REM #      Raúl Rodríguez Farrais <raulrodrigue87@gmail.com>
REM ARGUMENTOS: total = 2, base = 1, altura = 2
REM SALIDAS: El cambio que hay que devolver
REM #
REM #
REM FECHA:15/02/23
REM VERSIONES: 1.0 (código inicial)
REM               
REM ##############################################################

set precio=%1

set dinero[0]=500
set dinero[1]=200
set dinero[2]=100
set dinero[3]=50
set dinero[4]=20
set dinero[5]=10
set dinero[6]=5
set dinero[7]=2
set dinero[8]=1


set /p pago="Indique el dinero que ha pagado: "

set /A cambio= %pago% - %precio%

echo Se han pagado %pago% euros para el artículo con un precio de %precio%. El cambio es %cambio%

for /l %%i in (0,1,8) do (
    set /A devolucion= %cambio% / !dinero[%%i]
    if %devolucion% GTR 0 (
        echo "Hay que devolver %devolucion% billetes de !dinero[%%i]"
        set /A cambio=%cambio% - (%devolucion% * !billetes[%%i])
    )
)

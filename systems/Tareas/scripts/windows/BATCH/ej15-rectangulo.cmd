@echo off
REM ##############################################################
REM #
REM NOMBRE: crear_usuarios.cmd
REM OBJETIVO: Script que haga un rectángulo utilizando unos datos de entrada
REM          (en caso de n aportarse hay unos predefinidos)
REM AUTOR: Adrián Herrera Brito <adrian.herrera.br@gmail.com>
REM #      Raúl Rodríguez Farrais <raulrodrigue87@gmail.com>
REM ARGUMENTOS: total = 2, base = 1, altura = 2
REM SALIDAS: La forma rectangular pintada con #
REM #
REM #
REM FECHA:15/02/23
REM VERSIONES: 1.0 (código inicial)
REM               
REM ##############################################################


set base=%1
set altura=%2

if "%base%" == "" (
	set base=7
) else if "%altura%" == "" (
	set altura=4
)

set /A area= %base% * %altura%
echo Vamos a pintar un rectangulo de base %base% y altura %altura%, por tanto con area = %area%

for /l %%i in (1,1,%altura%) do (
    echo -
    for /l %%j in (1,1,%base%) do (
        set /p="#" <NUL
    )

)
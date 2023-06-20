@echo off
REM ##############################################################
REM #
REM NOMBRE: crear_usuarios.cmd
REM OBJETIVO: Script que cree un usuario en base a los datos que se introduzcan
REM AUTOR: Adrián Herrera Brito <adrian.herrera.br@gmail.com>
REM #      Raúl Rodríguez Farrais <raulrodrigue87@gmail.com>
REM ARGUMENTOS: total=3, 1=nombre, 2=apellido, 3=usuario
REM SALIDAS: Mensaje de bienvenida con datos y usuario
REM #
REM #
REM FECHA:15/02/23
REM VERSIONES: 1.0 (código inicial)
REM               
REM ##############################################################


echo Bienvenido %1
echo Tus datos son: %1 %2
echo vamos a crear tu usuario: %3
echo Tu nueva ID es %RANDOM%
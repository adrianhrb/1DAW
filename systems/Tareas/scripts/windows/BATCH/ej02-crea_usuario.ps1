#!/bin/bash
##############################################################################
#
# NOMBRE: crear_usuarios.sh
#OBJETIVO: Script que cree un usuario en base a los datos que se introduzcan
#AUTOR: Adrián Herrera Brito <adrian.herrera.br@gmail.com>
#       Raúl Rodríguez Farrais <raulrodrigue87@gmail.com>
#ARGUMENTOS: total=3, 1=nombre, 2=apellido, 3=usuario
#SALIDAS: Mensaje de bienvenida con datos y usuario junto a
#         un número aleatorio que se le asigna
#
#FECHA:15/02/2023
#VERSIONES: 1.0 (código inicial)
##############################################################################

$nombre= $args[0]
$apellido= $args[1]
$usuario= $args[2]
$id= Get-Random

Write-Host "Bienvenido, $nombre"
Write-Host "Tus datos son $nombre $apellido"
Write-Host "Vamos a crear tu usuario: $usuario"
Write-Host "Su nueva ID generada es $id "
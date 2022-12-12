#!/bin/bash

#########################################################################################
# Contador de líneas en blanco
#######################################################################################

echo Introduzca el archivo a analizar:
read archivo

if [ ! -e $archivo ] || [ ! -f $archivo ] || [ ! -w $archivo ] 
   then
   echo Argumento inválido. Debe ser un solo argumento, y que el archivo exista, sea regular y tenga permiso de lectura
else
   LINEAS_NO_VACIAS=$(echo | grep -v '^ *$' $archivo | wc -l)
   LINEAS_TOTALES=$(cat $archivo | wc -l)
   LINEAS_EN_BLANCO=$(($LINEAS_TOTALES - $LINEAS_NO_VACIAS))
   echo
   echo Las líneas en blanco son $LINEAS_EN_BLANCO
fi


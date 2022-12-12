#!/bin/bash

################################################################################

#1. statsWords.sh
#Indicador estadístico de longitud de palabras (la más corta, la más larga y el
#promedio de longitud).

################################################################################
echo Introduzca el archivo a analizar:
read archivo

if [ ! -e $archivo ] || [ ! -f $archivo ] || [ ! -w $archivo ] 
   then
   echo Argumento inválido. Debe ser un solo argumento, y que el archivo exista, sea regular y tenga permiso de lectura.
else

ARG=$(cat Texto.txt)
REGEX="^[a-zA-Z]*$" #Es una palabra común
REGEX2='^[a-zA-Z]?$'
REGEX3='^[\,:;]$'
REGEX4='^ ?[A-Za-z][a-z]?$'
LONG_PRIMERA=0

for i in $ARG;
   do
     if [[ $i =~ $REGEX3 ]] || [[ $i =~ $REGEX4 ]]
       then
       continue
     fi
     if [[ $i =~ $REGEX ]] || [[ $i =~ $REGEX2 ]]
       then
       LONG_PRIMERA=$(echo -n $i | wc -m)
       break
     else
       continue
     fi
  done

CONTADOR_PALABRAS=0
SUMA=0
CORTA=0
LARGA=0
PALABRA_CORTA=""
PALABRA_LARGA=""
for h in $ARG;
  do
    if [[ $h =~ $REGEX3 ]] || [[ $h =~ $REGEX4 ]]
       then
       continue
     fi
    if [[ $h =~ $REGEX ]] || [[ $h =~ $REGEX2 ]]
       then
       CONTADOR_PALABRAS=$(($CONTADOR_PALABRAS + 1))
       LONG_PALABRA=$(echo -n  $h | wc -m)
       SUMA=$(($SUMA + $LONG_PALABRA))
       if [[ $LONG_PALABRA -lt $LONG_PRIMERA ]]
         then
         PALABRA_CORTA=$h
         CORTA=$LONG_PALABRA
       fi
       if [[ $LONG_PALABRA -gt $LARGA ]]
         then
         PALABRA_LARGA=$h
         LARGA=$LONG_PALABRA
       fi
    fi
  done  


PROMEDIO=$(($SUMA / $CONTADOR_PALABRAS))

echo la palabra mas corta es: $PALABRA_CORTA, con $CORTA caracteres
echo la palabra mas larga es: $PALABRA_LARGA, con $LARGA caracteres
echo la suma de los caracteres de todas las palabras es $SUMA
echo la cantidad de palabras es $CONTADOR_PALABRAS
echo el promedio de caracteres de las palabras es $PROMEDIO

fi


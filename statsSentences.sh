#!/bin/bash

############################################################################
#4. statsSentences.sh
#Indicador estadístico de longitud de oraciones (la más corta, la más larga y el
#promedio de longitud).
###########################################################################
echo Introduzca el archivo a analizar:
read archivo

if [ ! -e $archivo ] || [ ! -f $archivo ] || [ ! -w $archivo ] 
   then
   echo Argumento inválido. Debe ser un solo argumento, y que el archivo exista, sea regular y t
else
REGEX="^ ?[A-Z][a-z]+$"
REGEX2="^[a-z]+.?\.$"
ARG=$(cut -c 1- $archivo)


CONT=0
MAY=0
FIN=0
PRIMER_ORACION=""
LONG_PRIMER_ORACION=0

for i in $ARG;
  do
   CONT=$(($CONT + 1))
   if [[ $i =~ $REGEX ]]
     then
     MAY=$CONT
   fi
   if [[ $i =~ $REGEX2 ]]
     then
      FIN=$CONT
      PRIMER_ORACION=$(echo $ARG | cut -d ' ' -f $MAY-$FIN) 
      LONG_PRIMER_ORACION=$(echo $PRIMER_ORACION | wc -m)
      break
   fi
  done

CONTADOR_PALABRAS=0
MAYUSCULA=0
PUNTO=0
TOTAL_CARACTERES=0
MAS_LARGA=$LONG_PRIMER_ORACION
ORACION_MAS_LARGA=$PRIMER_ORACION
MAS_CORTA=$LONG_PRIMER_ORACION
ORACION_MAS_CORTA=$PRIMER_ORACION
CONTADOR_ORACIONES=0


for h in $ARG;
  do
    CONTADOR_PALABRAS=$(($CONTADOR_PALABRAS + 1))
    if [[ $h =~ $REGEX ]]
      then
      MAYUSCULA=$CONTADOR_PALABRAS
    fi
    if [[ $h =~ $REGEX2 ]]
      then
      PUNTO=$CONTADOR_PALABRAS
      ORACIONES=$(echo $ARG | cut -d ' ' -f $MAYUSCULA-$PUNTO) 
      LONG=$(echo $ORACIONES | wc -m)
      TOTAL_CARACTERES=$(($TOTAL_CARACTERES + $LONG))
      CONTADOR_ORACIONES=$(($CONTADOR_ORACIONES + 1))
      if [[ $LONG -gt $MAS_LARGA ]]
        then
        MAS_LARGA=$LONG
        ORACION_MAS_LARGA=$(echo $ORACIONES)
      fi 
      if [[ $LONG -lt $MAS_CORTA ]]
        then
        MAS_CORTA=$LONG
        ORACION_MAS_CORTA=$(echo $ORACIONES)
      fi
    fi
  done
PROMEDIO=$(($TOTAL_CARACTERES / $CONTADOR_ORACIONES))

echo EL PROMEDIO DE LONGITUD DE LAS ORACIONES ES DE $PROMEDIO CARACTERES
echo LA ORACION MAS LARGA ES : $ORACION_MAS_LARGA CON $MAS_LARGA CARACTERES
echo LA ORACION MAS CORTA ES : $ORACION_MAS_CORTA CON $MAS_CORTA CARACTERES
fi

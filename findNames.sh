#!/bin/bash

######################################################################################
#3. findNames.sh
#Identificación de nombres propios (se identifican sólo si están en este formato
#Nnnnnnnnn), aunque la palabra no sea un nombre propio realmente.
#Ejemplos: Mateo, Estonoesunnombre, Ana.
######################################################################################
echo Introduzca el archivo a analizar:
read archivo

if [ ! -e $archivo ] || [ ! -f $archivo ] || [ ! -w $archivo ] 
   then
   echo Argumento inválido. Debe ser un solo argumento, y que el archivo exista, sea regular y tenga permiso de lectura
else
ARG=$(cat $archivo)
REGEX='^ ?[A-Z][a-z][a-z]+\.?$'   # Considero que un nombre propio debería tener
REGEX2='^ +$'                # al menos, tres letras (aunque el enunciado no lo
                             # especifique) 

echo NOMBRES PROPIOS:
for i in $ARG;
  do
    
     if [[ $i =~ $REGEX2 ]]
        then
        continue
     fi
     if [[ $i =~ $REGEX ]]
        then
        echo $i
     fi
  done
fi


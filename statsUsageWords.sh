#!/bin/bash

################################################################################################
#2. statsUsageWords.sh
#Indicador estadístico de uso de palabras, deben ser de al menos 4(cuatro)
#letras. (mostrar un Top Ten de estas palabras ordenadas desde la que tiene
#más apariciones a la que tiene menos). Es decir, filtrar las palabras que
#tengan al menos 4 letras y de éstas, elegir las 10 más usadas.
###############################################################################################
echo Introduzca el archivo a analizar:
read archivo

if [ ! -e $archivo ] || [ ! -f $archivo ] || [ ! -w $archivo ] 
   then
   echo Argumento inválido. Debe ser un solo argumento, y que el archivo exista, sea regular y tenga permiso de lectura.
else
  
RUTA=$(echo $archivo)
ARG=$(cat $RUTA)
REGEX="^[a-zA-Z]*$" #Es una palabra común
MINIMO=4            #Es el minimo de caracteres que pide el ejercicio
COMP_PRIMERO=0
COMP_SEGUNDO=0
COMP_TERCERO=0
COMP_CUARTO=0
COMP_QUINTO=0
COMP_SEXTO=0
COMP_SEPTIMO=0
COMP_OCTAVO=0
COMP_NOVENO=0
COMP_DECIMO=0
PRIMERA=""
SEGUNDA=""
TERCERA=""
CUARTA=""
QUINTA=""
SEXTA=""
SEPTIMA=""
OCTAVA=""
NOVENA=""
DECIMA=""

for h in $ARG;
  do
    
    if [[ $h =~ $REGEX ]] 
       then

       LONG_PALABRA=$(echo -n  $h | wc -m)
       if [[ $LONG_PALABRA -ge $MINIMO ]]
         then
         PALABRA=$h
         
         REPETICIONES=$(grep -ic $h $RUTA)
         LISTA=($REPETICIONES)
         if [ $REPETICIONES -gt $COMP_PRIMERO ]
            then
            COMP_PRIMERO=$REPETICIONES
            PRIMERA=$PALABRA
         elif [ $REPETICIONES -le $COMP_PRIMERO ] && [ $REPETICIONES -ge $COMP_SEGUNDO ]
            then
            COMP_SEGUNDO=$REPETICIONES
            SEGUNDA=$PALABRA
         elif [ $REPETICIONES -le $COMP_SEGUNDO ] && [ $REPETICIONES -gt $COMP_TERCERO ]
            then
            COMP_TERCERO=$REPETICIONES
            TERCERA=$PALABRA
         elif [ $REPETICIONES -le $COMP_TERCERO ] && [ $REPETICIONES -gt $COMP_CUARTO ]
            then
            COMP_CUARTO=$REPETICIONES
            CUARTA=$PALABRA
         elif [ $REPETICIONES -le $COMP_CUARTO ] && [ $REPETICIONES -gt $COMP_QUINTO ]
            then
            COMP_QUINTO=$REPETICIONES
            QUINTA=$PALABRA
         elif [ $REPETICIONES -le $COMP_QUINTO ] && [ $REPETICIONES -gt $COMP_SEXTO ]
            then
            COMP_SEXTO=$REPETICIONES
            SEXTA=$PALABRA
         elif [ $REPETICIONES -le $COMP_SEXTO ] && [ $REPETICIONES -gt $COMP_SEPTIMO ]
            then
            COMP_SEPTIMO=$REPETICIONES
            SEPTIMA=$PALABRA
         elif [ $REPETICIONES -le $COMP_SEPTIMO ] && [ $REPETICIONES -gt $COMP_OCTAVO ]
            then
            COMP_OCTAVO=$REPETICIONES
            OCTAVA=$PALABRA
         elif [ $REPETICIONES -le $COMP_OCTAVO ] && [ $REPETICIONES -gt $COMP_NOVENO ]
            then
            COMP_NOVENO=$REPETICIONES
            NOVENA=$PALABRA
         elif [ $REPETICIONES -le $COMP_NOVENO ] && [ $REPETICIONES -gt $COMP_DECIMO ]
            then
            COMP_DECIMO=$REPETICIONES
            DECIMA=$PALABRA
         else
            continue
        fi
      fi
    fi
  done  

echo TOP TEN PALABRAS MAS USADAS
echo la  palabra mas usada es :  $PRIMERA, con $COMP_PRIMERO repeticiones
echo la segunda  palabra mas usada es :  $SEGUNDA, con $COMP_SEGUNDO repeticiones
echo la tercer palabra mas usada es :  $TERCERA, con $COMP_TERCERO repeticiones
echo la cuarta palabra mas usada es :  $CUARTA, con $COMP_CUARTO repeticiones
echo la quinta palabra mas usada es :  $QUINTA, con $COMP_QUINTO repeticiones
echo la sexta palabra mas usada es :  $SEXTA, con $COMP_SEXTO repeticiones
echo la septima palabra mas usada es :  $SEPTIMA, con $COMP_SEPTIMO repeticiones
echo la octava palabra mas usada es :  $OCTAVA, con $COMP_OCTAVO repeticiones
echo la novena palabra mas usada es :  $NOVENA, con $COMP_NOVENO repeticiones
echo la decima palabra mas usada es :  $DECIMA, con $COMP_DECIMO repeticiones

fi


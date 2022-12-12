             
#!/bin/bash


PS3='Elija un script > '


select script in "SALIR" blankLinesCounter.sh findNames.sh statsSentences.sh  statsUsageWords.sh StatsWords.sh

  do
    
     case $REPLY in
       1)
       echo HASTA LUEGO
       break
       ;;
       [2-6])
       ./$script
       ;;
       *)
       echo OPCION INVALIDA
       ;;
     esac
  done

exit 0

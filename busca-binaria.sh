#!/bin/bash
INICIO=0
FIM=100000
ATUAL=$FIM
ESPERADO=132

while [[ $(( $INICIO+1 )) -lt $FIM ]]; do
  ATUAL=$(( $INICIO + ($FIM - $INICIO) / 2 ))
	echo
	echo "Inicio  ---> $INICIO"
	echo "Fim     ---> $FIM"
	echo "Atual   ---> $ATUAL"

	if [[ $ATUAL == $ESPERADO ]]; then
		echo "---------- Fim -----------"
    echo $ATUAL
    echo "---------- Fim -----------"
    exit
	elif [[ $ATUAL -lt $ESPERADO ]];  then
	  echo "-----------> $ATUAL < $ESPERADO"
		INICIO=$ATUAL
	else
	  echo "-----------> $ATUAL > $ESPERADO"
    FIM=$ATUAL
  fi
done

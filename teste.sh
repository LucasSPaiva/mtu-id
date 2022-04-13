#!/bin/bash
INICIO=1
FIM=65467
ATUAL=$FIM

while [[ $(( $INICIO+1 )) -lt $FIM ]]; do

  ATUAL=$(( $INICIO + ($FIM - $INICIO) / 2 ))

	echo
	echo "Inicio  ---> $INICIO"
	echo "Fim     ---> $FIM"
	echo "Atual   ---> $ATUAL"
	echo

#  Ip do lab
#  COMANDO="$(ping -nc 1 -M do -s $CURRENT -I 10.132.3.9 10.132.3.8 2> error.log | grep "packets transmitted," | awk '{print $6}')"

# ip do pc e do celular
  COMANDO=`ping -nc 1 -M do -s $CURRENT -I 172.30.145.175 192.168.0.106 2> error.log | grep "packets transmitted," | awk '{print $6}'`

	echo "Command: $COMANDO"
  
  if [ "$COMANDO" == "+1" ]; then
    FIM=$ATUAL
    echo "-----------> Houve perca de pacote"
  else
		INICIO=$ATUAL
	  echo "-----------> Não houve perca de pacote"
  fi
 
done

# Erros:
# - O Comando fica imprimindo vazio pelo programa, mas quando eu rodo o comando separado no terminal ele imprime o +1 ou o %0 
# - é criado um arquivo com o nome de error.log com a seguinte mensagem: 
#   ping: invalid argument: '-I'
# - como o COMANDO recebe uma string vazia acaba dando erro no programa inteiro

# tem que colocar para ler o ip de origem e o ip de destino como argumento de entrerdad do script
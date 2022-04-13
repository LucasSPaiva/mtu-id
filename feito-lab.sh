#!/bin/bash
MININTERVAL=1
MAXINTERVAL=65467
CURRENT=$MAXINTERVAL

while [ $(($MININTERVAL+1)) != $MAXINTERVAL ] 
do

	echo
	echo "MAX: $MAXINTERVAL"
	echo "MIN: $MININTERVAL"
	echo "CURRENT: $CURRENT"
	
	command="$(ping -nc 1 -M do -s $CURRENT -I 10.132.3.9 10.132.3.8 2> error.log | grep "packets transmitted," | awk '{print $6}')"
	echo "Command: $command"
	if [ "$command" == "+1" ]
	then
		MAXINTERVAL=$(($CURRENT))

		# verificar essa operação -------------------------
		CURRENT=$((($MAXINTERVAL-$MININTERVAL) / 2))
		# verificar essa operação -------------------------

		#CURRENT=$((($MININTERVAL-$MAXINTERVAL) / 2))
		echo "erro"
	else
		MININTERVAL=$(($CURRENT))
		CURRENT=$((($MININTERVAL+$MAXINTERVAL) / 2))
	  echo "pass"
	fi
done


echo "MTU -> $MININTERVAL"


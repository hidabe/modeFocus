#!/bin/bash

if [ -t 0 ]; then stty -echo -icanon -icrnl time 0 min 0; fi

now=`date +%s`

echo "Bloqueando Firefox, modo Focalizado activado. Presione x para Salir."
keypress=''

while [ "x$keypress" = "x" ]; do
	sleep 5
	pkill firefox
	keypress="`cat -v`"
done

if [ -t 0 ]; then stty sane; fi

finish=`date +%s`

diff=$(($finish-$now))
echo "$(($diff / 60)) minutos y $(($diff % 60)) segundos enfocado."

echo "Gracias por utilizar este Script."

exit 0

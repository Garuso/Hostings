#!/bin/bash

PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/bin:/sbin

export PATH


ESTADO=$(/sbin/dmraid -s | grep '^status' | awk -F: '{print $2 }' | sed 's/ //')


if [ $ESTADO != "ok" ];then
SALIDA=$(/sbin/dmraid -r)
SALIDA1="#######################\n"$(/sbin/dmraid -s )"\n#########################\n"$SALIDA
echo -ne "$SALIDA1" | mail -s "Error en RAID H7" eruiz@megalink.com  -c jcgalvez@megalink.com
fi

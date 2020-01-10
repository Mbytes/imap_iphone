#!/bin/bash
#

#Ajusta fecha de mensajes

#Control Numero parametros
if test $# -ne  1
then
        echo "ERROR FALTAN PARAMETROS"
        echo "$0 EMAIL"
        exit
fi

function VerFecha ()
{
    #Extraemos fecha
    FECHA=$(grep "^Date:" "$1" | head -1)

    echo "${FECHA}" | grep -q "^Date:"
    if test $? -eq 0
    then
        NFECHA=$(echo "${FECHA}" | sed -e 's/Date: //g') 

        #Cambiamos
        touch -d "$NFECHA" "$1"
    fi

} #EndFunction


#################
## PRINCIPAL
################

#Listamos cada fichero
MSG=$(find ${1}  -type f )


#Procesamos cada mensaje
while read -r LINE
do
    VerFecha "${LINE}"

  
done <<< "${MSG}"


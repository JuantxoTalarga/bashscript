#!/bin/bash
#Projecte2

if [[ $EUID -ne 0  ]]; then
        echo "Tienes que entrar con usuario sudo"
        exit 1
fi

function usage(){
  echo "Para utilizarlo de forma correcta pon: ./Projecte02 nombreusuario [comentarios] "
  exit 1
}

if [ -z "$1" ];then

  usage

fi
if [ -z "$2" ];then

  PASSWORD=`tr -cd '[:alnum:]' < /dev/urandom | fold -w30 | head -n1`

  useradd -p $PASSWORD $1

  echo "Usuario: "$1 "Contraseña: "$PASSWORD" NombredelHost: "$HOSTNAME


else

  PASSWORD=`tr -cd '[:alnum:]' < /dev/urandom | fold -w30 | head -n1`

  useradd -c $2 -p $PASSWORD $1

  echo "Usuario: "$1 "Contraseña: "$PASSWORD" NombredelHost: "$HOSTNAME

fi

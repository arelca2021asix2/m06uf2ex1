#!/bin/bash
if (( EUID != 0 ))
then
  echo "Aquest script s'ha d'executar amb prilegis de l'usuari root"
  exit 9 # He posat aquest número per assegurar-me que no coincideix amb cap altre valor de retorn
fi
clear
echo -n "donam el nom del grup: "
read nom_grup
echo -n "donam el nom del usuari: "
read nom_usuari
confirm
echo -n "confirma que el $nom_grup i $nom_usuari son correctes(prem 'y'): "
if (( $confirm == "y"))
	then
	usermod -a -G $nom_grup $nom_usuari
	exit 3
	else
	echo "nom usuari o grup no existents"
	exit 9
fi

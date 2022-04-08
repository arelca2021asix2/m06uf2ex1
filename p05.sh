#!/bin/bash
if (( EUID != 0 ))
then
  echo "Aquest script s'ha d'executar amb prilegis de l'usuari root"
  exit 9 # He posat aquest número per assegurar-me que no coincideix amb cap altre valor de retorn
fi

clear
echo -n "nom del paquet de software que vols instalar: "
read paquet
aptitude install -y $paquet
echo "Paquet instal·lat"
echo "Vols continuar?(per a continuar prem '1')"
read continuar
if (( $continuar == 1))
	then
		./p05.sh
	else
		exit 20
fi


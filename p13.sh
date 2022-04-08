#!/bin/bash
if (( EUID != 0 ))
then
  echo "Aquest script s'ha d'executar amb prilegis de l'usuari root"
  exit 9 # He posat aquest número per assegurar-me que no coincideix amb cap altre valor de retorn
fi
clear
echo "instal·lant pwgen per a generar passwrd dels usuaris"
aptitude install -y pwgen

echo -n "nom base per a la creacio dels usuaris: "
read nom_base

echo -n "numero de usuaris a crear"
read n_usr

for (( num=1; num<=$n_usr; num++ )) 
do
	ctsnya=$(pwgen 8 1)
	nom_usr=$nom_base$num@fje
	echo "$nom_usr i $ctsnya"  >> nombase.txt #tenir en la mateixa carpeta el fitxer
done

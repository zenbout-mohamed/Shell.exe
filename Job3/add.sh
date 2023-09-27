#!/bin/bash


#!/bin/bash

# Demander à l'utilisateur d'entrer les deux nombres
read -p "Entrez le premier nombre : " nombre1
read -p "Entrez le deuxième nombre : " nombre2

# Effectuer l'addition
somme=$((nombre1 + nombre2))

# Afficher le résultat
echo "La somme de $nombre1 et $nombre2 est : $somme"


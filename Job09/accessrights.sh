#!/bin/bash

# Nom du fichier CSV contenant les informations des utilisateurs
CSV_FILE="\wsl.localhost\Ubuntu\home\mohamed\Shell.exe\Job9\Shell_Userlist.csv"

# Vérifier si le fichier CSV existe
if [ -f "$CSV_FILE" ]; then
	echo "Le fichier existe."
else
	echo "le fichier n'existe pas ."
  # Lire le fichier CSV ligne par ligne
  while IFS=',' read -r nom prenom role; do
    # Vérifier si l'utilisateur existe déjà
    if id "$nom" &>/dev/null; then
      echo "L'utilisateur $nom existe déjà."
    else
      # Créer l'utilisateur avec le nom, le prénom et les autorisations spécifiées
      useradd -m -c "$prenom $nom" "$nom"
      echo "L'utilisateur $nom a été créé."
    fi
  done < "$CSV_FILE"
else
  echo "Le fichier CSV $CSV_FILE n'existe pas."
fi

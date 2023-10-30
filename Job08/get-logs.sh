#!/usr/bin/bash

# Nom d'utilisateur pour lequel vous souhaitez extraire les connexionsusername="mohamed"


# Chemin vers le répertoire de sauvegarde
backup_dir=~/\\wsl.localhost\Ubuntu\home\mohamed\Shell.exe\Job8


# Obtenir le nombre de connexions pour l'utilisateur
user_logs=$(grep "$username" /var/log/auth.log)
connection_count=$(echo "$user_logs" | awk '/sshd/ && /Accepted/ {print $1}' | sort | uniq -c | wc -l)

# Obtenir la date au format jj-mm-aaaa-HH:MM
current_date=$(date +'%d-%m-%Y-%H-%M')

# Créez un fichier avec le nombre de connexions et la date
filename="number_connection-$current_date"
echo "$connection_count" > "$filename"

# Archivez le fichier
tar -cf "$filename.tar" "$filename"

mv "$filename.tar" "$backup_dir"

echo "Le nombre de connexions de l'utilisateur $username a été enregistré dans $backup_dir/$filename.tar"



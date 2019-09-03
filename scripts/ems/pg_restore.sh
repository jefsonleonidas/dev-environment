#!/bin/bash
clear

echo "Backps disponíveis:"
echo
echo
ls /home/ems/Backups

echo
echo
echo "Informe o backup a ser restaurado:"
read BACKUP

echo "Nome da base:"
read BASE

PATH_BK="/home/ems/Backups/$BACKUP"

echo $PATH_BK
echo $BASE

/usr/bin/pg_restore --host localhost --port 5432 --username "postgres" --dbname "$BASE" --no-password  --verbose "$PATH_BK"

#!/bin/bash

#cleanup
cd $HOME/Furukawa/dev/workspace-gp/profilemanager/backend/docker/mariadb-development/scripts/;

export MYSQL_ROOT_PASSWORD=Cryk7OnPalv;
export DB_PASSWORD=RocDokedLuj5;

echo "Limpando Base"
./drop_planrepository.sh
echo "Criando Base"
./create_planrepository.sh









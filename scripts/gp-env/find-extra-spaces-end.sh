#!/bin/bash

cd /home/jefson/Furukawa/dev/workspace-gp/profilemanager/backend/fkcp-planrepository/fkcp-planrepository-service/src/main/resources/template/gpon/G4S_G8S_G2500/G4xxbPoexx



for x in *.twig; do 
 
  aux=`cat $x | grep [[:space:]]$`
  echo $PWD/$x
  echo "***" $aux
  echo " "
  
done

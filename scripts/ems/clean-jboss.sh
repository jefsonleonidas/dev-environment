#!/bin/bash

WORKSPACE="/home/jefson/Furukawa/dev/workspace-ems/software"

clear

date
echo "Limpando TMP....."
rm -rf /opt/jboss/standalone/tmp/*
echo "Limpando DEPLOYMENTS....."
rm -rf /opt/jboss/standalone/deployments/*
echo "Copiando WAR....."
cp $WORKSPACE/EMS/main/modules/presentation/target/ems.war /opt/jboss/standalone/deployments/
cp $WORKSPACE/util/api-fibermesh/target/api-fibermesh.war /opt/jboss/standalone/deployments/

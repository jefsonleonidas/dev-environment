#!/bin/bash

clear

WORKSPACE="/home/jefson/workspace-ems/ConsciusEMS"
SW_PATH=$WORKSPACE/software
UPDATE_CS=$WORKSPACE/update.cs
UPDATE_DIR=$WORKSPACE/update
EMS_VERSION="260"

INSTALLER_DIR=$WORKSPACE/Instalador
INSTALLER_ZIP=$WORKSPACE/Instalador.zip

UPDATE_TO_DIR=$WORKSPACE/software/util/SystemUpdate/update_to_$EMS_VERSION

if [ -f "$UPDATE_CS" ]; then
   rm -rf $UPDATE_CS
fi

if [ -d "$UPDATE_DIR" ]; then
   rm -rf $UPDATE_DIR
fi

if [ ! -d "$UPDATE_TO_DIR" ]; then
   mkdir $UPDATE_TO_DIR
fi

mkdir $UPDATE_DIR

cp $WORKSPACE/software/EMS/main/modules/presentation/target/ems.war $UPDATE_TO_DIR
cp $UPDATE_TO_DIR/* $UPDATE_DIR

chmod 777 -R $UPDATE_DIR/*

cd $WORKSPACE
tar -zcvf update.tar.gz update/
mv update.tar.gz update.cs
rm -rf update/


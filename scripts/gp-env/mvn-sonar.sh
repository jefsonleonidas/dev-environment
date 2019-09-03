#!/bin/bash

clear

BACKEND=/home/jefson/Furukawa/dev/workspace-gp/profilemanager/backend
COMMAND='mvn clean package sonar:sonar'

########## fkcp-commons ##########

cd $BACKEND/fkcp-commons
$COMMAND

cd $BACKEND/fkcp-commons/fkcp-common
$COMMAND

cd $BACKEND/fkcp-commons/fkcp-edge-service
$COMMAND

cd $BACKEND/fkcp-commons/fkcp-eureka-server
$COMMAND

cd $BACKEND/fkcp-commons/fkcp-file-server
$COMMAND

cd $BACKEND/fkcp-commons/fkcp-frontend-service
$COMMAND

cd $BACKEND/fkcp-commons/fkcp-mgmt-service
$COMMAND

cd $BACKEND/fkcp-commons/fkcp-tests-common
$COMMAND

cd $BACKEND/fkcp-commons/fkcp-xml-mapping
$COMMAND


########## fkcp-snmp ##########

cd $BACKEND/fkcp-snmp
$COMMAND

cd $BACKEND/fkcp-snmp/fkcp-snmp-api
$COMMAND

cd $BACKEND/fkcp-snmp/fkcp-snmp-lib
$COMMAND

cd $BACKEND/fkcp-snmp/fkcp-snmp-mibs
$COMMAND


########## fkcp-device ##########

cd $BACKEND/fkcp-device
$COMMAND

cd $BACKEND/fkcp-device/fkcp-device-api
$COMMAND

cd $BACKEND/fkcp-device/fkcp-device-common
$COMMAND

cd $BACKEND/fkcp-device/fkcp-device-mock
$COMMAND

cd $BACKEND/fkcp-device/fkcp-device-service
$COMMAND

cd $BACKEND/fkcp-device/fkcp-device-test
$COMMAND


########## fkcp-planrepository ##########

cd $BACKEND/fkcp-device
$COMMAND

cd $BACKEND/fkcp-planrepository/fkcp-planrepository-api
$COMMAND

cd $BACKEND/fkcp-planrepository/fkcp-planrepository-ddl-helper
$COMMAND

cd $BACKEND/fkcp-planrepository/fkcp-planrepository-service
$COMMAND



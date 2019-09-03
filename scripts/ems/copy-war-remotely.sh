#!/bin/bash

clear

WAR_PATH="/home/ems/Furukawa/workspace/software/EMS/main/modules/presentation/target/ems.war"

echo "Enter server ip:"
read SERVER_IP

echo "User:"
read USER

scp $WAR_PATH $USER@$SERVER_IP:/opt/jboss/standalone/deployments/

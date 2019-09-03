#!/bin/bash

clear

docker stop fkcp-idmgr
docker rm fkcp-idmgr

#docker stop fkcp-db
#docker rm fkcp-db

docker stop fkcp-broker
docker rm fkcp-broker
docker volume prune

#-------------------------------------------------------------------#
docker run --name fkcp-idmgr \
             --hostname fkcp-idmgr \
             --network=host \
             --env MYSQL_PORT_3306_TCP_ADDR=172.17.0.1 \
             --env MYSQL_PORT_3306_TCP_PORT=3306 \
             --env MYSQL_DATABASE=fkcp_db_keycloak \
             --env MYSQL_USER=fkcp_keycloak \
             --env MYSQL_PASSWORD=Ev6Keerjobee \
             --env KEYCLOAK_USER=admin \
             --env KEYCLOAK_PASSWORD=Gewyoofvu \
             --env PROXY_ADDRESS_FORWARDING=true \
             -P -d jboss/keycloak:3.4.3.Final

#-------------------------------------------------------------------#
docker run --name fkcp-broker \
             --hostname fkcp-broker \
             --network=host \
             --env ACTIVEMQ_CONFIG_MINMEMORY=128 \
             --env ACTIVEMQ_CONFIG_MAXMEMORY=2048 \
             --env ACTIVEMQ_CONFIG_STOREUSAGE=1G \
             --env ACTIVEMQ_CONFIG_TEMPUSAGE=512M \
             --env ACTIVEMQ_CONFIG_SCHEDULERENABLED=true \
             --env ACTIVEMQ_CONFIG_NAME=fkcp-broker \
             --env ACTIVEMQ_CONFIG_DEFAULTACCOUNT=false \
             --env ACTIVEMQ_ADMIN_LOGIN=admin \
             --env ACTIVEMQ_ADMIN_PASSWORD=haptOmanVa \
             --env ACTIVEMQ_USERS_fkcpplan=rouljufUnk \
             --env ACTIVEMQ_USERS_fkcpdev=MiedVukIo \
             --env ACTIVEMQ_GROUPS_writes=fkcpplan,fkcpdev \
             --env ACTIVEMQ_GROUPS_reads=fkcpplan,fkcpdev \
             -d webcenter/activemq:5.14.3


docker container start fkcp-db fkcp-idmgr fkcp-broker
docker container start fkcp-idmgr
docker container start fkcp-broker

docker container ls

sleep 5

docker exec -it fkcp-idmgr /bin/bash -c "TERM=$TERM exec bash -l"

#!/bin/bash

case $1 in
laserway)
	docker stop $(docker ps -aq);
	docker start fkcp-fluentd fkcp-broker fkcp-idmgr fkcp-db fkcp-zipkin-server;
;;
gp)
	docker stop $(docker ps -aq);
	docker start fkcp-db fkcp-idmgr fkcp-broker fkcp-file-server;
;;
stop)
	docker stop $(docker ps -aq);
;;
recreategp)

	#cleanup
	docker stop $(docker ps -aq);
	docker rm $(docker ps -aq);
	docker system prune -f;

	cd $HOME/Furukawa/dev/workspace-gp/profilemanager/backend;
	cd docker/mariadb-development/scripts;

	#create db
	docker run --name fkcp-db --hostname fkcp-db --network=host --env MYSQL_ROOT_PASSWORD=Cryk7OnPalv -P -d mariadb:10.2.12;

	sleep 30;
	export MYSQL_ROOT_PASSWORD=Cryk7OnPalv;
	export DB_PASSWORD=RocDokedLuj5;
	./create_planrepository.sh

	export DB_PASSWORD=Ev6Keerjobee;
	./create_keycloak.sh

	docker run --name fkcp-idmgr --hostname fkcp-idmgr --network=host --env MYSQL_PORT_3306_TCP_ADDR=172.17.0.1 --env MYSQL_PORT_3306_TCP_PORT=3306 --env MYSQL_DATABASE=fkcp_db_keycloak --env MYSQL_USER=fkcp_keycloak --env MYSQL_PASSWORD=Ev6Keerjobee --env KEYCLOAK_USER=admin --env KEYCLOAK_PASSWORD=Gewyoofvu --env PROXY_ADDRESS_FORWARDING=true -P -d jboss/keycloak:3.4.3.Final;
    ### WAIT THE SERVICE BE AVAILABLE ###
    sleep 30

    #docker exec fkcp-idmgr /bin/bash -c "TERM=$TERM exec bash -l"

    ### RUN INSIDE THE DOCKER CONTAINER ###

    KCADM="docker exec -i fkcp-idmgr /opt/jboss/keycloak/bin/kcadm.sh"

    #----
    ${KCADM} config credentials --server http://localhost:8080/auth --realm master --user admin --password Gewyoofvu
    #----
    ${KCADM} create realms -s realm=fkcp-security -s enabled=true
    #----
    CLIENT_ID=$(${KCADM} create clients -i -r fkcp-security -s clientId=fkcp-app -s standardFlowEnabled=true -s directAccessGrantsEnabled=true -s publicClient=true -s redirectUris[0]='*' -s baseUrl='/*' -s enabled=true)
    #----
    ${KCADM} create roles -r fkcp-security -s name=user -s 'description=User role'
    ${KCADM} create roles -r fkcp-security -s name=system -s 'description=System role'
    #----
    ID_USER=$(${KCADM} create users -i -r fkcp-security -s username=fkcp_user -s enabled=true)
    ${KCADM} update users/${ID_USER}/reset-password -r fkcp-security -s type=password -s value=WevKacikza -s temporary=false -n
    ${KCADM} add-roles -r fkcp-security --uusername=fkcp_user --rolename user
    ID_SYSTEM=$(${KCADM} create users -i -r fkcp-security -s username=fkcp_system -s enabled=true)
    ${KCADM} update users/${ID_SYSTEM}/reset-password -r fkcp-security -s type=password -s value=barIaf0Owuj -s temporary=false -n
    ${KCADM} add-roles -r fkcp-security --uusername=fkcp_system --rolename system
    
    docker run --name fkcp-broker --hostname fkcp-broker --network=host --env ACTIVEMQ_CONFIG_MINMEMORY=128 --env ACTIVEMQ_CONFIG_MAXMEMORY=2048 --env ACTIVEMQ_CONFIG_STOREUSAGE=1G --env ACTIVEMQ_CONFIG_TEMPUSAGE=512M --env ACTIVEMQ_CONFIG_SCHEDULERENABLED=true --env ACTIVEMQ_CONFIG_NAME=fkcp-broker --env ACTIVEMQ_ADMIN_LOGIN=admin --env ACTIVEMQ_ADMIN_PASSWORD=admin --env ACTIVEMQ_USERS_fkcpdev=fkcpdev-broker-pass --env ACTIVEMQ_GROUPS_writes=fkcpdev --env ACTIVEMQ_GROUPS_reads=fkcpdev -d webcenter/activemq:5.14.3

    export CONTAINER_FILESERVER=fkcp-file-server
    export FILESERVER_SCP_USER=fkcp
    export FILESERVER_SCP_PASS=Cryk7OnPalv
    export PRODUCT_VENDOR="furukawalatam"
    export PRODUCT_NAME="profilemanager"
    export VOLUME_ROOT="/var/lib/${PRODUCT_VENDOR}/${PRODUCT_NAME}"
    export VOLUME_FILESERVER="${VOLUME_ROOT}/${CONTAINER_FILESERVER}/data"
    #export VERSION="2.0.0-SNAPSHOT-222"
    export VERSION="2.0.0-SNAPSHOT"

    echo "* Starting filed server..."
    docker run --name ${CONTAINER_FILESERVER} \
        --hostname ${CONTAINER_FILESERVER} \
        --network=host \
        --volume "${VOLUME_FILESERVER}:/data" \
        --env FILE_SERVER_SCP_USER="${FILESERVER_SCP_USER}" \
        --env FILE_SERVER_SCP_PASS="${FILESERVER_SCP_PASS}" \
        -p 8022:8022 \
        -p 69:69/udp \
        -d furukawalatam/${CONTAINER_FILESERVER}:${VERSION} 1>/dev/null
;;
esac

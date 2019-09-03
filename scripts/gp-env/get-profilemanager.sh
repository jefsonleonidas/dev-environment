#!/bin/bash

clear

TAG_VERSION=develop
VERSION=develop
BASE_URL=ssh://jefson.leonidas@10.80.42.118:29418/BR/DES/Software
WORKSPACE=/home/jefson/Furukawa/dev/workspace-gp

mkdir profilemanager
cd profilemanager

git clone -o furukawa -b 3.4.1-fel $BASE_URL/ProfileManager/external/keycloak keycloak
pushd keycloak
mvn clean install -Dmaven.test.skip=true -pl :keycloak-parent,:keycloak-core,:keycloak-adapter-core
popd

git clone -o furukawa -b fel-1.0.3 $BASE_URL/ProfileManager/external/feign-annotation-error-decoder feign-annotation-error-decoder
pushd feign-annotation-error-decoder
mvn clean install -Dmaven.test.skip=true
popd

git clone -o furukawa -b fel-1 $BASE_URL/ProfileManager/external/spring-cloud-netflix-core spring-cloud-netflix
pushd spring-cloud-netflix
mvn clean install -Dmaven.test.skip.exec=true -pl :spring-cloud-netflix-core -am
popd

git clone -o furukawa -b $TAG_VERSION $BASE_URL/ProfileManager/ProfileManager-Internal-Back backend

pushd backend
mvn clean install -Dmaven.test.skip.exec=true -Ddockerfile.skip -pl '!fkcp-commons/fkcp-frontend-service,!fkcp-docker'
popd

mkdir ~/env/builds/$VERSION
cd ~/env/builds/$VERSION

cd ~/env/builds/$VERSION
ls -lash ~/env/builds/$VERSION/furukawalatam.profilemanager*

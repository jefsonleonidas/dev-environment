#!/bin/bash

clear

chmod 777 /opt/jboss/standalone/deployments/ems.war

CHK_SUM=`md5sum /opt/jboss/standalone/deployments/ems.war | cut -d '/' -f 1`

echo "CHK_SUM = $CHK_SUM" 

mkdir $CHK_SUM

cd $CHK_SUM

mkdir update

cp ../update.sh update/

cp /opt/jboss/standalone/deployments/ems.war update/

chmod 777 -R ./

tar -zcvf update.tar.gz update

mv update.tar.gz update.cs

chmod 777 update.cs

rm -rf update/

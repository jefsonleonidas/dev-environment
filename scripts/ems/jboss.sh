#!/bin/bash

sudo /opt/jboss/bin/standalone.sh -Dhornetq.server-id=1 -Dasga.tms.security.keystore.alias=server-node-1-key -Djboss.bind.address=192.168.250.205 -b 192.168.250.205 -Djboss.web.https.port=80 
#sudo /opt/jboss/bin/standalone.sh

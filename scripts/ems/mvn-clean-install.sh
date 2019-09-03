#!/bin/bash

clear

export HOME_DIRECTORY="/home/jefson/Furukawa/dev/workspace-ems/ConsciusEMS"
export COMANDO='mvn clean install -U -Dmaven.test.skip=true -DskipTests -Dhttps.protocols=TLSv1,TLSv1.1,TLSv1.2'
export PACK_COMMAND='mvn package -Dmaven.test.skip=true -Dpackage.terminal=true -Dtms.system.context=dev -Dsystem.mode=product -Dadd.all.equipments=true'

#rm -rf ~/.m2/ems/repository/
#rm -rf $HOME_DIRECTORY
#cd /home/jefson/Furukawa/dev/workspace-ems/tmp/

#git clone --single-branch --branch develop ssh://jefson.leonidas@10.80.42.118:29418/BR/DES/Software/ConsciusEMS

#COMANDO='mvn eclipse:clean'

STOP_JBOSS='sudo kill -9 `pgrep -f jboss`'

BUILD='$COMANDO; $PACK_COMMAND; rm -rf /opt/jboss/standalone/deployments/ems.war*; sudo rm -rf /opt/jboss/standalone/tmp/*;cp $HOME_DIRECTORY/software/EMS/main/modules/presentation/target/ems.war /opt/jboss/standalone/deployments/; sudo /etc/init.d/asga_ems_startup_ubuntu.sh start'

cd $HOME_DIRECTORY/software/EMS
$COMANDO

cd $HOME_DIRECTORY/software/EMS/main
$COMANDO

cd $HOME_DIRECTORY/software/util/asga_util
$COMANDO

cd $HOME_DIRECTORY/software/util/asga_cdi
$COMANDO

cd $HOME_DIRECTORY/software/util/snmp_communicator
$COMANDO

cd $HOME_DIRECTORY/software/util/tms_report
$COMANDO

cd $HOME_DIRECTORY/software/util/data_context_verifier
$COMANDO

cd $HOME_DIRECTORY/software/EMS/libs/asga_hornetq
$COMANDO

cd $HOME_DIRECTORY/software/EMS/infra_structure
$COMANDO

cd $HOME_DIRECTORY/software/EMS/main/system_modes/common_mode
$COMANDO

cd $HOME_DIRECTORY/software/EMS/main/system_modes/product_mode
$COMANDO

cd $HOME_DIRECTORY/software/EMS/main/modules/terminal
$COMANDO

cd $HOME_DIRECTORY/software/EMS/main/test/base_test
$COMANDO

cd $HOME_DIRECTORY/software/EMS/probe
$COMANDO

cd $HOME_DIRECTORY/software/EMS/probe/modules/core
$COMANDO

cd $HOME_DIRECTORY/software/EMS/probe/modules/web
$COMANDO

cd $HOME_DIRECTORY/software/EMS/main/system_modes/service_mode
$COMANDO

cd $HOME_DIRECTORY/software/EMS/main/test/integration_tests
$COMANDO




cd $HOME_DIRECTORY/software/EMS/main/modules/application
$COMANDO

cd $HOME_DIRECTORY/software/EMS/main/test/test_helper
$COMANDO

cd $HOME_DIRECTORY/software/EMS/main/test/jbehave_tests
$COMANDO

cd $HOME_DIRECTORY/software/EMS/drivers/administrator
$COMANDO





cd $HOME_DIRECTORY/software/EMS/equipments/gpon
$COMANDO

cd $HOME_DIRECTORY/software/EMS/equipments/gpon/gpon_domain
$COMANDO

cd $HOME_DIRECTORY/software/EMS/main/modules/domain
$COMANDO

cd $HOME_DIRECTORY/software/EMS/equipments/gpon/gpon_presentation
$COMANDO

cd $HOME_DIRECTORY/software/EMS/equipments/radio
$COMANDO

cd $HOME_DIRECTORY/software/EMS/equipments/radio/radio-domain
$COMANDO

cd $HOME_DIRECTORY/software/EMS/equipments/radio/radio-presentation
$COMANDO

cd $HOME_DIRECTORY/software/EMS/equipments/radio-3d
$COMANDO

cd $HOME_DIRECTORY/software/EMS/equipments/radio-3d/radio-3d-domain
$COMANDO

cd $HOME_DIRECTORY/software/EMS/equipments/radio-3d/radio-3d-presentation
$COMANDO

cd $HOME_DIRECTORY/software/EMS/equipments/fibermesh
$COMANDO

cd $HOME_DIRECTORY/software/EMS/equipments/fibermesh/fibermesh-domain
$COMANDO

cd $HOME_DIRECTORY/software/EMS/equipments/fibermesh/fibermesh-presentation
$COMANDO

cd $HOME_DIRECTORY/software/util/snmp_information
$COMANDO

cd $HOME_DIRECTORY/software/util/snmp-resend
$COMANDO

cd $HOME_DIRECTORY/software/EMS/sanity/main
$COMANDO

cd $HOME_DIRECTORY/software/EMS/main/modules/presentation
$COMANDO

cd $HOME_DIRECTORY/software/EMS/main
$COMANDO
$PACK_COMMAND


#cp $HOME_DIRECTORY/software/EMS/main/modules/presentation/target/ems.war /opt/jboss/standalone/deployments/

#scp $HOME_DIRECTORY/software/EMS/main/modules/presentation/target/ems.war ems@10.80.42.120:/opt/jboss/standalone/deployments


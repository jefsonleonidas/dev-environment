#!/bin/bash

export JAVA_HOME="/opt/java/jdk/jdk1.7.0_79"
export MAVEN_HOME="/opt/maven/maven/apache-maven-3.2.2"
export MAVEN_BIN="/opt/maven/maven/apache-maven-3.2.2/bin"
export PATH=$PATH:$JAVA_HOME:$MAVEN_HOME:$MAVEN_BIN

clear

WORKSPACE="/home/ems/Furukawa/workspace/software"
#WORKSPACE="/home/ems/Furukawa/workspace-232/software"

COMANDO='mvn clean compile install -U -Dmaven.test.skip=true'
COMANDO_MPACK='mvn package -Dmaven.test.skip=true -Dpackage.terminal=true -Dtms.system.context=dev -Dsystem.mode=product -Dadd.all.equipments=true -Dtest.helper=true'

cd $WORKSPACE/EMS
$COMANDO

cd $WORKSPACE/util/asga_util
$COMANDO

cd $WORKSPACE/util/asga_cdi
$COMANDO

cd $WORKSPACE/util/data_context_verifier
$COMANDO

cd $WORKSPACE/EMS/main/modules/domain
$COMANDO

cd $WORKSPACE/EMS/infra_structure
$COMANDO

cd $WORKSPACE/EMS/main/test/base_test
$COMANDO

cd $WORKSPACE/EMS/main/modules/terminal
$COMANDO

cd $WORKSPACE/EMS/main/modules/application
$COMANDO

cd $WORKSPACE/EMS/main/modules/presentation
$COMANDO

cd $WORKSPACE/EMS/main/system_modes/product_mode
$COMANDO

cd $WORKSPACE/EMS/main/system_modes/common_mode
$COMANDO

cd $WORKSPACE/EMS/probe/modules/core
$COMANDO

cd $WORKSPACE/EMS/libs/asga_hornetq
$COMANDO

cd $WORKSPACE/EMS/drivers/administrator
$COMANDO

cd $WORKSPACE/EMS/probe
$COMANDO

cd $WORKSPACE/EMS
$COMANDO

cd $WORKSPACE/EMS/main/test/integration_tests
$COMANDO

cd $WORKSPACE/EMS/probe/modules/web
$COMANDO

cd $WORKSPACE/util/snmp_communicator
$COMANDO

cd $WORKSPACE/EMS/main/test/test_helper
$COMANDO

cd $WORKSPACE/EMS/equipments/gpon/gpon_domain
$COMANDO

cd $WORKSPACE/EMS/equipments/gpon/gpon_presentation
$COMANDO

cd $WORKSPACE/EMS/equipments/gpon
$COMANDO

cd $WORKSPACE/EMS/equipments/radio/radio-domain
$COMANDO

cd $WORKSPACE/EMS/equipments/radio/radio-presentation
$COMANDO

cd $WORKSPACE/EMS/equipments/radio
$COMANDO

cd $WORKSPACE/EMS/equipments/radio-3d/radio-3d-domain
$COMANDO

cd $WORKSPACE/EMS/equipments/radio-3d/radio-3d-presentation
$COMANDO

cd $WORKSPACE/EMS/equipments/radio-3d
$COMANDO

cd $WORKSPACE/EMS/equipments/radio-3d/fibermesh-domain
$COMANDO

cd $WORKSPACE/EMS/equipments/radio-3d/fibermesh-presentation
$COMANDO

cd $WORKSPACE/EMS/equipments/fibermesh
$COMANDO

cd $WORKSPACE/util/tms_report
$COMANDO

cd $WORKSPACE/EMS/main
$COMANDO

cd $WORKSPACE/EMS/main
$COMANDO_MPACK

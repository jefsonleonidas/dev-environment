#!/bin/bash

clear

export HOME_DIRECTORY="/home/jefson/workspace-ems/ConsciusEMS"

export COMANDO='mvn clean install -U -Dmaven.test.skip=true -DskipTests -Dhttps.protocols=TLSv1,TLSv1.1,TLSv1.2'

export PACK_COMMAND='mvn package -Dmaven.test.skip=true -Dpackage.terminal=true -Dtms.system.context=dev -Dsystem.mode=product -Dadd.all.equipments=true'


cd $HOME_DIRECTORY/software/EMS
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

cd $HOME_DIRECTORY/software/EMS/probe
$COMANDO

cd $HOME_DIRECTORY/software/EMS/probe/modules/core
$COMANDO

cd $HOME_DIRECTORY/software/EMS/probe/modules/web
$COMANDO

cd $HOME_DIRECTORY/software/EMS/main/system_modes/service_mode
$COMANDO

cd $HOME_DIRECTORY/software/EMS/main/test/base_test
$COMANDO

cd $HOME_DIRECTORY/software/EMS/main/test/integration_tests
$COMANDO

cd $HOME_DIRECTORY/software/EMS/main/test/integration_tests_refactored
$COMANDO

cd $HOME_DIRECTORY/software/EMS/main/test/jbehave_tests
$COMANDO

cd $HOME_DIRECTORY/software/EMS/main/test/fakesnmpagents
$COMANDO

cd $HOME_DIRECTORY/software/EMS/main/test/test_mocks
$COMANDO

cd $HOME_DIRECTORY/software/EMS/main/test/test_helper
$COMANDO

cd $HOME_DIRECTORY/software/EMS/sanity/main
$COMANDO

cd $HOME_DIRECTORY/software/util/SystemRecovery
$COMANDO

cd $HOME_DIRECTORY/software/EMS/main/modules/application
$COMANDO

cd $HOME_DIRECTORY/software/EMS/main/modules/domain
$COMANDO

cd $HOME_DIRECTORY/software/EMS/main/modules/presentation
$COMANDO

cd $HOME_DIRECTORY/software/util/snmp_information
$COMANDO

cd $HOME_DIRECTORY/software/util/snmp-resend
$COMANDO

cd $HOME_DIRECTORY/software/EMS/main
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

cd $HOME_DIRECTORY/software/EMS/equipments/radio
$COMANDO

cd $HOME_DIRECTORY/software/EMS/equipments/radio/radio-domain
$COMANDO

cd $HOME_DIRECTORY/software/EMS/equipments/radio/radio-presentation
$COMANDO

cd $HOME_DIRECTORY/software/EMS/equipments/16ng
$COMANDO

cd $HOME_DIRECTORY/software/EMS/equipments/16ng/16ng-domain
$COMANDO

cd $HOME_DIRECTORY/software/EMS/equipments/16ng/16ng-presentation
$COMANDO

cd $HOME_DIRECTORY/software/EMS/equipments/gpon
$COMANDO

cd $HOME_DIRECTORY/software/EMS/equipments/gpon/gpon_domain
$COMANDO

cd $HOME_DIRECTORY/software/EMS/equipments/gpon/gpon_presentation
$COMANDO

cd $HOME_DIRECTORY/software/EMS/installer
$COMANDO

cd $HOME_DIRECTORY/software/EMS/deployer
$COMANDO

cd $HOME_DIRECTORY/software/EMS/drivers/xml_alarms_generator
$COMANDO

cd $HOME_DIRECTORY/software/EMS/drivers/administrator
$COMANDO

cd $HOME_DIRECTORY/software/util/asga-topology
$COMANDO

cd $HOME_DIRECTORY/software/util/api-fibermesh
$COMANDO

cd $HOME_DIRECTORY/software/util/asga_profiler/client
$COMANDO

cd $HOME_DIRECTORY/software/util/asga_profiler/agent
$COMANDO

cd $HOME_DIRECTORY/software/util/simulate_agents
$COMANDO

cd $HOME_DIRECTORY/software/util/snmp_agents
$COMANDO

cd $HOME_DIRECTORY/software/util/system_monitor
$COMANDO

cd $HOME_DIRECTORY/software/EMS/main
$COMANDO

#!/bin/bash
workspace=/home/jefson/workspace-ems/ConsciusEMS
diretorioLog=/home/jefson/workspace-ems/log-build
projetoBuild=""

if [ ! -d "$diretorioLog" ]; then
	echo "#### criando diretório $diretorioLog"
	mkdir $diretorioLog
fi

rm $diretorioLog/*

function valida_log_projeto () {
	if [ $(grep -c "BUILD FAILURE" $diretorioLog/$1.log) -ne 0 ]; then
		echo "********* Erro ao realizar o build do projeto $1 **********"
		cat $diretorioLog/$1.log
		exit 0
	fi	
}


echo "###########################"
echo "### Build Porjetos Util ###"
echo "###########################"

projetoBuild="asga_cdi"
echo "#### realizando build do projeto $projetoBuild ##########"
cd $workspace/software/util/asga_cdi/
mvn clean install -Dmaven.test.skip=true > $diretorioLog/$projetoBuild.log
valida_log_projeto $projetoBuild

projetoBuild="asga_util"
echo "#### realizando build do projeto $projetoBuild ##########"
cd $workspace/software/util/asga_util/
mvn clean install -Dmaven.test.skip=true > $diretorioLog/$projetoBuild.log
valida_log_projeto $projetoBuild

projetoBuild="SystemRecovery"
echo "#### realizando build do projeto $projetoBuild ##########"
cd $workspace/software/util/SystemRecovery/
mvn clean install -Dmaven.test.skip=true > $diretorioLog/$projetoBuild.log
valida_log_projeto $projetoBuild

projetoBuild="snmp_communicator"
echo "#### realizando build do projeto $projetoBuild ##########"
cd $workspace/software/util/snmp_communicator/
mvn clean install -Dmaven.test.skip=true > $diretorioLog/$projetoBuild.log
valida_log_projeto $projetoBuild

projetoBuild="tms_report"
echo "#### realizando build do projeto $projetoBuild ##########"
cd $workspace/software/util/tms_report/
mvn clean install -Dmaven.test.skip=true > $diretorioLog/$projetoBuild.log
valida_log_projeto $projetoBuild

projetoBuild="data_context_verifier"
echo "#### realizando build do projeto $projetoBuild ##########"
cd $workspace/software/util/data_context_verifier/
mvn clean install -Dmaven.test.skip=true > $diretorioLog/$projetoBuild.log
valida_log_projeto $projetoBuild


echo "##########################"
echo "### Build Porjetos EMS ###"
echo "##########################"

projetoBuild="asga_hornetq"
echo "#### realizando build do projeto $projetoBuild ##########"
cd $workspace/software/EMS/libs/asga_hornetq/
mvn clean install -Dmaven.test.skip=true > $diretorioLog/$projetoBuild.log
valida_log_projeto $projetoBuild

projetoBuild="TMS-InfraStructure"
echo "#### realizando build do projeto $projetoBuild ##########"
cd $workspace/software/EMS/infra_structure/
mvn clean install -Dmaven.test.skip=true > $diretorioLog/$projetoBuild.log
valida_log_projeto $projetoBuild

projetoBuild="CommonMode"
echo "#### realizando build do projeto $projetoBuild ##########"
cd $workspace/software/EMS/main/system_modes/common_mode/
mvn clean install -Dmaven.test.skip=true > $diretorioLog/$projetoBuild.log
valida_log_projeto $projetoBuild

projetoBuild="ProductMode"
echo "#### realizando build do projeto $projetoBuild ##########"
cd $workspace/software/EMS/main/system_modes/product_mode/
mvn clean install -Dmaven.test.skip=true > $diretorioLog/$projetoBuild.log
valida_log_projeto $projetoBuild

projetoBuild="EnterpriseTMS"
echo "#### realizando build do projeto $projetoBuild ##########"
cd $workspace/software/EMS/
mvn clean install -Dmaven.test.skip=true > $diretorioLog/$projetoBuild.log
valida_log_projeto $projetoBuild

projetoBuild="Terminal"
echo "#### realizando build do projeto $projetoBuild ##########"
cd $workspace/software/EMS/main/modules/terminal/
mvn clean install -Dmaven.test.skip=true > $diretorioLog/$projetoBuild.log
valida_log_projeto $projetoBuild

projetoBuild="PresentationModule"
echo "#### realizando build do projeto $projetoBuild ##########"
cd $workspace/software/EMS/main/modules/presentation/
mvn clean install -Dmaven.test.skip=true > $diretorioLog/$projetoBuild.log
valida_log_projeto $projetoBuild

projetoBuild="Main"
echo "#### realizando build do projeto $projetoBuild ##########"
cd $workspace/software/EMS/main/
mvn clean install -Dmaven.test.skip=true > $diretorioLog/$projetoBuild.log
valida_log_projeto $projetoBuild

projetoBuild="BaseTest"
echo "#### realizando build do projeto $projetoBuild ##########"
cd $workspace/software/EMS/main/test/base_test/
mvn clean install -Dmaven.test.skip=true > $diretorioLog/$projetoBuild.log
valida_log_projeto $projetoBuild

projetoBuild="ApplicationModule"
echo "#### realizando build do projeto $projetoBuild ##########"
cd $workspace/software/EMS/main/modules/application/
mvn clean install -Dmaven.test.skip=true > $diretorioLog/$projetoBuild.log
valida_log_projeto $projetoBuild

projetoBuild="EmsProbe"
echo "#### realizando build do projeto $projetoBuild ##########"
cd $workspace/software/EMS/probe/
mvn clean install -Dmaven.test.skip=true > $diretorioLog/$projetoBuild.log
valida_log_projeto $projetoBuild

projetoBuild="ProbeCore"
echo "#### realizando build do projeto $projetoBuild ##########"
cd $workspace/software/EMS/probe/modules/core/
mvn clean install -Dmaven.test.skip=true > $diretorioLog/$projetoBuild.log
valida_log_projeto $projetoBuild

projetoBuild="ProbeWeb"
echo "#### realizando build do projeto $projetoBuild ##########"
cd $workspace/software/EMS/probe/modules/web/
mvn clean install -Dmaven.test.skip=true > $diretorioLog/$projetoBuild.log
valida_log_projeto $projetoBuild

projetoBuild="DomainModule"
echo "#### realizando build do projeto $projetoBuild ##########"
cd $workspace/software/EMS/main/modules/domain/
mvn clean install -Dmaven.test.skip=true > $diretorioLog/$projetoBuild.log
valida_log_projeto $projetoBuild

#projetoBuild="IntegrationTest"
#echo "#### realizando build do projeto $projetoBuild ##########"
#cd $workspace/software/EMS/main/test/integration_tests/
#mvn clean install -Dmaven.test.skip=true > $diretorioLog/$projetoBuild.log
#valida_log_projeto $projetoBuild

#projetoBuild="TestHelper"
#echo "#### realizando build do projeto $projetoBuild ##########"
#cd $workspace/software/EMS/main/test/test_helper/
#mvn clean install -Dmaven.test.skip=true > $diretorioLog/$projetoBuild.log
#valida_log_projeto $projetoBuild

projetoBuild="EMS_Equipment"
echo "#### realizando build do projeto $projetoBuild ##########"
cd $workspace/software/EMS/drivers/administrator
mvn clean install -Dmaven.test.skip=true > $diretorioLog/$projetoBuild.log
valida_log_projeto $projetoBuild

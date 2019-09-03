#!/bin/bash

clear

WORKSPACE="/home/jefson/Furukawa/dev/workspace-ems/ConsciusEMS/software"

echo "Data base host: "
read HOST

echo "Creating data base structure"
echo " "
echo "Host: " $HOST
echo " "
echo "Workspace: " $WORKSPACE
echo " "
echo "ENTER to continue"
echo "Ctrl C to abort"
read

psql -h $HOST -p 5432 -U asga_tms -d asga_tms -a -w -f $WORKSPACE/EMS/infra_structure/doc/modelo_geral.sql
psql -h $HOST -p 5432 -U asga_tms -d asga_tms -a -w -f $WORKSPACE/EMS/infra_structure/doc/prod_init_product.sql
psql -h $HOST -p 5432 -U asga_tms -d asga_tms -a -w -f $WORKSPACE/EMS/equipments/radio/radio-domain/doc/radio_model.sql
psql -h $HOST -p 5432 -U asga_tms -d asga_tms -a -w -f $WORKSPACE/EMS/equipments/gpon/gpon_domain/doc/gpon_model.sql
psql -h $HOST -p 5432 -U asga_tms -d asga_tms -a -w -f $WORKSPACE/EMS/equipments/radio-3d/radio-3d-domain/doc/radio3d_model.sql
psql -h $HOST -p 5432 -U asga_tms -d asga_tms -a -w -f $WORKSPACE/EMS/infra_structure/doc/create_view.sql
psql -h $HOST -p 5432 -U asga_tms -d asga_tms -a -w -f $WORKSPACE/EMS/infra_structure/doc/create_view_radio_3c_inventory.sql
psql -h $HOST -p 5432 -U asga_tms -d asga_tms -a -w -f $WORKSPACE/EMS/infra_structure/doc/create_view_radio_3d_inventory.sql
psql -h $HOST -p 5432 -U asga_tms -d asga_tms -a -w -f $WORKSPACE/EMS/equipments/fibermesh/fibermesh-domain/doc/fibermesh_model.sql

SELECT * FROM
(
SELECT  ne.id_ne_component
	, ne.id_inventory, ne.id_ne_component_parent

	, CASE 
		WHEN ne.id_ne_component_parent IS NOT NULL
		THEN NE.name 
		ELSE '-'::character varying END AS parent_label

	, ne.name AS node_label

	, CASE 
		WHEN ph.address IS NULL OR ph.address::text ~~* ''::text THEN '1'::character varying
		ELSE ph.address END AS radio_id

        , '1'::character varying AS radio_dev_id, ne.description AS product, inv.node_model
	
	, CASE WHEN ne.id_ne_agent IS NOT NULL THEN na.ip ELSE NULL END AS ip
	, CASE WHEN ne.id_ne_agent IS NOT NULL THEN '-' ELSE na.ip END AS parent_ip
	, CASE WHEN ph.city = '' THEN '-' ELSE ph.city END
	, CASE WHEN ph.state = '' THEN '-' ELSE ph.state END
	, CASE WHEN ph.domain = '' THEN '-' ELSE ph.domain END 
	, CASE WHEN ph.region = '' THEN '-' ELSE ph.region END 
	, CASE WHEN ph.location = '' THEN '-' ELSE ph.location END 
	
	, inv.firmware_version, inv.software_version
	
	,CASE 
		WHEN rad_inv.composition_board_type_slot_1 IS NULL THEN 'Empty'::character varying 
		WHEN rad_inv.composition_board_type_slot_1 = 1 THEN 'Main Unit'::character varying 
		WHEN rad_inv.composition_board_type_slot_1 = 2 THEN 'Pwr Supply 48V'::character varying
		WHEN rad_inv.composition_board_type_slot_1 = 3 THEN 'IDU Intfc'::character varying
		WHEN rad_inv.composition_board_type_slot_1 = 4 THEN 'Alm Intfc'::character varying
		WHEN rad_inv.composition_board_type_slot_1 = 5 THEN 'Exp 16 E1'::character varying
		WHEN rad_inv.composition_board_type_slot_1 = 6 THEN 'Exp 24 E1'::character varying
		WHEN rad_inv.composition_board_type_slot_1 = 7 THEN 'Eth Exp'::character varying
		WHEN rad_inv.composition_board_type_slot_1 = 8 THEN 'Sync E'::character varying
		WHEN rad_inv.composition_board_type_slot_1 = 9 THEN 'IDU Exp'::character varying
		WHEN rad_inv.composition_board_type_slot_1 = 10 THEN 'Motherboard'::character varying
		WHEN rad_inv.composition_board_type_slot_1 = 11 THEN 'Main Unit 1p1'::character varying
		WHEN rad_inv.composition_board_type_slot_1 = 12 THEN 'Pwr Supply 24V'::character varying
		WHEN rad_inv.composition_board_type_slot_1 = 13 THEN 'ODU'::character varying
		WHEN rad_inv.composition_board_type_slot_1 = 19 THEN 'Unknown'::character varying
		ELSE 'Empty'::character varying END AS bord_type_slot_1

	,CASE 
		WHEN rad_inv.composition_board_type_slot_2 IS NULL THEN 'Empty'::character varying 
		WHEN rad_inv.composition_board_type_slot_2 = 1 THEN 'Main Unit'::character varying 
		WHEN rad_inv.composition_board_type_slot_2 = 2 THEN 'Pwr Supply 48V'::character varying
		WHEN rad_inv.composition_board_type_slot_2 = 3 THEN 'IDU Intfc'::character varying
		WHEN rad_inv.composition_board_type_slot_2 = 4 THEN 'Alm Intfc'::character varying
		WHEN rad_inv.composition_board_type_slot_2 = 5 THEN 'Exp 16 E1'::character varying
		WHEN rad_inv.composition_board_type_slot_2 = 6 THEN 'Exp 24 E1'::character varying
		WHEN rad_inv.composition_board_type_slot_2 = 7 THEN 'Eth Exp'::character varying
		WHEN rad_inv.composition_board_type_slot_2 = 8 THEN 'Sync E'::character varying
		WHEN rad_inv.composition_board_type_slot_2 = 9 THEN 'IDU Exp'::character varying
		WHEN rad_inv.composition_board_type_slot_2 = 10 THEN 'Motherboard'::character varying
		WHEN rad_inv.composition_board_type_slot_2 = 11 THEN 'Main Unit 1p1'::character varying
		WHEN rad_inv.composition_board_type_slot_2 = 12 THEN 'Pwr Supply 24V'::character varying
		WHEN rad_inv.composition_board_type_slot_2 = 13 THEN 'ODU'::character varying
		WHEN rad_inv.composition_board_type_slot_2 = 19 THEN 'Unknown'::character varying
		ELSE 'Empty'::character varying END AS bord_type_slot_2

	,CASE 
		WHEN rad_inv.composition_board_type_slot_3 IS NULL THEN 'Empty'::character varying 
		WHEN rad_inv.composition_board_type_slot_3 = 1 THEN 'Main Unit'::character varying 
		WHEN rad_inv.composition_board_type_slot_3 = 2 THEN 'Pwr Supply 48V'::character varying
		WHEN rad_inv.composition_board_type_slot_3 = 3 THEN 'IDU Intfc'::character varying
		WHEN rad_inv.composition_board_type_slot_3 = 4 THEN 'Alm Intfc'::character varying
		WHEN rad_inv.composition_board_type_slot_3 = 5 THEN 'Exp 16 E1'::character varying
		WHEN rad_inv.composition_board_type_slot_3 = 6 THEN 'Exp 24 E1'::character varying
		WHEN rad_inv.composition_board_type_slot_3 = 7 THEN 'Eth Exp'::character varying
		WHEN rad_inv.composition_board_type_slot_3 = 8 THEN 'Sync E'::character varying
		WHEN rad_inv.composition_board_type_slot_3 = 9 THEN 'IDU Exp'::character varying
		WHEN rad_inv.composition_board_type_slot_3 = 10 THEN 'Motherboard'::character varying
		WHEN rad_inv.composition_board_type_slot_3 = 11 THEN 'Main Unit 1p1'::character varying
		WHEN rad_inv.composition_board_type_slot_3 = 12 THEN 'Pwr Supply 24V'::character varying
		WHEN rad_inv.composition_board_type_slot_3 = 13 THEN 'ODU'::character varying
		WHEN rad_inv.composition_board_type_slot_3 = 19 THEN 'Unknown'::character varying
		ELSE 'Empty'::character varying END AS bord_type_slot_3

	,CASE 
		WHEN rad_inv.composition_board_type_slot_4 IS NULL THEN 'Empty'::character varying 
		WHEN rad_inv.composition_board_type_slot_4 = 1 THEN 'Main Unit'::character varying 
		WHEN rad_inv.composition_board_type_slot_4 = 2 THEN 'Pwr Supply 48V'::character varying
		WHEN rad_inv.composition_board_type_slot_4 = 3 THEN 'IDU Intfc'::character varying
		WHEN rad_inv.composition_board_type_slot_4 = 4 THEN 'Alm Intfc'::character varying
		WHEN rad_inv.composition_board_type_slot_4 = 5 THEN 'Exp 16 E1'::character varying
		WHEN rad_inv.composition_board_type_slot_4 = 6 THEN 'Exp 24 E1'::character varying
		WHEN rad_inv.composition_board_type_slot_4 = 7 THEN 'Eth Exp'::character varying
		WHEN rad_inv.composition_board_type_slot_4 = 8 THEN 'Sync E'::character varying
		WHEN rad_inv.composition_board_type_slot_4 = 9 THEN 'IDU Exp'::character varying
		WHEN rad_inv.composition_board_type_slot_4 = 10 THEN 'Motherboard'::character varying
		WHEN rad_inv.composition_board_type_slot_4 = 11 THEN 'Main Unit 1p1'::character varying
		WHEN rad_inv.composition_board_type_slot_4 = 12 THEN 'Pwr Supply 24V'::character varying
		WHEN rad_inv.composition_board_type_slot_4 = 13 THEN 'ODU'::character varying
		WHEN rad_inv.composition_board_type_slot_4 = 19 THEN 'Unknown'::character varying
		ELSE 'Empty'::character varying END AS bord_type_slot_4

	,CASE 
		WHEN rad_inv.composition_board_type_slot_5 IS NULL THEN 'Empty'::character varying 
		WHEN rad_inv.composition_board_type_slot_5 = 1 THEN 'Main Unit'::character varying 
		WHEN rad_inv.composition_board_type_slot_5 = 2 THEN 'Pwr Supply 48V'::character varying
		WHEN rad_inv.composition_board_type_slot_5 = 3 THEN 'IDU Intfc'::character varying
		WHEN rad_inv.composition_board_type_slot_5 = 4 THEN 'Alm Intfc'::character varying
		WHEN rad_inv.composition_board_type_slot_5 = 5 THEN 'Exp 16 E1'::character varying
		WHEN rad_inv.composition_board_type_slot_5 = 6 THEN 'Exp 24 E1'::character varying
		WHEN rad_inv.composition_board_type_slot_5 = 7 THEN 'Eth Exp'::character varying
		WHEN rad_inv.composition_board_type_slot_5 = 8 THEN 'Sync E'::character varying
		WHEN rad_inv.composition_board_type_slot_5 = 9 THEN 'IDU Exp'::character varying
		WHEN rad_inv.composition_board_type_slot_5 = 10 THEN 'Motherboard'::character varying
		WHEN rad_inv.composition_board_type_slot_5 = 11 THEN 'Main Unit 1p1'::character varying
		WHEN rad_inv.composition_board_type_slot_5 = 12 THEN 'Pwr Supply 24V'::character varying
		WHEN rad_inv.composition_board_type_slot_5 = 13 THEN 'ODU'::character varying
		WHEN rad_inv.composition_board_type_slot_5 = 19 THEN 'Unknown'::character varying
		ELSE 'Empty'::character varying END AS bord_type_slot_5

	,CASE 
		WHEN rad_inv.composition_board_type_slot_6 IS NULL THEN 'Empty'::character varying 
		WHEN rad_inv.composition_board_type_slot_6 = 1 THEN 'Main Unit'::character varying 
		WHEN rad_inv.composition_board_type_slot_6 = 2 THEN 'Pwr Supply 48V'::character varying
		WHEN rad_inv.composition_board_type_slot_6 = 3 THEN 'IDU Intfc'::character varying
		WHEN rad_inv.composition_board_type_slot_6 = 4 THEN 'Alm Intfc'::character varying
		WHEN rad_inv.composition_board_type_slot_6 = 5 THEN 'Exp 16 E1'::character varying
		WHEN rad_inv.composition_board_type_slot_6 = 6 THEN 'Exp 24 E1'::character varying
		WHEN rad_inv.composition_board_type_slot_6 = 7 THEN 'Eth Exp'::character varying
		WHEN rad_inv.composition_board_type_slot_6 = 8 THEN 'Sync E'::character varying
		WHEN rad_inv.composition_board_type_slot_6 = 9 THEN 'IDU Exp'::character varying
		WHEN rad_inv.composition_board_type_slot_6 = 10 THEN 'Motherboard'::character varying
		WHEN rad_inv.composition_board_type_slot_6 = 11 THEN 'Main Unit 1p1'::character varying
		WHEN rad_inv.composition_board_type_slot_6 = 12 THEN 'Pwr Supply 24V'::character varying
		WHEN rad_inv.composition_board_type_slot_6 = 13 THEN 'ODU'::character varying
		WHEN rad_inv.composition_board_type_slot_6 = 19 THEN 'Unknown'::character varying
		ELSE 'Empty'::character varying END AS bord_type_slot_6
		
	,CASE 
		WHEN rad_inv.composition_board_type_slot_7 IS NULL THEN 'Empty'::character varying 
		WHEN rad_inv.composition_board_type_slot_7 = 1 THEN 'Main Unit'::character varying 
		WHEN rad_inv.composition_board_type_slot_7 = 2 THEN 'Pwr Supply 48V'::character varying
		WHEN rad_inv.composition_board_type_slot_7 = 3 THEN 'IDU Intfc'::character varying
		WHEN rad_inv.composition_board_type_slot_7 = 4 THEN 'Alm Intfc'::character varying
		WHEN rad_inv.composition_board_type_slot_7 = 5 THEN 'Exp 16 E1'::character varying
		WHEN rad_inv.composition_board_type_slot_7 = 6 THEN 'Exp 24 E1'::character varying
		WHEN rad_inv.composition_board_type_slot_7 = 7 THEN 'Eth Exp'::character varying
		WHEN rad_inv.composition_board_type_slot_7 = 8 THEN 'Sync E'::character varying
		WHEN rad_inv.composition_board_type_slot_7 = 9 THEN 'IDU Exp'::character varying
		WHEN rad_inv.composition_board_type_slot_7 = 10 THEN 'Motherboard'::character varying
		WHEN rad_inv.composition_board_type_slot_7 = 11 THEN 'Main Unit 1p1'::character varying
		WHEN rad_inv.composition_board_type_slot_7 = 12 THEN 'Pwr Supply 24V'::character varying
		WHEN rad_inv.composition_board_type_slot_7 = 13 THEN 'ODU'::character varying
		WHEN rad_inv.composition_board_type_slot_7 = 19 THEN 'Unknown'::character varying
		ELSE 'Empty'::character varying END AS bord_type_slot_7
		
	,CASE 
		WHEN rad_inv.composition_board_type_slot_8 IS NULL THEN 'Empty'::character varying 
		WHEN rad_inv.composition_board_type_slot_8 = 1 THEN 'Main Unit'::character varying 
		WHEN rad_inv.composition_board_type_slot_8 = 2 THEN 'Pwr Supply 48V'::character varying
		WHEN rad_inv.composition_board_type_slot_8 = 3 THEN 'IDU Intfc'::character varying
		WHEN rad_inv.composition_board_type_slot_8 = 4 THEN 'Alm Intfc'::character varying
		WHEN rad_inv.composition_board_type_slot_8 = 5 THEN 'Exp 16 E1'::character varying
		WHEN rad_inv.composition_board_type_slot_8 = 6 THEN 'Exp 24 E1'::character varying
		WHEN rad_inv.composition_board_type_slot_8 = 7 THEN 'Eth Exp'::character varying
		WHEN rad_inv.composition_board_type_slot_8 = 8 THEN 'Sync E'::character varying
		WHEN rad_inv.composition_board_type_slot_8 = 9 THEN 'IDU Exp'::character varying
		WHEN rad_inv.composition_board_type_slot_8 = 10 THEN 'Motherboard'::character varying
		WHEN rad_inv.composition_board_type_slot_8 = 11 THEN 'Main Unit 1p1'::character varying
		WHEN rad_inv.composition_board_type_slot_8 = 12 THEN 'Pwr Supply 24V'::character varying
		WHEN rad_inv.composition_board_type_slot_8 = 13 THEN 'ODU'::character varying
		WHEN rad_inv.composition_board_type_slot_8 = 19 THEN 'Unknown'::character varying
		ELSE 'Empty'::character varying END AS bord_type_slot_8

	,CASE 
		WHEN rad_inv.composition_board_type_slot_9 IS NULL THEN 'Empty'::character varying 
		WHEN rad_inv.composition_board_type_slot_9 = 1 THEN 'Main Unit'::character varying 
		WHEN rad_inv.composition_board_type_slot_9 = 2 THEN 'Pwr Supply 48V'::character varying
		WHEN rad_inv.composition_board_type_slot_9 = 3 THEN 'IDU Intfc'::character varying
		WHEN rad_inv.composition_board_type_slot_9 = 4 THEN 'Alm Intfc'::character varying
		WHEN rad_inv.composition_board_type_slot_9 = 5 THEN 'Exp 16 E1'::character varying
		WHEN rad_inv.composition_board_type_slot_9 = 6 THEN 'Exp 24 E1'::character varying
		WHEN rad_inv.composition_board_type_slot_9 = 7 THEN 'Eth Exp'::character varying
		WHEN rad_inv.composition_board_type_slot_9 = 8 THEN 'Sync E'::character varying
		WHEN rad_inv.composition_board_type_slot_9 = 9 THEN 'IDU Exp'::character varying
		WHEN rad_inv.composition_board_type_slot_9 = 10 THEN 'Motherboard'::character varying
		WHEN rad_inv.composition_board_type_slot_9 = 11 THEN 'Main Unit 1p1'::character varying
		WHEN rad_inv.composition_board_type_slot_9 = 12 THEN 'Pwr Supply 24V'::character varying
		WHEN rad_inv.composition_board_type_slot_9 = 13 THEN 'ODU'::character varying
		WHEN rad_inv.composition_board_type_slot_9 = 19 THEN 'Unknown'::character varying
		ELSE 'Empty'::character varying END AS bord_type_slot_9
        
	,CASE 
		WHEN rad_inv.composition_board_type_slot_10 IS NULL THEN 'Empty'::character varying 
		WHEN rad_inv.composition_board_type_slot_10 = 1 THEN 'Main Unit'::character varying 
		WHEN rad_inv.composition_board_type_slot_10 = 2 THEN 'Pwr Supply 48V'::character varying
		WHEN rad_inv.composition_board_type_slot_10 = 3 THEN 'IDU Intfc'::character varying
		WHEN rad_inv.composition_board_type_slot_10 = 4 THEN 'Alm Intfc'::character varying
		WHEN rad_inv.composition_board_type_slot_10 = 5 THEN 'Exp 16 E1'::character varying
		WHEN rad_inv.composition_board_type_slot_10 = 6 THEN 'Exp 24 E1'::character varying
		WHEN rad_inv.composition_board_type_slot_10 = 7 THEN 'Eth Exp'::character varying
		WHEN rad_inv.composition_board_type_slot_10 = 8 THEN 'Sync E'::character varying
		WHEN rad_inv.composition_board_type_slot_10 = 9 THEN 'IDU Exp'::character varying
		WHEN rad_inv.composition_board_type_slot_10 = 10 THEN 'Motherboard'::character varying
		WHEN rad_inv.composition_board_type_slot_10 = 11 THEN 'Main Unit 1p1'::character varying
		WHEN rad_inv.composition_board_type_slot_10 = 12 THEN 'Pwr Supply 24V'::character varying
		WHEN rad_inv.composition_board_type_slot_10 = 13 THEN 'ODU'::character varying
		WHEN rad_inv.composition_board_type_slot_10 = 19 THEN 'Unknown'::character varying
		ELSE 'Empty'::character varying END AS bord_type_slot_10
        
	,CASE 
		WHEN rad_inv.composition_board_type_slot_11 IS NULL THEN 'Empty'::character varying 
		WHEN rad_inv.composition_board_type_slot_11 = 1 THEN 'Main Unit'::character varying 
		WHEN rad_inv.composition_board_type_slot_11 = 2 THEN 'Pwr Supply 48V'::character varying
		WHEN rad_inv.composition_board_type_slot_11 = 3 THEN 'IDU Intfc'::character varying
		WHEN rad_inv.composition_board_type_slot_11 = 4 THEN 'Alm Intfc'::character varying
		WHEN rad_inv.composition_board_type_slot_11 = 5 THEN 'Exp 16 E1'::character varying
		WHEN rad_inv.composition_board_type_slot_11 = 6 THEN 'Exp 24 E1'::character varying
		WHEN rad_inv.composition_board_type_slot_11 = 7 THEN 'Eth Exp'::character varying
		WHEN rad_inv.composition_board_type_slot_11 = 8 THEN 'Sync E'::character varying
		WHEN rad_inv.composition_board_type_slot_11 = 9 THEN 'IDU Exp'::character varying
		WHEN rad_inv.composition_board_type_slot_11 = 10 THEN 'Motherboard'::character varying
		WHEN rad_inv.composition_board_type_slot_11 = 11 THEN 'Main Unit 1p1'::character varying
		WHEN rad_inv.composition_board_type_slot_11 = 12 THEN 'Pwr Supply 24V'::character varying
		WHEN rad_inv.composition_board_type_slot_11 = 13 THEN 'ODU'::character varying
		WHEN rad_inv.composition_board_type_slot_11 = 19 THEN 'Unknown'::character varying
		ELSE 'Empty'::character varying END AS bord_type_slot_11
        
	,CASE 
		WHEN rad_inv.composition_board_type_slot_12 IS NULL THEN 'Empty'::character varying 
		WHEN rad_inv.composition_board_type_slot_12 = 1 THEN 'Main Unit'::character varying 
		WHEN rad_inv.composition_board_type_slot_12 = 2 THEN 'Pwr Supply 48V'::character varying
		WHEN rad_inv.composition_board_type_slot_12 = 3 THEN 'IDU Intfc'::character varying
		WHEN rad_inv.composition_board_type_slot_12 = 4 THEN 'Alm Intfc'::character varying
		WHEN rad_inv.composition_board_type_slot_12 = 5 THEN 'Exp 16 E1'::character varying
		WHEN rad_inv.composition_board_type_slot_12 = 6 THEN 'Exp 24 E1'::character varying
		WHEN rad_inv.composition_board_type_slot_12 = 7 THEN 'Eth Exp'::character varying
		WHEN rad_inv.composition_board_type_slot_12 = 8 THEN 'Sync E'::character varying
		WHEN rad_inv.composition_board_type_slot_12 = 9 THEN 'IDU Exp'::character varying
		WHEN rad_inv.composition_board_type_slot_12 = 10 THEN 'Motherboard'::character varying
		WHEN rad_inv.composition_board_type_slot_12 = 11 THEN 'Main Unit 1p1'::character varying
		WHEN rad_inv.composition_board_type_slot_12 = 12 THEN 'Pwr Supply 24V'::character varying
		WHEN rad_inv.composition_board_type_slot_12 = 13 THEN 'ODU'::character varying
		WHEN rad_inv.composition_board_type_slot_12 = 19 THEN 'Unknown'::character varying
		ELSE 'Empty'::character varying END AS bord_type_slot_12

	, '-'::character varying AS transceptor_tx
	, nd.name AS node_data_name

FROM ne_component AS ne

LEFT JOIN ne_component AS ne_sub
ON ne.id_ne_component_parent = ne_sub.id_ne_component

INNER JOIN node_data AS nd
ON nd.id_ne_component = ne.id_ne_component

INNER JOIN data_unit AS du
ON du.id_node_data = nd.id_node_data

INNER JOIN inventory inv 
ON inv.id_inventory = ne.id_inventory

INNER JOIN radio_3d_inventory rad_inv 
ON rad_inv.id_inventory = inv.id_inventory

INNER JOIN physical_inventory AS ph
ON ne.id_physical_inventory = ph.id_physical_inventory

INNER JOIN ne_agent AS na
ON ne.id_ne_agent = na.id_ne_agent OR na.id_ne_agent = ( SELECT id_ne_agent FROM ne_component WHERE ne_component.id_ne_component = ne.id_ne_component_parent)

WHERE ne.description ILIKE 'Radio%3D'

) AS nbi_3d
--WHERE nbi_3d.node_data_name ILIKE 'fw3dCompSerialNumber%' OR nbi_3d.node_data_name ILIKE 'fw3dCompProductCode%'
ORDER BY nbi_3d.id_ne_component, nbi_3d.node_label DESC;

SELECT name, category, CASE WHEN category = 10 THEN 'STATUS' 
	WHEN category = 20 THEN 'CONFIGURATION'
	WHEN category = 30 THEN 'PERFORMANCE'
	WHEN category = 40 THEN 'STRUCTURE'
	WHEN category = 50 THEN 'IDENTIFICATION'
	WHEN category = 60 THEN 'LOGICAL_INVENTORY'
	WHEN category = 70 THEN 'PHYSICAL_INVENTORY'
	WHEN category = 80 THEN 'INFO'
	WHEN category = 90 THEN 'COMMAND'
	WHEN category = 100 THEN 'NONE'
	WHEN category = 110 THEN 'OTHER'
	WHEN category = 120 THEN 'NODE_STATUS'
	WHEN category = 130 THEN 'NBI'
	ELSE 'unidentified'
	END
FROM node_data_template
WHERE id_component_template IN (
				SELECT id_component_template
				FROM component_template
				WHERE description ILIKE 'Radio 3D' OR name ILIKE 'ODU_3D' 
				OR name ILIKE 'IDU_3D' OR name ILIKE 'FW2200_3D_ETH'
				OR name ILIKE 'FW2200_3D_E1' OR name ILIKE 'FW2200_3D_ETH_VLAN')
ORDER BY category
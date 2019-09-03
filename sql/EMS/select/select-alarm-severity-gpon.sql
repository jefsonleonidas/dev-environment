SELECT name, message_template, 
	CASE WHEN weight = 10 THEN 'WARNING'
	WHEN weight = 20 THEN 'MINOR'
	WHEN weight = 30 THEN 'MAJOR'
	WHEN weight = 40 THEN 'SEVERE'
	WHEN weight = 45 THEN 'CRITICAL'
	WHEN weight = 50 THEN 'UNREACHABLE'
	END AS severity, failure_obj_template
FROM component_alarm_template
WHERE id_component_template IN (
				SELECT id_component_template 
				FROM component_template 
				WHERE alias ILIKE 'OLT2500' OR name ILIKE 'OLTSTM1' OR name ILIKE 'OLTFIT' 
				OR name ILIKE 'PON' OR name ILIKE 'GE1' OR name ILIKE 'GE10'
				OR name ILIKE 'TRANSCEIVER' OR name ILIKE 'ONU500' OR name ILIKE 'ONU100' 
				OR name ILIKE 'ONU1600' OR name ILIKE 'ONU_OTHER' OR name ILIKE 'ONU580'
				OR name ILIKE 'ONU1100' OR name ILIKE 'ONU111' )
GROUP BY name, message_template, severity, failure_obj_template
ORDER BY message_template

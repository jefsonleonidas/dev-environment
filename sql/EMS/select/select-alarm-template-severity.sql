SELECT name, message_template, 
	CASE WHEN weight = 10 THEN 'WARNING'
	WHEN weight = 20 THEN 'MINOR'
	WHEN weight = 30 THEN 'MAJOR'
	WHEN weight = 40 THEN 'SEVERE'
	WHEN weight = 45 THEN 'CRITICAL'
	WHEN weight = 50 THEN 'UNREACHABLE'
	END AS severity
FROM component_alarm_template
WHERE id_component_template IN (
				SELECT id_component_template 
				FROM component_template 
				WHERE description ILIKE 'Radio 2200 - 3C' 
				OR name ILIKE 'AW2200_3C_E1'
				OR name ILIKE 'AW2200_3C_ETH' )
GROUP BY name, message_template, severity
ORDER BY message_template


--select * from component_alarm_template

--select * from component_template where name ilike 'AW%'
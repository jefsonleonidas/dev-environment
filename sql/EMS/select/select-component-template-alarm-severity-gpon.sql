SELECT cpt.name, cat.name, cat.message_template, 
	CASE WHEN cat.weight = 10 THEN 'WARNING'
	WHEN cat.weight = 20 THEN 'MINOR'
	WHEN cat.weight = 30 THEN 'MAJOR'
	WHEN cat.weight = 40 THEN 'SEVERE'
	WHEN cat.weight = 45 THEN 'CRITICAL'
	WHEN cat.weight = 50 THEN 'UNREACHABLE'
	END AS severity, cat.failure_obj_template
FROM component_template AS cpt
INNER JOIN component_alarm_template AS cat
ON cpt.id_component_template = cat.id_component_template
GROUP BY cpt.name, cat.name, cat.message_template, cat.weight, cat.failure_obj_template
ORDER BY cpt.name, cat.message_template
 


SELECT * 
FROM node_notification AS nt
WHERE 1=1 AND nt.id_node_notification IN (SELECT id_node_notification 
						FROM node_notification_property AS np 
						WHERE np.value IN (SELECT ct.name 
									FROM component_template AS ct 
									WHERE ct.description ILIKE '%OTHER%'))
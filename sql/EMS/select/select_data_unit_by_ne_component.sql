SELECT nd.id_ne_component, nd.name, nd.local_value, nd.remote_value, nd.committed_value, sc.value, nd.last_update
FROM
(
	SELECT nd.id_node_data, nd.id_ne_component, nd.name, du.local_value, du.remote_value, du.committed_value, nd.last_update
	FROM
	(
		SELECT id_node_data, id_ne_component, name, to_timestamp(last_update/1000) as last_update
		FROM node_data
		WHERE id_ne_component IN (
						SELECT id_ne_component 
						FROM ne_component 
						WHERE name ILIKE '%ODU%'
					)
	) AS nd 
	INNER JOIN 
	data_unit AS du
	ON nd.id_node_data = du.id_node_data
) AS nd
INNER JOIN 
(
	SELECT id_node_data, value
	FROM sync_config
) AS sc
ON sc.id_node_data = nd.id_node_data
ORDER BY nd.id_ne_component,nd.name
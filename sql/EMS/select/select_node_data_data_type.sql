SELECT nd.id_ne_component, nd.id_data_unit, nd.name, nd.id_data_type, dt.name, nd.committed_value
FROM
(
	SELECT * 
	FROM
	(
		SELECT id_node_data, id_ne_component, name
		FROM node_data 
		WHERE id_ne_component IN (
						SELECT id_ne_component
						FROM ne_component
						--WHERE naMe ILIKE 'ODU %'
					)
	) AS nd
	INNER JOIN
	(
		SELECT id_data_unit, id_node_data, id_data_type,committed_value
		FROM data_unit
	) AS du
	ON nd.id_node_data = du.id_node_data
	ORDER BY nd.name
) AS nd
INNER JOIN
(
	SELECT id_data_unit_type_enum, name
	FROM data_unit_type_enum
) as dt
ON dt.id_data_unit_type_enum = nd.id_data_type
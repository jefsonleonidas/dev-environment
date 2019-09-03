SELECT aux_1.id_component_template, aux_1.name, aux_1.id_node_data_template, duta.id_data_unit_template, aux_1.id_sync_config_template
	, aux_1.ndt_name
FROM
	(
	SELECT ndt.id_component_template, ndt.id_node_data_template, sct.id_sync_config_template, ndt.name, ndt.ndt_name
	FROM
		(
		SELECT comt.id_component_template, comt.name, ndt.id_node_data_template, ndt.name AS ndt_name
		FROM (

			(
			SELECT id_component_template, name
			FROM component_template
			) comt

			INNER JOIN 

			(
			SELECT ndta.id_component_template, ndta.id_node_data_template, ndta.name
			, ndt.id_node_data_template AS id_node_template, ndt.name AS id_name_node_template
			FROM node_data_template_after AS ndta
			LEFT JOIN node_data_template AS ndt
			ON ndta.name ilike ndt.name
			WHERE ndt.id_node_data_template IS NULL
			ORDER BY ndt.id_node_data_template
			) AS ndt
			ON comt.id_component_template = ndt.id_component_template
		) 
	)AS ndt

	INNER JOIN sync_config_template_after AS sct
	ON sct.id_node_data_template = ndt.id_node_data_template

	) AS aux_1

INNER JOIN data_unit_template_after AS duta
ON duta.id_node_data_template = aux_1.id_node_data_template
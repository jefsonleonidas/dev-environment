SELECT ne.description, nd.name, sc.value
, CASE 
	WHEN sc.is_read = 1 THEN 'GET'
	ELSE 'SET'
  END AS type
FROM component_template ne
INNER JOIN node_data_template nd
ON ne.id_component_template = nd.id_component_template
INNER JOIN sync_config_template sc
ON sc.id_node_data_template = nd.id_node_data_template
WHERE ne.description ILIKE 'OLT%' OR ne.description ILIKE 'ONU%' OR ne.description ILIKE 'GE%' OR ne.description ILIKE 'PON%'
ORDER BY sc.is_read
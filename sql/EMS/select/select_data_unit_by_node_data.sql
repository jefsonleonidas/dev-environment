SELECT nd.id_node_data, du.id_data_unit, ne.description, ne.name, to_timestamp(nd.last_update/1000) AS date, nd.name, du.local_value, du.remote_value, du.committed_value, nd.category, sc.value
FROM ne_component ne
INNER JOIN node_data nd
ON ne.id_ne_component = nd.id_ne_component
INNER JOIN data_unit du
ON du.id_node_data = nd.id_node_data
INNER JOIN sync_config sc
ON nd.id_node_data = sc.id_node_data
--WHERE sc.value IS NULL
WHERE nd.name IN ('nodeModel')
--AND ne.description ILIKE 'PON %' and id_ne_component_parent = 148
ORDER BY nd.name
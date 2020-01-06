SELECT ne.id_ne_component
	, du.id_data_unit
	, nd.id_node_data
	, nep.name
	, nep.description
	, ne.description
	, ne.name AS equipment_name
	, nd.name AS node_data_name
	, nd.category, nd.id_sync_policy, du.id_data_type
	, to_timestamp(last_update/1000) AS last_update
	, du.local_value, du.remote_value
	, du.committed_value
	, sc.value, du.translation_rule
	, du.remote_converters, du.validators, sc.is_read
FROM ne_component ne
INNER JOIN ne_component AS nep
ON ne.id_ne_component_parent = nep.id_ne_component
INNER JOIN node_data nd
ON ne.id_ne_component = nd.id_ne_component
INNER JOIN data_unit du
ON du.id_node_data = nd.id_node_data
INNER JOIN sync_config sc
ON sc.id_node_data = nd.id_node_data
WHERE (nd.name ILIKE 'fwCommTrxRFband')
--AND ne.id_ne_component = 216
ORDER BY ne.id_ne_component

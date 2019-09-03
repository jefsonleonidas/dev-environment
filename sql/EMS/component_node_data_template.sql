SELECT nd.id_component_template, ct.name, ct.description, nd.name, nd.category
FROM
(
SELECT id_component_template, name, category
FROM node_data_template
WHERE id_component_template IN (SELECT id_component_template
				FROM component_template )
ORDER BY id_component_template, name, category) AS nd
INNER JOIN 
(
SELECT id_component_template, description, name
FROM component_template
) AS ct
ON ct.id_component_template = nd.id_component_template
ORDER BY nd.id_component_template, nd.category , ct.description, nd.name
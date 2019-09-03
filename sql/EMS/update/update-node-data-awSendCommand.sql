UPDATE node_data SET id_sync_policy = 3
WHERE id_node_data IN (
			SELECT id_node_data 
			FROM node_data 
			WHERE name ILIKE 'awSendCommand');

UPDATE node_data_template SET id_sync_policy = 3
WHERE id_node_data_template IN (
			SELECT id_node_data_template 
			FROM node_data_template 
			WHERE name ILIKE 'awSendCommand');

UPDATE data_unit SET local_value = 1, remote_value = 1, committed_value = 1
WHERE id_node_data IN (
			SELECT id_node_data
			FROM node_data
			WHERE name ilike 'awOduOperMaintenanceTest')


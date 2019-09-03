update data_unit set local_value = null, remote_value = null, committed_value = null
where id_node_data in ( select id_node_data from node_data 
WHERE name ILIKE 'fw3dSecTermStatusSummarized' or name ILIKE 'fw3dSecTermTimeRemaining' or name ILIKE 'fw3dSecTermCmdAuthDatagram')
update data_unit 
set local_value = null, remote_value = null, committed_value = null
where id_node_data in ( select id_node_data 
			from node_data
			where name in ('fwCommTrxRFband', 'fwCommTrxRFbandODUOne', 'fwCommTrxRFbandODUTwo'
					, 'macAddress', 'manufacturingDate', 'nodeModel'
					, 'productCode', 'serialCode', 'softwareVersion')
			)
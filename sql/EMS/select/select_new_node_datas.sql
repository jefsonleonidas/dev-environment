SELECT nd.name, sc.value
FROM
(
	SELECT id_node_data, name 
	FROM node_data
	WHERE name IN ('onuIfInvTxOutputPowerValue', 'onuIfInvSerialNumber', 'onuIfInvLaserWaveLength', 'onuIfInvNominalBitRate', 'onuIfInvRevisionLevel', 'onuIfInvLinkLengthToFiber9div125Km',
			'onuIfInvLinkLengthToFiber62dot5div125', 'onuIfInvInternalTemperature', 'onuIfInvPartNumber', 'onuIfInvManufactureDate', 'onuIfInvVendorName', 'onuIfInvRxInputPowerValue',
			'onuIfInvLastUpdate', 'onuIfInvTxBiasValue', 'onuIfInvLinkLengthToFiber9div125', 'onuIfInvInternalVoltage', 'onuIfInvLinkLengthToFiber50div125')) AS nd

INNER JOIN

(
	SELECT id_node_data, value
	FROM sync_config) AS sc

ON nd.id_node_data = sc.id_node_data
SELECT nt.message, np.value, ne.name, '' AS profile_name, '' AS profile_status, 'Not availible' AS rx_power
FROM ne_component AS ne
INNER JOIN node_notification AS nt
ON ne.id_ne_component = nt.id_ne_component
INNER JOIN node_notification_property AS np
ON nt.id_node_notification = np.id_node_notification 
ORDER BY message
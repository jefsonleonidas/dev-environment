SELECT  
	ne.id_ne_component, ne.name AS node_label, ne.alias, phi.id_physical_inventory, phi.city, phi.state, phi.domain, phi.region, phi.location,   
	inv.serial_code, CASE WHEN phi.address = '' THEN '1' ELSE phi.address END AS address, inv.firmware_version, inv.mac_address, inv.software_version,
	inv_3c.trunk_mac_address, inv_3c.fpga_version, inv_3c.latitude, inv_3c.longitude, inv_3c.alias
FROM ne_component ne
LEFT JOIN inventory inv
ON ne.id_inventory = inv.id_inventory
LEFT JOIN physical_inventory phi
ON ne.id_physical_inventory = phi.id_physical_inventory
LEFT JOIN radio_inventory inv_3c
ON ne.id_inventory = inv_3c.id_inventory
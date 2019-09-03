DROP VIEW faults_integration.component_alarm;

CREATE VIEW faults_integration."component_alarm" AS SELECT  ca.id_component_alarm, ca.severity, ca.category, ca.name, ca.failure_obj, ca.active, ca.message, ca.id_ne_component, ca.status_timestamp,
															ne.name AS node_label, ne.alias, phi.id_physical_inventory, phi.city, phi.state, phi.domain, phi.region, phi.location,   
															inv.serial_code, phi.address
													FROM ne_component ne
													INNER JOIN component_alarm ca
													ON ne.id_ne_component = ca.id_ne_component
													LEFT JOIN inventory inv
													ON ne.id_inventory = inv.id_inventory
													LEFT JOIN physical_inventory phi
													ON ne.id_physical_inventory = phi.id_physical_inventory;












SELECT  ca.id_component_alarm, ca.severity, ca.category, ca.name, ca.failure_obj, ca.active, ca.message, ca.id_ne_component, ca.status_timestamp,
	ne.name AS node_label, ne.alias, phi.id_physical_inventory, phi.city, phi.state, phi.domain, phi.region, phi.location,   
	inv.serial_code, phi.address
FROM ne_component ne
INNER JOIN component_alarm ca
ON ne.id_ne_component = ca.id_ne_component
LEFT JOIN inventory inv
ON ne.id_inventory = inv.id_inventory
LEFT JOIN physical_inventory phi
ON ne.id_physical_inventory = phi.id_physical_inventory;

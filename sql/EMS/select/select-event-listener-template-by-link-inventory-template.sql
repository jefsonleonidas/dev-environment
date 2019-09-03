SELECT * 
FROM event_listener_template 
WHERE id_event_listener_template IN (
					SELECT id_event_listener_template
					FROM link_inventory_template_event_listener_template 
					WHERE id_inventory_template IN (
									SELECT id_inventory_template 
									FROM inventory_template
									WHERE id_component_template in (
													SELECT id_component_template
													FROM component_template
													WHERE alias ILIKE 'ONU%' 
													)
									)
				)
AND properties ILIKE '%onuIfInvRxInputPowerValue%' OR action_properties ILIKE '%onuIfInvRxInputPowerValue%'
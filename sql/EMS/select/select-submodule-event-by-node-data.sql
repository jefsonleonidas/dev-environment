SELECT * 
FROM submodule_slot
WHERE id_submodule_slot IN (
				SELECT id_submodule_slot 
				FROM event_listener_action
				WHERE id_event_listener_action IN (
									SELECT id_event_listener_action
									FROM event_listener
									WHERE data_name ILIKE 'linkMonitor')
				)
SELECT *
FROM event_listener_action
WHERE 
component_type_oid IS NOT NULL AND id_ne_component IN (
							SELECT id_ne_component 
							FROM ne_component 
							WHERE id_ne_component_parent = 176 AND description ILIKE 'PON%'
							)


--select * from ne_component where id_ne_component = 185

--SELECT * FROM sync_config WHERE value ilike '.1.3.6.1.4.1.3979.6.4.2.1.1.2.2.4.2.1.4.610%'
SELECT  * 
FROM trap_event_listener as l 
WHERE l.parent_model ILIKE 'OLT%' AND l.id_event_type_enum = 6 AND l.property_count = (
								SELECT count(*)
								FROM trap_event_listener_property AS p 
								WHERE p.id_trap_event_listener = l.id_trap_event_listener AND (
								(p.name = 'oid' AND p.value = '.1.3.6.1.4.1.3979.6.4.2.1.2.5.1.0.42')  
								OR (p.name = 'varbind[2]' AND p.value = '1000')
								OR (p.name = 'varbind[3]' AND p.value = '1000')
								OR (p.name = 'varbind[4]' AND p.value = '1000')
								OR (p.name = 'varbind[5]' AND p.value = '1000')
								OR (p.name = 'varbind[6]' AND p.value = '1000')
								OR (p.name = 'varbind[7]' AND p.value = '1000')
								OR (p.name = 'varbind[8]' AND p.value = '1000')
								OR (p.name = 'varbind[9]' AND p.value = '1000')
								OR (p.name = 'varbind[10]' AND p.value = '1000')
								OR (p.name = 'varbind[11]' AND p.value = '1000') )
							)
select * 
from slot_template 
where id_slot_template in (
				select id_slot_template 
				from submodule_slot 
				where id_submodule_slot in (
								select id_submodule_slot 
								from event_listener_action 
								where id_event_listener_action in ( 
													select id_event_listener_action 
													from event_listener 
													where data_name ilike 'linkMonitor') ) )

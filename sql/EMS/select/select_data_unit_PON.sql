select * 
from data_unit 
where id_node_data in ( 
			select id_node_data
			from node_data
			where name ilike '%onuOperationStatus%' and id_ne_component in ( 
											select id_ne_component 
											from ne_component
											where id_ne_component_parent in ( 
															  select id_ne_component 
															  from ne_component 
															  where id_ne_component_parent in ( 
																			    select id_ne_component 
																			    from ne_component 
																			    where name ilike '%TESTA%'
																			   )
															)

										       )
			)
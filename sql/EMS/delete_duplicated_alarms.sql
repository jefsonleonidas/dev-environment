delete from link_ne_component_component_alarm  
where id_component_alarm in (
				select cpa.id_component_alarm from  (
									select MIN(id_component_alarm) as min_alr, id_ne_component, name from
										(
											select cmpAl.* from component_alarm as cmpAl
											inner join 
												(
												select alr_qtd.id_ne_component, alr_qtd.name from 
													(
													select id_ne_component, name, count(*) as qtd_alarm
													from component_alarm
													group by id_ne_component, name
													HAVING count(*) > 1
													order by qtd_alarm
													) as alr_qtd
												) as alr_qtd
											on cmpAl.id_ne_component = alr_qtd.id_ne_component and cmpAl.name = alr_qtd.name
										) as comp_alar
									group by id_ne_component, name
									order by min_alr, id_ne_component 
								) as cpa_aux, component_alarm as cpa

				where cpa.id_component_alarm > cpa_aux.min_alr and cpa.id_ne_component = cpa_aux.id_ne_component and cpa.name ilike cpa_aux.name 
order by cpa.id_component_alarm
);

delete from component_alarm 
where id_component_alarm in (
				select cpa.id_component_alarm from  (
									select MIN(id_component_alarm) as min_alr, id_ne_component, name from
										(
											select cmpAl.* from component_alarm as cmpAl
											inner join 
												(
												select alr_qtd.id_ne_component, alr_qtd.name from 
													(
													select id_ne_component, name, count(*) as qtd_alarm
													from component_alarm
													group by id_ne_component, name
													HAVING count(*) > 1
													order by qtd_alarm
													) as alr_qtd
												) as alr_qtd
											on cmpAl.id_ne_component = alr_qtd.id_ne_component and cmpAl.name = alr_qtd.name
										) as comp_alar
									group by id_ne_component, name
									order by min_alr, id_ne_component 
								) as cpa_aux, component_alarm as cpa

				where cpa.id_component_alarm > cpa_aux.min_alr and cpa.id_ne_component = cpa_aux.id_ne_component and cpa.name ilike cpa_aux.name 
order by cpa.id_component_alarm
);
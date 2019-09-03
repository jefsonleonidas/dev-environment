select ndt.name, ndt.id_node_data_template, ndt.id_data_unit_template, sct.id_sync_config_template
from
(
	select *
	from
	(
		select id_node_data_template, name
		from node_data_template
		where name in ('fwCommAdaptiveModulation', 'fw3dOperMdmEthShare') 
	) as ndt
	inner join
	(
		select id_data_unit_template, id_node_data_template as node_data_template_du
		from data_unit_template
	) as dut
	on ndt.id_node_data_template = dut.node_data_template_du
) as ndt
inner join
(
	select id_sync_config_template, id_node_data_template
	from sync_config_template
) as sct
on sct.id_node_data_template = ndt.id_node_data_template
order by sct.id_sync_config_template
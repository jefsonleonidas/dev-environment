select tim.name, ins.name from
(select id_component_template, name from component_alarm_tim where id_component_template in (185,205)) as tim
right join
(select id_component_template, name from component_alarm_template where id_component_template in (185,205)) as ins
on tim.name ilike ins.name
where tim.name is null
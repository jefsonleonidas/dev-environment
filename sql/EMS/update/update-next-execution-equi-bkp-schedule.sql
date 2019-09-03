update equipment_backup_schedule set next_execution = (SELECT EXTRACT(EPOCH FROM TIMESTAMP '2017-06-26 16:33:33.849699-03') * 1000)
where id_component in (select id_ne_component from ne_component where description ilike 'Radio 2200 - 3D');

--select now();
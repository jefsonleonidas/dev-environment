select to_timestamp(ep.date/1000) as date, ep.status, ep.name, ep.id_ne_component, ne.name 
from equipment_performance as ep
join ne_component as ne
on ne.id_ne_component = ep.id_ne_component
order by ep.status
select ne.id_ne_component, ne.name, iv.number, iv.status
from ne_component as ne
inner join link_inventory as li
on li.id_physical_inventory = ne.id_physical_inventory
inner join interface_inventory as iv
on iv.id_link_inventory = li.id_link_inventory
where iv.type = 10 and ne.name ilike '241'
order by iv.number

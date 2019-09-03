SELECT a.description,
    a.location,
    a.total_equipments,
    ( SELECT count(ne.id_ne_component) AS count
           FROM ne_component ne
             JOIN physical_inventory pi ON pi.id_physical_inventory = ne.id_physical_inventory
             JOIN link_inventory li ON li.id_physical_inventory = pi.id_physical_inventory
          WHERE ne.description::text = a.description::text AND pi.location::text = a.location::text AND (( SELECT count(ii.id_interface_inventory) AS count
                   FROM interface_inventory ii
                  WHERE ii.id_link_inventory = li.id_link_inventory AND ii.status = 10)) > 0) AS total_connected_link,
    ( SELECT count(ne.id_ne_component) AS count
           FROM ne_component ne
             JOIN physical_inventory pi ON pi.id_physical_inventory = ne.id_physical_inventory
             JOIN link_inventory li ON li.id_physical_inventory = pi.id_physical_inventory
          WHERE ne.description::text = a.description::text AND pi.location::text = a.location::text) AS total_link,
    a.alias,

	(SELECT CASE WHEN get_total_interfaces(a.description) IS NULL THEN 
		(SELECT count(ii.id_interface_inventory) AS count
		FROM interface_inventory ii
		JOIN link_inventory li ON li.id_link_inventory = ii.id_link_inventory
		JOIN physical_inventory pi ON pi.id_physical_inventory = li.id_physical_inventory
		JOIN ne_component ne ON ne.id_physical_inventory = pi.id_physical_inventory
		WHERE ii.status <> 50 AND ne.description::text = a.description::text AND pi.location::text = a.location::text)
		ELSE get_total_interfaces(a.description) END) AS total_interfaces,

    ( SELECT count(ii.id_interface_inventory) AS count
           FROM interface_inventory ii
             JOIN link_inventory li ON li.id_link_inventory = ii.id_link_inventory
             JOIN physical_inventory pi ON pi.id_physical_inventory = li.id_physical_inventory
             JOIN ne_component ne ON ne.id_physical_inventory = pi.id_physical_inventory
          WHERE ii.status <> 0 AND ii.status <> 50 AND ne.description::text = a.description::text AND pi.location::text = a.location::text) AS total_interfaces_in_use
   FROM ( SELECT count(ne.description) AS total_equipments,
            ne.description,
            pi.location,
            ne.alias
           FROM ne_component ne
             JOIN physical_inventory pi ON pi.id_physical_inventory = ne.id_physical_inventory
          GROUP BY ne.description, pi.location, ne.alias) a;


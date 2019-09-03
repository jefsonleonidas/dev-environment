SELECT ne_odu.id_ne_component
	, ne_odu.id_inventory
	, ne_odu.id_ne_component_parent
	, ne_odu.name AS node_label, '-'::character varying AS radio_id, '-'::character varying AS radio_dev_id
	, ne_odu.alias AS product, inv_odu.node_model, '-'::character varying AS ip, '-'::character varying AS parent_ip
	, '-'::character varying AS city, '-'::character varying AS state, '-'::character varying AS domain
	, '-'::character varying AS region, '-'::character varying AS location, rad_inv_odu.hardware_version AS firmware_version
	, rad_inv_odu.software_version, rad_inv_odu.odu_band AS odu_frequency
	, '-'::character varying AS bord_type_slot__1
	, '-'::character varying AS bord_type_slot__2
	, '-'::character varying AS bord_type_slot__3
	, '-'::character varying AS bord_type_slot__4
	, '-'::character varying AS bord_type_slot__5
	, '-'::character varying AS bord_type_slot__6
	, '-'::character varying AS bord_type_slot__7
	, '-'::character varying AS bord_type_slot__8
	, '-'::character varying AS bord_type_slot__9
	, '-'::character varying AS bord_type_slot__10
	, '-'::character varying AS bord_type_slot__11
	, '-'::character varying AS bord_type_slot__12


FROM ne_component AS ne_odu

INNER JOIN ne_component AS ne_odu_parent
ON ne_odu.id_ne_component_parent = ne_odu_parent.id_ne_component

INNER JOIN inventory AS inv_odu
ON inv_odu.id_inventory = ne_odu.id_inventory

INNER JOIN radio_3d_odu_inventory AS rad_inv_odu
ON inv_odu.id_inventory = rad_inv_odu.id_inventory

WHERE ne_odu.alias ILIKE 'ODU_3D'
ORDER BY ne_odu.id_ne_component, ne_odu.name

-- SELECT * FROM ne_component WHERE alias ILIKE 'ODU_3D'
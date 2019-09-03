 SELECT ne.id_ne_component,
    ne.id_inventory,
    ne.id_ne_component_parent,
        CASE
            WHEN ne.id_ne_component_parent IS NOT NULL THEN ( SELECT ne_component.name
               FROM ne_component
              WHERE ne_component.id_ne_component = ne.id_ne_component_parent)
            ELSE '-'::character varying
        END AS parent_label,
    ne.name AS node_label,
        CASE
            WHEN ph.address IS NULL OR ph.address::text ~~* ''::text THEN '1'::character varying
            ELSE ph.address
        END AS radio_id,
    '1'::character varying AS radio_dev_id,
    ne.description AS product,
    inv.node_model,
        CASE
            WHEN ne.id_ne_agent IS NOT NULL THEN na.ip
            ELSE NULL::character varying
        END AS ip,
        CASE
            WHEN ne.id_ne_agent IS NOT NULL THEN '-'::character varying
            ELSE na.ip
        END AS parent_ip,
        CASE
            WHEN ph.city::text = ''::text THEN '-'::character varying
            ELSE ph.city
        END AS city,
        CASE
            WHEN ph.state::text = ''::text THEN '-'::character varying
            ELSE ph.state
        END AS state,
        CASE
            WHEN ph.domain::text = ''::text THEN '-'::character varying
            ELSE ph.domain
        END AS domain,
        CASE
            WHEN ph.region::text = ''::text THEN '-'::character varying
            ELSE ph.region
        END AS region,
        CASE
            WHEN ph.location::text = ''::text THEN '-'::character varying
            ELSE ph.location
        END AS location,
        CASE
            WHEN ne.mngt_start_date > 0::numeric THEN ne.mngt_start_date
            ELSE 0::numeric
        END AS mngt_start_date,
    inv.software_version AS software_version_main_unit,
        CASE
            WHEN rad_inv.composition_board_type_slot_1 IS NULL THEN 'Empty'::character varying
            WHEN rad_inv.composition_board_type_slot_1 = 1 THEN 'Main Unit'::character varying
            WHEN rad_inv.composition_board_type_slot_1 = 2 THEN 'Pwr Supply 48V'::character varying
            WHEN rad_inv.composition_board_type_slot_1 = 3 THEN 'IDU Intfc'::character varying
            WHEN rad_inv.composition_board_type_slot_1 = 4 THEN 'Alm Intfc'::character varying
            WHEN rad_inv.composition_board_type_slot_1 = 5 THEN 'Exp 16 E1'::character varying
            WHEN rad_inv.composition_board_type_slot_1 = 6 THEN 'Exp 24 E1'::character varying
            WHEN rad_inv.composition_board_type_slot_1 = 7 THEN 'Eth Exp'::character varying
            WHEN rad_inv.composition_board_type_slot_1 = 8 THEN 'Sync E'::character varying
            WHEN rad_inv.composition_board_type_slot_1 = 9 THEN 'IDU Exp'::character varying
            WHEN rad_inv.composition_board_type_slot_1 = 10 THEN 'Motherboard'::character varying
            WHEN rad_inv.composition_board_type_slot_1 = 11 THEN 'Main Unit 1p1'::character varying
            WHEN rad_inv.composition_board_type_slot_1 = 12 THEN 'Pwr Supply 24V'::character varying
            WHEN rad_inv.composition_board_type_slot_1 = 13 THEN 'ODU'::character varying
            WHEN rad_inv.composition_board_type_slot_1 = 19 THEN 'Unknown'::character varying
            ELSE 'Empty'::character varying
        END AS board_type_slot_1,
    rad_inv.serial_number_slot_1,
    rad_inv.product_code_number_slot_1,
        CASE
            WHEN rad_inv.composition_board_type_slot_2 IS NULL THEN 'Empty'::character varying
            WHEN rad_inv.composition_board_type_slot_2 = 1 THEN 'Main Unit'::character varying
            WHEN rad_inv.composition_board_type_slot_2 = 2 THEN 'Pwr Supply 48V'::character varying
            WHEN rad_inv.composition_board_type_slot_2 = 3 THEN 'IDU Intfc'::character varying
            WHEN rad_inv.composition_board_type_slot_2 = 4 THEN 'Alm Intfc'::character varying
            WHEN rad_inv.composition_board_type_slot_2 = 5 THEN 'Exp 16 E1'::character varying
            WHEN rad_inv.composition_board_type_slot_2 = 6 THEN 'Exp 24 E1'::character varying
            WHEN rad_inv.composition_board_type_slot_2 = 7 THEN 'Eth Exp'::character varying
            WHEN rad_inv.composition_board_type_slot_2 = 8 THEN 'Sync E'::character varying
            WHEN rad_inv.composition_board_type_slot_2 = 9 THEN 'IDU Exp'::character varying
            WHEN rad_inv.composition_board_type_slot_2 = 10 THEN 'Motherboard'::character varying
            WHEN rad_inv.composition_board_type_slot_2 = 11 THEN 'Main Unit 1p1'::character varying
            WHEN rad_inv.composition_board_type_slot_2 = 12 THEN 'Pwr Supply 24V'::character varying
            WHEN rad_inv.composition_board_type_slot_2 = 13 THEN 'ODU'::character varying
            WHEN rad_inv.composition_board_type_slot_2 = 19 THEN 'Unknown'::character varying
            ELSE 'Empty'::character varying
        END AS board_type_slot_2,
    rad_inv.serial_number_slot_2,
    rad_inv.product_code_number_slot_2,
        CASE
            WHEN rad_inv.composition_board_type_slot_3 IS NULL THEN 'Empty'::character varying
            WHEN rad_inv.composition_board_type_slot_3 = 1 THEN 'Main Unit'::character varying
            WHEN rad_inv.composition_board_type_slot_3 = 2 THEN 'Pwr Supply 48V'::character varying
            WHEN rad_inv.composition_board_type_slot_3 = 3 THEN 'IDU Intfc'::character varying
            WHEN rad_inv.composition_board_type_slot_3 = 4 THEN 'Alm Intfc'::character varying
            WHEN rad_inv.composition_board_type_slot_3 = 5 THEN 'Exp 16 E1'::character varying
            WHEN rad_inv.composition_board_type_slot_3 = 6 THEN 'Exp 24 E1'::character varying
            WHEN rad_inv.composition_board_type_slot_3 = 7 THEN 'Eth Exp'::character varying
            WHEN rad_inv.composition_board_type_slot_3 = 8 THEN 'Sync E'::character varying
            WHEN rad_inv.composition_board_type_slot_3 = 9 THEN 'IDU Exp'::character varying
            WHEN rad_inv.composition_board_type_slot_3 = 10 THEN 'Motherboard'::character varying
            WHEN rad_inv.composition_board_type_slot_3 = 11 THEN 'Main Unit 1p1'::character varying
            WHEN rad_inv.composition_board_type_slot_3 = 12 THEN 'Pwr Supply 24V'::character varying
            WHEN rad_inv.composition_board_type_slot_3 = 13 THEN 'ODU'::character varying
            WHEN rad_inv.composition_board_type_slot_3 = 19 THEN 'Unknown'::character varying
            ELSE 'Empty'::character varying
        END AS board_type_slot_3,
    rad_inv.serial_number_slot_3,
    rad_inv.product_code_number_slot_3,
        CASE
            WHEN rad_inv.composition_board_type_slot_4 IS NULL THEN 'Empty'::character varying
            WHEN rad_inv.composition_board_type_slot_4 = 1 THEN 'Main Unit'::character varying
            WHEN rad_inv.composition_board_type_slot_4 = 2 THEN 'Pwr Supply 48V'::character varying
            WHEN rad_inv.composition_board_type_slot_4 = 3 THEN 'IDU Intfc'::character varying
            WHEN rad_inv.composition_board_type_slot_4 = 4 THEN 'Alm Intfc'::character varying
            WHEN rad_inv.composition_board_type_slot_4 = 5 THEN 'Exp 16 E1'::character varying
            WHEN rad_inv.composition_board_type_slot_4 = 6 THEN 'Exp 24 E1'::character varying
            WHEN rad_inv.composition_board_type_slot_4 = 7 THEN 'Eth Exp'::character varying
            WHEN rad_inv.composition_board_type_slot_4 = 8 THEN 'Sync E'::character varying
            WHEN rad_inv.composition_board_type_slot_4 = 9 THEN 'IDU Exp'::character varying
            WHEN rad_inv.composition_board_type_slot_4 = 10 THEN 'Motherboard'::character varying
            WHEN rad_inv.composition_board_type_slot_4 = 11 THEN 'Main Unit 1p1'::character varying
            WHEN rad_inv.composition_board_type_slot_4 = 12 THEN 'Pwr Supply 24V'::character varying
            WHEN rad_inv.composition_board_type_slot_4 = 13 THEN 'ODU'::character varying
            WHEN rad_inv.composition_board_type_slot_4 = 19 THEN 'Unknown'::character varying
            ELSE 'Empty'::character varying
        END AS board_type_slot_4,
    rad_inv.serial_number_slot_4,
    rad_inv.product_code_number_slot_4,
        CASE
            WHEN rad_inv.composition_board_type_slot_5 IS NULL THEN 'Empty'::character varying
            WHEN rad_inv.composition_board_type_slot_5 = 1 THEN 'Main Unit'::character varying
            WHEN rad_inv.composition_board_type_slot_5 = 2 THEN 'Pwr Supply 48V'::character varying
            WHEN rad_inv.composition_board_type_slot_5 = 3 THEN 'IDU Intfc'::character varying
            WHEN rad_inv.composition_board_type_slot_5 = 4 THEN 'Alm Intfc'::character varying
            WHEN rad_inv.composition_board_type_slot_5 = 5 THEN 'Exp 16 E1'::character varying
            WHEN rad_inv.composition_board_type_slot_5 = 6 THEN 'Exp 24 E1'::character varying
            WHEN rad_inv.composition_board_type_slot_5 = 7 THEN 'Eth Exp'::character varying
            WHEN rad_inv.composition_board_type_slot_5 = 8 THEN 'Sync E'::character varying
            WHEN rad_inv.composition_board_type_slot_5 = 9 THEN 'IDU Exp'::character varying
            WHEN rad_inv.composition_board_type_slot_5 = 10 THEN 'Motherboard'::character varying
            WHEN rad_inv.composition_board_type_slot_5 = 11 THEN 'Main Unit 1p1'::character varying
            WHEN rad_inv.composition_board_type_slot_5 = 12 THEN 'Pwr Supply 24V'::character varying
            WHEN rad_inv.composition_board_type_slot_5 = 13 THEN 'ODU'::character varying
            WHEN rad_inv.composition_board_type_slot_5 = 19 THEN 'Unknown'::character varying
            ELSE 'Empty'::character varying
        END AS board_type_slot_5,
    rad_inv.serial_number_slot_5,
    rad_inv.product_code_number_slot_5,
        CASE
            WHEN rad_inv.composition_board_type_slot_6 IS NULL THEN 'Empty'::character varying
            WHEN rad_inv.composition_board_type_slot_6 = 1 THEN 'Main Unit'::character varying
            WHEN rad_inv.composition_board_type_slot_6 = 2 THEN 'Pwr Supply 48V'::character varying
            WHEN rad_inv.composition_board_type_slot_6 = 3 THEN 'IDU Intfc'::character varying
            WHEN rad_inv.composition_board_type_slot_6 = 4 THEN 'Alm Intfc'::character varying
            WHEN rad_inv.composition_board_type_slot_6 = 5 THEN 'Exp 16 E1'::character varying
            WHEN rad_inv.composition_board_type_slot_6 = 6 THEN 'Exp 24 E1'::character varying
            WHEN rad_inv.composition_board_type_slot_6 = 7 THEN 'Eth Exp'::character varying
            WHEN rad_inv.composition_board_type_slot_6 = 8 THEN 'Sync E'::character varying
            WHEN rad_inv.composition_board_type_slot_6 = 9 THEN 'IDU Exp'::character varying
            WHEN rad_inv.composition_board_type_slot_6 = 10 THEN 'Motherboard'::character varying
            WHEN rad_inv.composition_board_type_slot_6 = 11 THEN 'Main Unit 1p1'::character varying
            WHEN rad_inv.composition_board_type_slot_6 = 12 THEN 'Pwr Supply 24V'::character varying
            WHEN rad_inv.composition_board_type_slot_6 = 13 THEN 'ODU'::character varying
            WHEN rad_inv.composition_board_type_slot_6 = 19 THEN 'Unknown'::character varying
            ELSE 'Empty'::character varying
        END AS board_type_slot_6,
    rad_inv.serial_number_slot_6,
    rad_inv.product_code_number_slot_6,
        CASE
            WHEN rad_inv.composition_board_type_slot_7 IS NULL THEN 'Empty'::character varying
            WHEN rad_inv.composition_board_type_slot_7 = 1 THEN 'Main Unit'::character varying
            WHEN rad_inv.composition_board_type_slot_7 = 2 THEN 'Pwr Supply 48V'::character varying
            WHEN rad_inv.composition_board_type_slot_7 = 3 THEN 'IDU Intfc'::character varying
            WHEN rad_inv.composition_board_type_slot_7 = 4 THEN 'Alm Intfc'::character varying
            WHEN rad_inv.composition_board_type_slot_7 = 5 THEN 'Exp 16 E1'::character varying
            WHEN rad_inv.composition_board_type_slot_7 = 6 THEN 'Exp 24 E1'::character varying
            WHEN rad_inv.composition_board_type_slot_7 = 7 THEN 'Eth Exp'::character varying
            WHEN rad_inv.composition_board_type_slot_7 = 8 THEN 'Sync E'::character varying
            WHEN rad_inv.composition_board_type_slot_7 = 9 THEN 'IDU Exp'::character varying
            WHEN rad_inv.composition_board_type_slot_7 = 10 THEN 'Motherboard'::character varying
            WHEN rad_inv.composition_board_type_slot_7 = 11 THEN 'Main Unit 1p1'::character varying
            WHEN rad_inv.composition_board_type_slot_7 = 12 THEN 'Pwr Supply 24V'::character varying
            WHEN rad_inv.composition_board_type_slot_7 = 13 THEN 'ODU'::character varying
            WHEN rad_inv.composition_board_type_slot_7 = 19 THEN 'Unknown'::character varying
            ELSE 'Empty'::character varying
        END AS board_type_slot_7,
    rad_inv.serial_number_slot_7,
    rad_inv.product_code_number_slot_7,
        CASE
            WHEN rad_inv.composition_board_type_slot_8 IS NULL THEN 'Empty'::character varying
            WHEN rad_inv.composition_board_type_slot_8 = 1 THEN 'Main Unit'::character varying
            WHEN rad_inv.composition_board_type_slot_8 = 2 THEN 'Pwr Supply 48V'::character varying
            WHEN rad_inv.composition_board_type_slot_8 = 3 THEN 'IDU Intfc'::character varying
            WHEN rad_inv.composition_board_type_slot_8 = 4 THEN 'Alm Intfc'::character varying
            WHEN rad_inv.composition_board_type_slot_8 = 5 THEN 'Exp 16 E1'::character varying
            WHEN rad_inv.composition_board_type_slot_8 = 6 THEN 'Exp 24 E1'::character varying
            WHEN rad_inv.composition_board_type_slot_8 = 7 THEN 'Eth Exp'::character varying
            WHEN rad_inv.composition_board_type_slot_8 = 8 THEN 'Sync E'::character varying
            WHEN rad_inv.composition_board_type_slot_8 = 9 THEN 'IDU Exp'::character varying
            WHEN rad_inv.composition_board_type_slot_8 = 10 THEN 'Motherboard'::character varying
            WHEN rad_inv.composition_board_type_slot_8 = 11 THEN 'Main Unit 1p1'::character varying
            WHEN rad_inv.composition_board_type_slot_8 = 12 THEN 'Pwr Supply 24V'::character varying
            WHEN rad_inv.composition_board_type_slot_8 = 13 THEN 'ODU'::character varying
            WHEN rad_inv.composition_board_type_slot_8 = 19 THEN 'Unknown'::character varying
            ELSE 'Empty'::character varying
        END AS board_type_slot_8,
    rad_inv.serial_number_slot_8,
    rad_inv.product_code_number_slot_8,
        CASE
            WHEN rad_inv.composition_board_type_slot_9 IS NULL THEN 'Empty'::character varying
            WHEN rad_inv.composition_board_type_slot_9 = 1 THEN 'Main Unit'::character varying
            WHEN rad_inv.composition_board_type_slot_9 = 2 THEN 'Pwr Supply 48V'::character varying
            WHEN rad_inv.composition_board_type_slot_9 = 3 THEN 'IDU Intfc'::character varying
            WHEN rad_inv.composition_board_type_slot_9 = 4 THEN 'Alm Intfc'::character varying
            WHEN rad_inv.composition_board_type_slot_9 = 5 THEN 'Exp 16 E1'::character varying
            WHEN rad_inv.composition_board_type_slot_9 = 6 THEN 'Exp 24 E1'::character varying
            WHEN rad_inv.composition_board_type_slot_9 = 7 THEN 'Eth Exp'::character varying
            WHEN rad_inv.composition_board_type_slot_9 = 8 THEN 'Sync E'::character varying
            WHEN rad_inv.composition_board_type_slot_9 = 9 THEN 'IDU Exp'::character varying
            WHEN rad_inv.composition_board_type_slot_9 = 10 THEN 'Motherboard'::character varying
            WHEN rad_inv.composition_board_type_slot_9 = 11 THEN 'Main Unit 1p1'::character varying
            WHEN rad_inv.composition_board_type_slot_9 = 12 THEN 'Pwr Supply 24V'::character varying
            WHEN rad_inv.composition_board_type_slot_9 = 13 THEN 'ODU'::character varying
            WHEN rad_inv.composition_board_type_slot_9 = 19 THEN 'Unknown'::character varying
            ELSE 'Empty'::character varying
        END AS board_type_slot_9,
    rad_inv.serial_number_slot_9,
    rad_inv.product_code_number_slot_9,
        CASE
            WHEN rad_inv.composition_board_type_slot_10 IS NULL THEN 'Empty'::character varying
            WHEN rad_inv.composition_board_type_slot_10 = 1 THEN 'Main Unit'::character varying
            WHEN rad_inv.composition_board_type_slot_10 = 2 THEN 'Pwr Supply 48V'::character varying
            WHEN rad_inv.composition_board_type_slot_10 = 3 THEN 'IDU Intfc'::character varying
            WHEN rad_inv.composition_board_type_slot_10 = 4 THEN 'Alm Intfc'::character varying
            WHEN rad_inv.composition_board_type_slot_10 = 5 THEN 'Exp 16 E1'::character varying
            WHEN rad_inv.composition_board_type_slot_10 = 6 THEN 'Exp 24 E1'::character varying
            WHEN rad_inv.composition_board_type_slot_10 = 7 THEN 'Eth Exp'::character varying
            WHEN rad_inv.composition_board_type_slot_10 = 8 THEN 'Sync E'::character varying
            WHEN rad_inv.composition_board_type_slot_10 = 9 THEN 'IDU Exp'::character varying
            WHEN rad_inv.composition_board_type_slot_10 = 10 THEN 'Motherboard'::character varying
            WHEN rad_inv.composition_board_type_slot_10 = 11 THEN 'Main Unit 1p1'::character varying
            WHEN rad_inv.composition_board_type_slot_10 = 12 THEN 'Pwr Supply 24V'::character varying
            WHEN rad_inv.composition_board_type_slot_10 = 13 THEN 'ODU'::character varying
            WHEN rad_inv.composition_board_type_slot_10 = 19 THEN 'Unknown'::character varying
            ELSE 'Empty'::character varying
        END AS board_type_slot_10,
    rad_inv.serial_number_slot_10,
    rad_inv.product_code_number_slot_10,
        CASE
            WHEN rad_inv.composition_board_type_slot_11 IS NULL THEN 'Empty'::character varying
            WHEN rad_inv.composition_board_type_slot_11 = 1 THEN 'Main Unit'::character varying
            WHEN rad_inv.composition_board_type_slot_11 = 2 THEN 'Pwr Supply 48V'::character varying
            WHEN rad_inv.composition_board_type_slot_11 = 3 THEN 'IDU Intfc'::character varying
            WHEN rad_inv.composition_board_type_slot_11 = 4 THEN 'Alm Intfc'::character varying
            WHEN rad_inv.composition_board_type_slot_11 = 5 THEN 'Exp 16 E1'::character varying
            WHEN rad_inv.composition_board_type_slot_11 = 6 THEN 'Exp 24 E1'::character varying
            WHEN rad_inv.composition_board_type_slot_11 = 7 THEN 'Eth Exp'::character varying
            WHEN rad_inv.composition_board_type_slot_11 = 8 THEN 'Sync E'::character varying
            WHEN rad_inv.composition_board_type_slot_11 = 9 THEN 'IDU Exp'::character varying
            WHEN rad_inv.composition_board_type_slot_11 = 10 THEN 'Motherboard'::character varying
            WHEN rad_inv.composition_board_type_slot_11 = 11 THEN 'Main Unit 1p1'::character varying
            WHEN rad_inv.composition_board_type_slot_11 = 12 THEN 'Pwr Supply 24V'::character varying
            WHEN rad_inv.composition_board_type_slot_11 = 13 THEN 'ODU'::character varying
            WHEN rad_inv.composition_board_type_slot_11 = 19 THEN 'Unknown'::character varying
            ELSE 'Empty'::character varying
        END AS board_type_slot_11,
    rad_inv.serial_number_slot_11,
    rad_inv.product_code_number_slot_11,
        CASE
            WHEN rad_inv.composition_board_type_slot_12 IS NULL THEN 'Empty'::character varying
            WHEN rad_inv.composition_board_type_slot_12 = 1 THEN 'Main Unit'::character varying
            WHEN rad_inv.composition_board_type_slot_12 = 2 THEN 'Pwr Supply 48V'::character varying
            WHEN rad_inv.composition_board_type_slot_12 = 3 THEN 'IDU Intfc'::character varying
            WHEN rad_inv.composition_board_type_slot_12 = 4 THEN 'Alm Intfc'::character varying
            WHEN rad_inv.composition_board_type_slot_12 = 5 THEN 'Exp 16 E1'::character varying
            WHEN rad_inv.composition_board_type_slot_12 = 6 THEN 'Exp 24 E1'::character varying
            WHEN rad_inv.composition_board_type_slot_12 = 7 THEN 'Eth Exp'::character varying
            WHEN rad_inv.composition_board_type_slot_12 = 8 THEN 'Sync E'::character varying
            WHEN rad_inv.composition_board_type_slot_12 = 9 THEN 'IDU Exp'::character varying
            WHEN rad_inv.composition_board_type_slot_12 = 10 THEN 'Motherboard'::character varying
            WHEN rad_inv.composition_board_type_slot_12 = 11 THEN 'Main Unit 1p1'::character varying
            WHEN rad_inv.composition_board_type_slot_12 = 12 THEN 'Pwr Supply 24V'::character varying
            WHEN rad_inv.composition_board_type_slot_12 = 13 THEN 'ODU'::character varying
            WHEN rad_inv.composition_board_type_slot_12 = 19 THEN 'Unknown'::character varying
            ELSE 'Empty'::character varying
        END AS board_type_slot_12,
    rad_inv.serial_number_slot_12,
    rad_inv.product_code_number_slot_12,
    ( SELECT
                CASE
                    WHEN radio_3d_odu_inventory.tx_high_low IS NULL THEN NULL::character varying
                    WHEN radio_3d_odu_inventory.tx_high_low::text = '1'::text THEN 'TX high - RX low'::character varying
                    ELSE 'TX low  - RX high'::character varying
                END AS "case"
           FROM radio_3d_odu_inventory
          WHERE (radio_3d_odu_inventory.id_inventory IN ( SELECT ne_component.id_inventory
                   FROM ne_component
                  WHERE ne_component.description::text = 'ODU 1'::text AND ne_component.id_ne_component_parent = ne.id_ne_component))) AS transceptor_tx_odu_1,
    ( SELECT
                CASE
                    WHEN radio_3d_odu_inventory.tx_high_low IS NULL THEN NULL::character varying
                    WHEN radio_3d_odu_inventory.tx_high_low::text = '1'::text THEN 'TX high - RX low'::character varying
                    ELSE 'TX low  - RX high'::character varying
                END AS "case"
           FROM radio_3d_odu_inventory
          WHERE (radio_3d_odu_inventory.id_inventory IN ( SELECT ne_component.id_inventory
                   FROM ne_component
                  WHERE ne_component.description::text = 'ODU 2'::text AND ne_component.id_ne_component_parent = ne.id_ne_component))) AS transceptor_tx_odu_2,
	
	CASE
		WHEN (atp.security_term_cmd_ret ILIKE '4') THEN 'Unknwon'
		WHEN (
			(atp.protected_by_client = 1 AND atp.protected_by_link = 1)
			OR (
				(atp.protected_by_client = 1 OR atp.protected_by_link = 1)
				AND (atp.checking_time_period IS NULL OR atp.checking_time_period = 0)
			)
			OR (
				(atp.protected_by_client = 0 AND atp.protected_by_link = 0)
				AND (atp.checking_time_period IS NOT NULL AND atp.checking_time_period > 0)
			)


		) THEN 'Inconsistent'

		WHEN (atp.security_term_cmd_ret ILIKE '100') THEN 'Unknwon'
		WHEN ( atp.blocked_by_id_link = 1 OR atp.blocked_by_timeout = 1 OR atp.blocked_by_client = 1 ) THEN 'Blocked'
		WHEN ( atp.protected_by_link = 1 OR atp.protected_by_client = 1 ) THEN 'Protected'
		WHEN ((atp.enable_security = 0 AND (atp.protected_by_link = 0 AND atp.protected_by_link = 0 AND (atp.checking_time_period IS NULL OR atp.checking_time_period = 0) ))) THEN 'Unprotected'
		
		ELSE 'None' END AS node_status,

	CASE
		WHEN (atp.security_term_cmd_ret ILIKE '4') THEN 'Command signature wrong'
		WHEN (
			( atp.protected_by_client = 1 AND atp.protected_by_link = 1 )
			OR (
				( atp.protected_by_client = 1 OR atp.protected_by_link = 1 )
				AND ( atp.checking_time_period IS NULL OR atp.checking_time_period = 0 )
			)
			OR (
				(atp.protected_by_client = 0 AND atp.protected_by_link = 0)
				AND (atp.checking_time_period IS NOT NULL AND atp.checking_time_period > 0)
			)


		)THEN 'Protection is inconsistent, configuration is not supported by the system.'
	 
		WHEN (atp.security_term_cmd_ret ILIKE '100') THEN 'Current Status Unknown. Try again.'
		WHEN (atp.blocked_by_id_link = 1) THEN 'Blocked By ID Link'
		WHEN (atp.blocked_by_timeout = 1) THEN 'Blocked By Time Out'
		WHEN (atp.blocked_by_client = 1) THEN 'Blocked By ID Client'	
		WHEN ( (atp.enable_security = 1 AND atp.protected_by_client = 1) ) THEN 'Protected By ID Client'
		WHEN ( ( atp.enable_security = 1 AND atp.protected_by_link = 1) ) THEN 'Protected By ID Link'

		WHEN ( atp.protected_by_link = 0 AND atp.protected_by_link = 0 ) THEN 'Unprotected'

	ELSE 'None' END AS details,

	atp.checking_time_period AS period_in_hour, atp.time_remaining AS time_remaining_in_hour

   FROM ne_component ne
     JOIN equipment_anti_theft_protection atp ON atp.id_ne_component = ne.id_ne_component
     JOIN inventory inv ON inv.id_inventory = ne.id_inventory
     JOIN radio_3d_inventory rad_inv ON rad_inv.id_inventory = inv.id_inventory
     JOIN physical_inventory ph ON ne.id_physical_inventory = ph.id_physical_inventory
     JOIN ne_agent na ON ne.id_ne_agent = na.id_ne_agent OR na.id_ne_agent = (( SELECT ne_component.id_ne_agent
           FROM ne_component
          WHERE ne_component.id_ne_component = ne.id_ne_component_parent))
  WHERE ne.description::text ~~* 'Radio%3D'::text;


CREATE OR REPLACE FUNCTION includeFw3dAntiTheft() RETURNS VOID AS $$
DECLARE
	id_ne INTEGER;
BEGIN
	
	FOR id_ne in (SELECT id_ne_component FROM ne_component AS ne
		      INNER JOIN ne_agent_type AS at
		      ON ne.id_component_template = at.id_component_template
		      WHERE at.protection_provider IS NOT NULL
		      ORDER BY ne.id_ne_component)
	LOOP	


		INSERT INTO equipment_anti_theft_protection (id_equipment_anti_theft_protection, id_ne_component, enable_security, protection_type, protected_by_link, protected_by_client, blocked_by_id_link
								, blocked_by_timeout, blocked_by_client, blocked_by_flash_mem_error, checking_time_status, checking_time_period, time_remaining, client_key
								, unprotected_date, unprotected_reason, id_user, block_module, reset_period_count, clean_client_key, security_term_cmd_ret) 


		VALUES ((SELECT CASE WHEN MAX(id_equipment_anti_theft_protection) IS NULL THEN 1 ELSE MAX(id_equipment_anti_theft_protection)+1 END FROM equipment_anti_theft_protection)
		, id_ne, 0, NULL, 0, 0, 0, 0, 0, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
	
	END LOOP;
END;
$$ LANGUAGE plpgsql;
SELECT includeFw3dAntiTheft();
DROP FUNCTION includeFw3dAntiTheft();
SELECT public.update_id_seq();

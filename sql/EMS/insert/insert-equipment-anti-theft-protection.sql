select id_ne_component, name from ne_component where is_equipment = 1 and description ilike 'Radio%';

INSERT INTO equipment_anti_theft_protection (id_equipment_anti_theft_protection, id_ne_component, enable_security, protection_type, checking_time_status, checking_time_period, security_next_auth, client_key, security_term_write_client_key_ret, security_term_status_resum, security_term_cmd_ret, block_module, reset_period_count, clean_client_key) 
VALUES (1, 20, 1, 'G', 'D', 100, 0, '10203040112131411222324213233343', NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO equipment_anti_theft_protection (id_equipment_anti_theft_protection, id_ne_component, enable_security, protection_type, checking_time_status, checking_time_period, security_next_auth, client_key, security_term_write_client_key_ret, security_term_status_resum, security_term_cmd_ret, block_module, reset_period_count, clean_client_key) 
VALUES (2, 84, 1, 'G', 'D', 100, 0, '10203040112131411222324213233343', NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO equipment_anti_theft_protection (id_equipment_anti_theft_protection, id_ne_component, enable_security, protection_type, checking_time_status, checking_time_period, security_next_auth, client_key, security_term_write_client_key_ret, security_term_status_resum, security_term_cmd_ret, block_module, reset_period_count, clean_client_key) 
VALUES (3, 209, 1, 'G', 'D', 100, 0, '10203040112131411222324213233343', NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO equipment_anti_theft_protection (id_equipment_anti_theft_protection, id_ne_component, enable_security, protection_type, checking_time_status, checking_time_period, security_next_auth, client_key, security_term_write_client_key_ret, security_term_status_resum, security_term_cmd_ret, block_module, reset_period_count, clean_client_key) 
VALUES (4, 273, 1, 'G', 'D', 100, 0, '10203040112131411222324213233343', NULL, NULL, NULL, NULL, NULL, NULL);

SELECT * FROM equipment_anti_theft_protection;
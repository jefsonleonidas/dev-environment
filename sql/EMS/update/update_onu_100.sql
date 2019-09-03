CREATE OR REPLACE FUNCTION insert_data_component_alarm() RETURNS VOID AS $$
DECLARE
	registro INTEGER;
	
BEGIN
	
	FOR registro IN (SELECT n.id_ne_component
		FROM ( 
			SELECT id_ne_component, id_component_template
			FROM ne_component) as n
		INNER JOIN (
			SELECT id_component_template
			FROM component_template
			WHERE name ILIKE 'Radio2200') as c
		ON n.id_component_template = c.id_component_template) 

	LOOP

INSERT INTO node_data (id_node_data, name, id_ne_component, category, id_sync_policy, id_sync_status, id_node_data_template, sync_reader_component_name, sync_writer_component_name, last_update, last_fail, last_status_change, label, sync_response_handler_name, always_process_update, use_second_agent) 
VALUES ((SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_node_data) AS next_id FROM node_data) AS aux), 'onuIfInvInternalTemperature', registro, 60, 0, 1, NULL, 'br.com.asga.netmanager.domain.topology.equipment.sync.SnmpGetSyncEngine', NULL, NULL, NULL, NULL, 'onuIfInvInternalTemperature', NULL, f, 0);

INSERT INTO data_unit (id_data_unit, id_node_data, id_data_type, local_value, remote_value, committed_value, translation_rule, remote_converters, validators) 
VALUES ((SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_data_unit) AS next_id FROM data_unit) AS aux), (SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_node_data) + 1 AS next_id FROM node_data), 1, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO sync_config (id_sync_config, id_node_data, is_read, name, value)
VALUES ((SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_data_unit) + 1 AS next_id FROM data_unit) AS aux), (SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_node_data) + 1 AS next_id FROM node_data), 1, 'OID', '.1.3.6.1.4.1.3979.6.4.2.1.2.3.2.1.13.6103.2');



INSERT INTO node_data (id_node_data, name, id_ne_component, category, id_sync_policy, id_sync_status, id_node_data_template, sync_reader_component_name, sync_writer_component_name, last_update, last_fail, last_status_change, label, sync_response_handler_name, always_process_update, use_second_agent) 
VALUES ((SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_node_data) AS next_id FROM node_data) AS aux), 'onuIfInvSerialNumber', registro, 60, 0, 1, NULL, 'br.com.asga.netmanager.domain.topology.equipment.sync.SnmpGetSyncEngine', NULL, NULL, NULL, NULL, 'onuIfInvSerialNumber', NULL, f, 0);

INSERT INTO data_unit (id_data_unit, id_node_data, id_data_type, local_value, remote_value, committed_value, translation_rule, remote_converters, validators) 
VALUES ((SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_data_unit) AS next_id FROM data_unit) AS aux), (SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_node_data) + 1 AS next_id FROM node_data), 0, NULL, NULL, NULL, NULL, '#Tue Aug 23 09:47:48 BRT 2016
converters=1
', NULL);

INSERT INTO sync_config (id_sync_config, id_node_data, is_read, name, value)
VALUES ((SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_data_unit) + 1 AS next_id FROM data_unit) AS aux), (SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_node_data) + 1 AS next_id FROM node_data), 1, 'OID', '.1.3.6.1.4.1.3979.6.4.2.1.2.3.2.1.5.6103.2');



INSERT INTO node_data (id_node_data, name, id_ne_component, category, id_sync_policy, id_sync_status, id_node_data_template, sync_reader_component_name, sync_writer_component_name, last_update, last_fail, last_status_change, label, sync_response_handler_name, always_process_update, use_second_agent) 
VALUES ((SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_node_data) AS next_id FROM node_data) AS aux), 'onuIfInvRxInputPowerValue', registro, 60, 0, 1, NULL, 'br.com.asga.netmanager.domain.topology.equipment.sync.SnmpGetSyncEngine', NULL, NULL, NULL, NULL, 'onuIfInvRxInputPowerValue', NULL, f, 0);

INSERT INTO data_unit (id_data_unit, id_node_data, id_data_type, local_value, remote_value, committed_value, translation_rule, remote_converters, validators) 
VALUES ((SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_data_unit) AS next_id FROM data_unit) AS aux), (SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_node_data) + 1 AS next_id FROM node_data), 1, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO sync_config (id_sync_config, id_node_data, is_read, name, value)
VALUES ((SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_data_unit) + 1 AS next_id FROM data_unit) AS aux), (SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_node_data) + 1 AS next_id FROM node_data), 1, 'OID', '.1.3.6.1.4.1.3979.6.4.2.1.2.3.2.1.15.6103.2');



INSERT INTO node_data (id_node_data, name, id_ne_component, category, id_sync_policy, id_sync_status, id_node_data_template, sync_reader_component_name, sync_writer_component_name, last_update, last_fail, last_status_change, label, sync_response_handler_name, always_process_update, use_second_agent) 
VALUES ((SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_node_data) AS next_id FROM node_data) AS aux), 'onuIfInvLinkLengthToFiber9div125Km', registro, 60, 0, 1, NULL, 'br.com.asga.netmanager.domain.topology.equipment.sync.SnmpGetSyncEngine', NULL, NULL, NULL, NULL, 'onuIfInvLinkLengthToFiber9div125Km', NULL, f, 0);

INSERT INTO data_unit (id_data_unit, id_node_data, id_data_type, local_value, remote_value, committed_value, translation_rule, remote_converters, validators) 
VALUES ((SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_data_unit) AS next_id FROM data_unit) AS aux), (SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_node_data) + 1 AS next_id FROM node_data), 1, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO sync_config (id_sync_config, id_node_data, is_read, name, value)
VALUES ((SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_data_unit) + 1 AS next_id FROM data_unit) AS aux), (SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_node_data) + 1 AS next_id FROM node_data), 1, 'OID', '.1.3.6.1.4.1.3979.6.4.2.1.2.3.2.1.11.6103.2');



INSERT INTO node_data (id_node_data, name, id_ne_component, category, id_sync_policy, id_sync_status, id_node_data_template, sync_reader_component_name, sync_writer_component_name, last_update, last_fail, last_status_change, label, sync_response_handler_name, always_process_update, use_second_agent) 
VALUES ((SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_node_data) AS next_id FROM node_data) AS aux), 'onuIfInvLinkLengthToFiber62dot5div125', registro, 60, 0, 1, NULL, 'br.com.asga.netmanager.domain.topology.equipment.sync.SnmpGetSyncEngine', NULL, NULL, NULL, NULL, 'onuIfInvLinkLengthToFiber62dot5div125', NULL, f, 0);

INSERT INTO data_unit (id_data_unit, id_node_data, id_data_type, local_value, remote_value, committed_value, translation_rule, remote_converters, validators) 
VALUES ((SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_data_unit) AS next_id FROM data_unit) AS aux), (SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_node_data) + 1 AS next_id FROM node_data), 1, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO sync_config (id_sync_config, id_node_data, is_read, name, value)
VALUES ((SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_data_unit) + 1 AS next_id FROM data_unit) AS aux), (SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_node_data) + 1 AS next_id FROM node_data), 1, 'OID', '.1.3.6.1.4.1.3979.6.4.2.1.2.3.2.1.9.6103.2');



INSERT INTO node_data (id_node_data, name, id_ne_component, category, id_sync_policy, id_sync_status, id_node_data_template, sync_reader_component_name, sync_writer_component_name, last_update, last_fail, last_status_change, label, sync_response_handler_name, always_process_update, use_second_agent) 
VALUES ((SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_node_data) AS next_id FROM node_data) AS aux), 'onuIfInvManufactureDate', registro, 60, 0, 1, NULL, 'br.com.asga.netmanager.domain.topology.equipment.sync.SnmpGetSyncEngine', NULL, NULL, NULL, NULL, 'onuIfInvManufactureDate', NULL, f, 0);

INSERT INTO data_unit (id_data_unit, id_node_data, id_data_type, local_value, remote_value, committed_value, translation_rule, remote_converters, validators) 
VALUES ((SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_data_unit) AS next_id FROM data_unit) AS aux), (SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_node_data) + 1 AS next_id FROM node_data), 0, NULL, NULL, NULL, NULL, '#Tue Aug 23 09:47:48 BRT 2016
converters=1
', NULL);

INSERT INTO sync_config (id_sync_config, id_node_data, is_read, name, value)
VALUES ((SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_data_unit) + 1 AS next_id FROM data_unit) AS aux), (SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_node_data) + 1 AS next_id FROM node_data), 1, 'OID', '.1.3.6.1.4.1.3979.6.4.2.1.2.3.2.1.6.6103.2');



INSERT INTO node_data (id_node_data, name, id_ne_component, category, id_sync_policy, id_sync_status, id_node_data_template, sync_reader_component_name, sync_writer_component_name, last_update, last_fail, last_status_change, label, sync_response_handler_name, always_process_update, use_second_agent) 
VALUES ((SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_node_data) AS next_id FROM node_data) AS aux), 'onuIfInvNominalBitRate', registro, 60, 0, 1, NULL, 'br.com.asga.netmanager.domain.topology.equipment.sync.SnmpGetSyncEngine', NULL, NULL, NULL, NULL, 'onuIfInvNominalBitRate', NULL, f, 0);

INSERT INTO data_unit (id_data_unit, id_node_data, id_data_type, local_value, remote_value, committed_value, translation_rule, remote_converters, validators) 
VALUES ((SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_data_unit) AS next_id FROM data_unit) AS aux), (SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_node_data) + 1 AS next_id FROM node_data), 1, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO sync_config (id_sync_config, id_node_data, is_read, name, value)
VALUES ((SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_data_unit) + 1 AS next_id FROM data_unit) AS aux), (SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_node_data) + 1 AS next_id FROM node_data), 1, 'OID', '.1.3.6.1.4.1.3979.6.4.2.1.2.3.2.1.7.6103.2');



INSERT INTO node_data (id_node_data, name, id_ne_component, category, id_sync_policy, id_sync_status, id_node_data_template, sync_reader_component_name, sync_writer_component_name, last_update, last_fail, last_status_change, label, sync_response_handler_name, always_process_update, use_second_agent) 
VALUES ((SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_node_data) AS next_id FROM node_data) AS aux), 'onuIfInvLastUpdate', registro, 60, 0, 1, NULL, 'br.com.asga.netmanager.domain.topology.equipment.sync.SnmpGetSyncEngine', NULL, NULL, NULL, NULL, 'onuIfInvLastUpdate', NULL, f, 0);

INSERT INTO data_unit (id_data_unit, id_node_data, id_data_type, local_value, remote_value, committed_value, translation_rule, remote_converters, validators) 
VALUES ((SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_data_unit) AS next_id FROM data_unit) AS aux), (SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_node_data) + 1 AS next_id FROM node_data), 0, NULL, NULL, NULL, NULL, '#Tue Aug 23 09:47:48 BRT 2016
converters=1
', NULL);

INSERT INTO sync_config (id_sync_config, id_node_data, is_read, name, value)
VALUES ((SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_data_unit) + 1 AS next_id FROM data_unit) AS aux), (SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_node_data) + 1 AS next_id FROM node_data), 1, 'OID', '.1.3.6.1.4.1.3979.6.4.2.1.2.3.2.1.1.6103.2');



INSERT INTO node_data (id_node_data, name, id_ne_component, category, id_sync_policy, id_sync_status, id_node_data_template, sync_reader_component_name, sync_writer_component_name, last_update, last_fail, last_status_change, label, sync_response_handler_name, always_process_update, use_second_agent) 
VALUES ((SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_node_data) AS next_id FROM node_data) AS aux), 'onuIfInvLinkLengthToFiber9div125', registro, 60, 0, 1, NULL, 'br.com.asga.netmanager.domain.topology.equipment.sync.SnmpGetSyncEngine', NULL, NULL, NULL, NULL, 'onuIfInvLinkLengthToFiber9div125', NULL, f, 0);

INSERT INTO data_unit (id_data_unit, id_node_data, id_data_type, local_value, remote_value, committed_value, translation_rule, remote_converters, validators) 
VALUES ((SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_data_unit) AS next_id FROM data_unit) AS aux), (SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_node_data) + 1 AS next_id FROM node_data), 1, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO sync_config (id_sync_config, id_node_data, is_read, name, value)
VALUES ((SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_data_unit) + 1 AS next_id FROM data_unit) AS aux), (SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_node_data) + 1 AS next_id FROM node_data), 1, 'OID', '.1.3.6.1.4.1.3979.6.4.2.1.2.3.2.1.10.6103.2');



INSERT INTO node_data (id_node_data, name, id_ne_component, category, id_sync_policy, id_sync_status, id_node_data_template, sync_reader_component_name, sync_writer_component_name, last_update, last_fail, last_status_change, label, sync_response_handler_name, always_process_update, use_second_agent) 
VALUES ((SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_node_data) AS next_id FROM node_data) AS aux), 'onuIfInvRevisionLevel', registro, 60, 0, 1, NULL, 'br.com.asga.netmanager.domain.topology.equipment.sync.SnmpGetSyncEngine', NULL, NULL, NULL, NULL, 'onuIfInvRevisionLevel', NULL, f, 0);

INSERT INTO data_unit (id_data_unit, id_node_data, id_data_type, local_value, remote_value, committed_value, translation_rule, remote_converters, validators) 
VALUES ((SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_data_unit) AS next_id FROM data_unit) AS aux), (SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_node_data) + 1 AS next_id FROM node_data), 0, NULL, NULL, NULL, NULL, '#Tue Aug 23 09:47:48 BRT 2016
converters=1
', NULL);

INSERT INTO sync_config (id_sync_config, id_node_data, is_read, name, value)
VALUES ((SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_data_unit) + 1 AS next_id FROM data_unit) AS aux), (SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_node_data) + 1 AS next_id FROM node_data), 1, 'OID', '.1.3.6.1.4.1.3979.6.4.2.1.2.3.2.1.4.6103.2');



INSERT INTO node_data (id_node_data, name, id_ne_component, category, id_sync_policy, id_sync_status, id_node_data_template, sync_reader_component_name, sync_writer_component_name, last_update, last_fail, last_status_change, label, sync_response_handler_name, always_process_update, use_second_agent) 
VALUES ((SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_node_data) AS next_id FROM node_data) AS aux), 'onuIfInvLaserWaveLength', registro, 60, 0, 1, NULL, 'br.com.asga.netmanager.domain.topology.equipment.sync.SnmpGetSyncEngine', NULL, NULL, NULL, NULL, 'onuIfInvLaserWaveLength', NULL, f, 0);

INSERT INTO data_unit (id_data_unit, id_node_data, id_data_type, local_value, remote_value, committed_value, translation_rule, remote_converters, validators) 
VALUES ((SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_data_unit) AS next_id FROM data_unit) AS aux), (SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_node_data) + 1 AS next_id FROM node_data), 1, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO sync_config (id_sync_config, id_node_data, is_read, name, value)
VALUES ((SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_data_unit) + 1 AS next_id FROM data_unit) AS aux), (SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_node_data) + 1 AS next_id FROM node_data), 1, 'OID', '.1.3.6.1.4.1.3979.6.4.2.1.2.3.2.1.12.6103.2');



INSERT INTO node_data (id_node_data, name, id_ne_component, category, id_sync_policy, id_sync_status, id_node_data_template, sync_reader_component_name, sync_writer_component_name, last_update, last_fail, last_status_change, label, sync_response_handler_name, always_process_update, use_second_agent) 
VALUES ((SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_node_data) AS next_id FROM node_data) AS aux), 'onuIfInvInternalVoltage', registro, 60, 0, 1, NULL, 'br.com.asga.netmanager.domain.topology.equipment.sync.SnmpGetSyncEngine', NULL, NULL, NULL, NULL, 'onuIfInvInternalVoltage', NULL, f, 0);

INSERT INTO data_unit (id_data_unit, id_node_data, id_data_type, local_value, remote_value, committed_value, translation_rule, remote_converters, validators) 
VALUES ((SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_data_unit) AS next_id FROM data_unit) AS aux), (SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_node_data) + 1 AS next_id FROM node_data), 1, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO sync_config (id_sync_config, id_node_data, is_read, name, value)
VALUES ((SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_data_unit) + 1 AS next_id FROM data_unit) AS aux), (SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_node_data) + 1 AS next_id FROM node_data), 1, 'OID', '.1.3.6.1.4.1.3979.6.4.2.1.2.3.2.1.17.6103.2');



INSERT INTO node_data (id_node_data, name, id_ne_component, category, id_sync_policy, id_sync_status, id_node_data_template, sync_reader_component_name, sync_writer_component_name, last_update, last_fail, last_status_change, label, sync_response_handler_name, always_process_update, use_second_agent) 
VALUES ((SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_node_data) AS next_id FROM node_data) AS aux), 'onuIfInvPartNumber', registro, 60, 0, 1, NULL, 'br.com.asga.netmanager.domain.topology.equipment.sync.SnmpGetSyncEngine', NULL, NULL, NULL, NULL, 'onuIfInvPartNumber', NULL, f, 0);

INSERT INTO data_unit (id_data_unit, id_node_data, id_data_type, local_value, remote_value, committed_value, translation_rule, remote_converters, validators) 
VALUES ((SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_data_unit) AS next_id FROM data_unit) AS aux), (SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_node_data) + 1 AS next_id FROM node_data), 0, NULL, NULL, NULL, NULL, '#Tue Aug 23 09:47:48 BRT 2016
converters=1
', NULL);

INSERT INTO sync_config (id_sync_config, id_node_data, is_read, name, value)
VALUES ((SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_data_unit) + 1 AS next_id FROM data_unit) AS aux), (SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_node_data) + 1 AS next_id FROM node_data), 1, 'OID', '.1.3.6.1.4.1.3979.6.4.2.1.2.3.2.1.3.6103.2');



INSERT INTO node_data (id_node_data, name, id_ne_component, category, id_sync_policy, id_sync_status, id_node_data_template, sync_reader_component_name, sync_writer_component_name, last_update, last_fail, last_status_change, label, sync_response_handler_name, always_process_update, use_second_agent) 
VALUES ((SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_node_data) AS next_id FROM node_data) AS aux), 'onuIfInvLinkLengthToFiber50div125', registro, 60, 0, 1, NULL, 'br.com.asga.netmanager.domain.topology.equipment.sync.SnmpGetSyncEngine', NULL, NULL, NULL, NULL, 'onuIfInvLinkLengthToFiber50div125', NULL, f, 0);

INSERT INTO data_unit (id_data_unit, id_node_data, id_data_type, local_value, remote_value, committed_value, translation_rule, remote_converters, validators) 
VALUES ((SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_data_unit) AS next_id FROM data_unit) AS aux), (SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_node_data) + 1 AS next_id FROM node_data), 1, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO sync_config (id_sync_config, id_node_data, is_read, name, value)
VALUES ((SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_data_unit) + 1 AS next_id FROM data_unit) AS aux), (SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_node_data) + 1 AS next_id FROM node_data), 1, 'OID', '.1.3.6.1.4.1.3979.6.4.2.1.2.3.2.1.8.6103.2');



INSERT INTO node_data (id_node_data, name, id_ne_component, category, id_sync_policy, id_sync_status, id_node_data_template, sync_reader_component_name, sync_writer_component_name, last_update, last_fail, last_status_change, label, sync_response_handler_name, always_process_update, use_second_agent) 
VALUES ((SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_node_data) AS next_id FROM node_data) AS aux), 'onuIfInvTxBiasValue', registro, 60, 0, 1, NULL, 'br.com.asga.netmanager.domain.topology.equipment.sync.SnmpGetSyncEngine', NULL, NULL, NULL, NULL, 'onuIfInvTxBiasValue', NULL, f, 0);

INSERT INTO data_unit (id_data_unit, id_node_data, id_data_type, local_value, remote_value, committed_value, translation_rule, remote_converters, validators) 
VALUES ((SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_data_unit) AS next_id FROM data_unit) AS aux), (SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_node_data) + 1 AS next_id FROM node_data), 1, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO sync_config (id_sync_config, id_node_data, is_read, name, value)
VALUES ((SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_data_unit) + 1 AS next_id FROM data_unit) AS aux), (SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_node_data) + 1 AS next_id FROM node_data), 1, 'OID', '.1.3.6.1.4.1.3979.6.4.2.1.2.3.2.1.16.6103.2');



INSERT INTO node_data (id_node_data, name, id_ne_component, category, id_sync_policy, id_sync_status, id_node_data_template, sync_reader_component_name, sync_writer_component_name, last_update, last_fail, last_status_change, label, sync_response_handler_name, always_process_update, use_second_agent) 
VALUES ((SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_node_data) AS next_id FROM node_data) AS aux), 'onuIfInvTxOutputPowerValue', registro, 60, 0, 1, NULL, 'br.com.asga.netmanager.domain.topology.equipment.sync.SnmpGetSyncEngine', NULL, NULL, NULL, NULL, 'onuIfInvTxOutputPowerValue', NULL, f, 0);

INSERT INTO data_unit (id_data_unit, id_node_data, id_data_type, local_value, remote_value, committed_value, translation_rule, remote_converters, validators) 
VALUES ((SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_data_unit) AS next_id FROM data_unit) AS aux), (SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_node_data) + 1 AS next_id FROM node_data), 1, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO sync_config (id_sync_config, id_node_data, is_read, name, value)
VALUES ((SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_data_unit) + 1 AS next_id FROM data_unit) AS aux), (SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_node_data) + 1 AS next_id FROM node_data), 1, 'OID', '.1.3.6.1.4.1.3979.6.4.2.1.2.3.2.1.14.6103.2');



INSERT INTO node_data (id_node_data, name, id_ne_component, category, id_sync_policy, id_sync_status, id_node_data_template, sync_reader_component_name, sync_writer_component_name, last_update, last_fail, last_status_change, label, sync_response_handler_name, always_process_update, use_second_agent) 
VALUES ((SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_node_data) AS next_id FROM node_data) AS aux), 'onuIfInvVendorName', registro, 60, 0, 1, NULL, 'br.com.asga.netmanager.domain.topology.equipment.sync.SnmpGetSyncEngine', NULL, NULL, NULL, NULL, 'onuIfInvVendorName', NULL, f, 0);

INSERT INTO data_unit (id_data_unit, id_node_data, id_data_type, local_value, remote_value, committed_value, translation_rule, remote_converters, validators) 
VALUES ((SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_data_unit) AS next_id FROM data_unit) AS aux), (SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_node_data) + 1 AS next_id FROM node_data), 0, NULL, NULL, NULL, NULL, '#Tue Aug 23 09:47:48 BRT 2016
converters=1
', NULL);

INSERT INTO sync_config (id_sync_config, id_node_data, is_read, name, value)
VALUES ((SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_data_unit) + 1 AS next_id FROM data_unit) AS aux), (SELECT CASE WHEN next_id IS NULL THEN 1 ELSE next_id END FROM ( SELECT MAX(id_node_data) + 1 AS next_id FROM node_data), 1, 'OID', '.1.3.6.1.4.1.3979.6.4.2.1.2.3.2.1.2.6103.2');
	 
	END LOOP;

END;
$$ LANGUAGE plpgsql;
SELECT insert_data_component_alarm();
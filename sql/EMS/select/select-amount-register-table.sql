SELECT * FROM (
SELECT 'agent_notification', COUNT(*) FROM agent_notification
UNION ALL
SELECT 'audit_category_enum', COUNT(*) FROM audit_category_enum
UNION ALL
SELECT 'async_msg_proc', COUNT(*) FROM async_msg_proc
UNION ALL
SELECT 'category_test', COUNT(*) FROM category_test
UNION ALL
SELECT 'client_permission', COUNT(*) FROM client_permission
UNION ALL
SELECT 'audit_type_enum', COUNT(*) FROM audit_type_enum
UNION ALL
SELECT 'component_alarm_template', COUNT(*) FROM component_alarm_template
UNION ALL
SELECT 'component_alarm', COUNT(*) FROM component_alarm
UNION ALL
SELECT 'client', COUNT(*) FROM client
UNION ALL
SELECT 'component_alarm_action_enum', COUNT(*) FROM component_alarm_action_enum
UNION ALL
SELECT 'agent_type_interface_enum', COUNT(*) FROM agent_type_interface_enum
UNION ALL
SELECT 'access_point', COUNT(*) FROM access_point
UNION ALL
SELECT 'component_template', COUNT(*) FROM component_template
UNION ALL
SELECT 'audit', COUNT(*) FROM audit
UNION ALL
SELECT 'component_alarm_history', COUNT(*) FROM component_alarm_history
UNION ALL
SELECT 'action_type_enum', COUNT(*) FROM action_type_enum
UNION ALL
SELECT 'conscius_parameter', COUNT(*) FROM conscius_parameter
UNION ALL
SELECT 'customer', COUNT(*) FROM customer
UNION ALL
SELECT 'equipment_backup', COUNT(*) FROM equipment_backup
UNION ALL
SELECT 'data_unit_remote_converter_enum', COUNT(*) FROM data_unit_remote_converter_enum
UNION ALL
SELECT 'data_unit_type_enum', COUNT(*) FROM data_unit_type_enum
UNION ALL
SELECT 'data_unit_validator_enum', COUNT(*) FROM data_unit_validator_enum
UNION ALL
SELECT 'dictionary_save_configuration', COUNT(*) FROM dictionary_save_configuration
UNION ALL
SELECT 'data_unit_history', COUNT(*) FROM data_unit_history
UNION ALL
SELECT 'equipment_test_template', COUNT(*) FROM equipment_test_template
UNION ALL
SELECT 'equipment_polling_demand', COUNT(*) FROM equipment_polling_demand
UNION ALL
SELECT 'event_listener_action', COUNT(*) FROM event_listener_action
UNION ALL
SELECT 'equipment_backup_schedule', COUNT(*) FROM equipment_backup_schedule
UNION ALL
SELECT 'event_log_category_enum', COUNT(*) FROM event_log_category_enum
UNION ALL
SELECT 'event_log_aprox_rows', COUNT(*) FROM event_log_aprox_rows
UNION ALL
SELECT 'event_listener_template', COUNT(*) FROM event_listener_template
UNION ALL
SELECT 'id_seq', COUNT(*) FROM id_seq
UNION ALL
SELECT 'event_log_operation_enum', COUNT(*) FROM event_log_operation_enum
UNION ALL
SELECT 'link', COUNT(*) FROM link
UNION ALL
SELECT 'link_inventory_template', COUNT(*) FROM link_inventory_template
UNION ALL
SELECT 'level_enum', COUNT(*) FROM level_enum
UNION ALL
SELECT 'identification_rule', COUNT(*) FROM identification_rule
UNION ALL
SELECT 'link_inventory', COUNT(*) FROM link_inventory
UNION ALL
SELECT 'link_component_alarm_template_event_listener_template', COUNT(*) FROM link_component_alarm_template_event_listener_template
UNION ALL
SELECT 'link_profile_operation', COUNT(*) FROM link_profile_operation
UNION ALL
SELECT 'link_interface_inventory_template_event_listener_template', COUNT(*) FROM link_interface_inventory_template_event_listener_template
UNION ALL
SELECT 'inventory_template', COUNT(*) FROM inventory_template
UNION ALL
SELECT 'link_slot_template_event_listener_template', COUNT(*) FROM link_slot_template_event_listener_template
UNION ALL
SELECT 'link_ne_component_component_alarm', COUNT(*) FROM link_ne_component_component_alarm
UNION ALL
SELECT 'node_data', COUNT(*) FROM node_data
UNION ALL
SELECT 'monitor_process', COUNT(*) FROM monitor_process
UNION ALL
SELECT 'network_symbol', COUNT(*) FROM network_symbol
UNION ALL
SELECT 'node_count_by_qtd_alarms', COUNT(*) FROM node_count_by_qtd_alarms
UNION ALL
SELECT 'ne_agent_type', COUNT(*) FROM ne_agent_type
UNION ALL
SELECT 'ne_component_ancestor', COUNT(*) FROM ne_component_ancestor
UNION ALL
SELECT 'ne_component_link', COUNT(*) FROM ne_component_link
UNION ALL
SELECT 'olt_bundle_local', COUNT(*) FROM olt_bundle_local
UNION ALL
SELECT 'olt_delivering_log', COUNT(*) FROM olt_delivering_log
UNION ALL
SELECT 'olt_interface', COUNT(*) FROM olt_interface
UNION ALL
SELECT 'node_notification', COUNT(*) FROM node_notification
UNION ALL
SELECT 'node_group_view', COUNT(*) FROM node_group_view
UNION ALL
SELECT 'onu_inventory', COUNT(*) FROM onu_inventory
UNION ALL
SELECT 'olt_interface_rule', COUNT(*) FROM olt_interface_rule
UNION ALL
SELECT 'olt_service', COUNT(*) FROM olt_service
UNION ALL
SELECT 'onu_interface_inventory', COUNT(*) FROM onu_interface_inventory
UNION ALL
SELECT 'olt_vlans_report', COUNT(*) FROM olt_vlans_report
UNION ALL
SELECT 'olt_interface_inventory', COUNT(*) FROM olt_interface_inventory
UNION ALL
SELECT 'olt_interface_mode_configuration', COUNT(*) FROM olt_interface_mode_configuration
UNION ALL
SELECT 'olt_profile', COUNT(*) FROM olt_profile
UNION ALL
SELECT 'olt_tributary', COUNT(*) FROM olt_tributary
UNION ALL
SELECT 'olt_profile_interface', COUNT(*) FROM olt_profile_interface
UNION ALL
SELECT 'olt_vlan', COUNT(*) FROM olt_vlan
UNION ALL
SELECT 'physical_inventory_summary_from_locations', COUNT(*) FROM physical_inventory_summary_from_locations
UNION ALL
SELECT 'physical_inventory_summary_from_maps', COUNT(*) FROM physical_inventory_summary_from_maps
UNION ALL
SELECT 'qrtz_cron_triggers', COUNT(*) FROM qrtz_cron_triggers
UNION ALL
SELECT 'qrtz_calendars', COUNT(*) FROM qrtz_calendars
UNION ALL
SELECT 'qrtz_simple_triggers', COUNT(*) FROM qrtz_simple_triggers
UNION ALL
SELECT 'qrtz_fired_triggers', COUNT(*) FROM qrtz_fired_triggers
UNION ALL
SELECT 'qrtz_locks', COUNT(*) FROM qrtz_locks
UNION ALL
SELECT 'qrtz_paused_trigger_grps', COUNT(*) FROM qrtz_paused_trigger_grps
UNION ALL
SELECT 'qrtz_scheduler_state', COUNT(*) FROM qrtz_scheduler_state
UNION ALL
SELECT 'qrtz_job_details', COUNT(*) FROM qrtz_job_details
UNION ALL
SELECT 'physical_inventory_template', COUNT(*) FROM physical_inventory_template
UNION ALL
SELECT 'qrtz_blob_triggers', COUNT(*) FROM qrtz_blob_triggers
UNION ALL
SELECT 'protocol_enum', COUNT(*) FROM protocol_enum
UNION ALL
SELECT 'protocol_version_enum', COUNT(*) FROM protocol_version_enum
UNION ALL
SELECT 'policy_definition', COUNT(*) FROM policy_definition
UNION ALL
SELECT 'routing_property', COUNT(*) FROM routing_property
UNION ALL
SELECT 'slot_config_template', COUNT(*) FROM slot_config_template
UNION ALL
SELECT 'submodule_config_template', COUNT(*) FROM submodule_config_template
UNION ALL
SELECT 'slot_type_template', COUNT(*) FROM slot_type_template
UNION ALL
SELECT 'schema_version', COUNT(*) FROM schema_version
UNION ALL
SELECT 'slot_status_enum', COUNT(*) FROM slot_status_enum
UNION ALL
SELECT 'sync_config_template', COUNT(*) FROM sync_config_template
UNION ALL
SELECT 'sync_config', COUNT(*) FROM sync_config
UNION ALL
SELECT 'qrtz_triggers', COUNT(*) FROM qrtz_triggers
UNION ALL
SELECT 'qrtz_simprop_triggers', COUNT(*) FROM qrtz_simprop_triggers
UNION ALL
SELECT 'sync_status_enum', COUNT(*) FROM sync_status_enum
UNION ALL
SELECT 'sync_policy_enum', COUNT(*) FROM sync_policy_enum
UNION ALL
SELECT 'symbol', COUNT(*) FROM symbol
UNION ALL
SELECT 'trap_event_listener_property', COUNT(*) FROM trap_event_listener_property
UNION ALL
SELECT 'system_notification', COUNT(*) FROM system_notification
UNION ALL
SELECT 'table_policy', COUNT(*) FROM table_policy
UNION ALL
SELECT 'trap_event_listener_action', COUNT(*) FROM trap_event_listener_action
UNION ALL
SELECT 'virtual_channel', COUNT(*) FROM virtual_channel
UNION ALL
SELECT 'user_level_ancestor', COUNT(*) FROM user_level_ancestor
UNION ALL
SELECT 'variable_test', COUNT(*) FROM variable_test
UNION ALL
SELECT 'sys_operation', COUNT(*) FROM sys_operation
UNION ALL
SELECT 'sys_profile', COUNT(*) FROM sys_profile
UNION ALL
SELECT 'equipment_polling_demand_var', COUNT(*) FROM equipment_polling_demand_var
UNION ALL
SELECT 'custom_view', COUNT(*) FROM custom_view
UNION ALL
SELECT 'data_monitor', COUNT(*) FROM data_monitor
UNION ALL
SELECT 'data_unit', COUNT(*) FROM data_unit
UNION ALL
SELECT 'data_unit_template', COUNT(*) FROM data_unit_template
UNION ALL
SELECT 'equipment_test', COUNT(*) FROM equipment_test
UNION ALL
SELECT 'notification_type_enum', COUNT(*) FROM notification_type_enum
UNION ALL
SELECT 'agent_type_interface', COUNT(*) FROM agent_type_interface
UNION ALL
SELECT 'user_level', COUNT(*) FROM user_level
UNION ALL
SELECT 'interface_inventory', COUNT(*) FROM interface_inventory
UNION ALL
SELECT 'event_type_enum', COUNT(*) FROM event_type_enum
UNION ALL
SELECT 'event_listener', COUNT(*) FROM event_listener
UNION ALL
SELECT 'submodule_slot', COUNT(*) FROM submodule_slot
UNION ALL
SELECT 'event_listener_property', COUNT(*) FROM event_listener_property
UNION ALL
SELECT 'event_log', COUNT(*) FROM event_log
UNION ALL
SELECT 'link_inventory_template_event_listener_template', COUNT(*) FROM link_inventory_template_event_listener_template
UNION ALL
SELECT 'inventory', COUNT(*) FROM inventory
UNION ALL
SELECT 'probe', COUNT(*) FROM probe
UNION ALL
SELECT 'interface_inventory_template', COUNT(*) FROM interface_inventory_template
UNION ALL
SELECT 'sys_user', COUNT(*) FROM sys_user
UNION ALL
SELECT 'radio_3d_interface_inventory', COUNT(*) FROM radio_3d_interface_inventory
UNION ALL
SELECT 'link_ne_component_alarm_view', COUNT(*) FROM link_ne_component_alarm_view
UNION ALL
SELECT 'radio_3d_inventory', COUNT(*) FROM radio_3d_inventory
UNION ALL
SELECT 'link_node_data_template_event_listener_template', COUNT(*) FROM link_node_data_template_event_listener_template
UNION ALL
SELECT 'radio_interface_inventory', COUNT(*) FROM radio_interface_inventory
UNION ALL
SELECT 'alarm_view', COUNT(*) FROM alarm_view
UNION ALL
SELECT 'radio_inventory', COUNT(*) FROM radio_inventory
UNION ALL
SELECT 'link_owned_ne_component_alarm_view', COUNT(*) FROM link_owned_ne_component_alarm_view
UNION ALL
SELECT 'link_user_profile', COUNT(*) FROM link_user_profile
UNION ALL
SELECT 'monitor_process_property', COUNT(*) FROM monitor_process_property
UNION ALL
SELECT 'trap_event_listener', COUNT(*) FROM trap_event_listener
UNION ALL
SELECT 'ne_agent', COUNT(*) FROM ne_agent
UNION ALL
SELECT 'variable_test_data', COUNT(*) FROM variable_test_data
UNION ALL
SELECT 'olt_profile_local', COUNT(*) FROM olt_profile_local
UNION ALL
SELECT 'physical_inventory', COUNT(*) FROM physical_inventory
UNION ALL
SELECT 'agent_link', COUNT(*) FROM agent_link
UNION ALL
SELECT 'olt_profile_service', COUNT(*) FROM olt_profile_service
UNION ALL
SELECT 'map_view', COUNT(*) FROM map_view
UNION ALL
SELECT 'slot_template', COUNT(*) FROM slot_template
UNION ALL
SELECT 'node_notification_property', COUNT(*) FROM node_notification_property
UNION ALL
SELECT 'odu_inventory', COUNT(*) FROM odu_inventory
UNION ALL
SELECT 'radio_3d_odu_inventory', COUNT(*) FROM radio_3d_odu_inventory
UNION ALL
SELECT 'policy_definition_config', COUNT(*) FROM policy_definition_config
UNION ALL
SELECT 'ne_component', COUNT(*) FROM ne_component
UNION ALL
SELECT 'node_data_template', COUNT(*) FROM node_data_template
UNION ALL
SELECT 'fibermesh_edges_topology', COUNT(*) FROM odu_inventory
UNION ALL
SELECT 'fibermesh_edges_topology_snapshot', COUNT(*) FROM radio_3d_odu_inventory
UNION ALL
SELECT 'fibermesh_inventory', COUNT(*) FROM policy_definition_config
UNION ALL
SELECT 'fibermesh_nodes_topology', COUNT(*) FROM ne_component
UNION ALL
SELECT 'equipment_anti_theft_protection', COUNT(*) FROM ne_component
) AS retorno

WHERE retorno.count > 0 


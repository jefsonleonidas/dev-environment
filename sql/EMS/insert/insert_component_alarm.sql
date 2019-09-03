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
		INSERT INTO component_alarm (id_component_alarm, id_ne_component, name, severity, category, type, active, message, message_template, activation_expression, deactivation_expression,
		status_timestamp, acknowledge_timestamp, owner_acknowledge, is_acknowledged, pickup_timestamp, owner_pickup, failure_obj, failure_obj_template, seed, alarm_child_key, id_component_alarm_parent,
		inhibit_explanation, pick_explanation, assignment, assignment_expression) 
		SELECT
			(SELECT CASE WHEN next_id IS NULL THEN 1 
					ELSE next_id 
					END 
			FROM (
				SELECT MAX(id_component_alarm) + 1 AS next_id 
				FROM component_alarm) AS aux),
		registro,
		'Aw3COffline', 50, 60, NULL, 0, 'Communication Failure', 'Communication Failure (node offline)', 'false', 'false', 1492682869403, NULL, NULL, 0, NULL, NULL, '-', '-', 0, NULL, NULL, NULL, NULL, '-', NULL;
		
		INSERT INTO link_ne_component_component_alarm (id_ne_component, id_component_alarm) SELECT registro, (SELECT MAX(id_component_alarm) FROM component_alarm);
	 
	END LOOP;

END;
$$ LANGUAGE plpgsql;
SELECT insert_data_component_alarm();

-- Slave --
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
			WHERE name ILIKE 'Radio2200_S') as c
		ON n.id_component_template = c.id_component_template) 

	LOOP
		INSERT INTO component_alarm (id_component_alarm, id_ne_component, name, severity, category, type, active, message, message_template, activation_expression, deactivation_expression,
		status_timestamp, acknowledge_timestamp, owner_acknowledge, is_acknowledged, pickup_timestamp, owner_pickup, failure_obj, failure_obj_template, seed, alarm_child_key, id_component_alarm_parent,
		inhibit_explanation, pick_explanation, assignment, assignment_expression) 
		SELECT
			(SELECT CASE WHEN next_id IS NULL THEN 1 
					ELSE next_id 
					END 
			FROM (
				SELECT MAX(id_component_alarm) + 1 AS next_id 
				FROM component_alarm) AS aux),
		registro,
		'Aw3COffline', 40, 60, NULL, 0, 'Communication Failure', 'Communication Failure (node offline)', 'false', 'false', 1492383831574, NULL, NULL, 0, NULL, NULL, '-', 'Slave_Radio', 0, NULL, NULL, NULL, NULL, '-', NULL;
		
		INSERT INTO link_ne_component_component_alarm (id_ne_component, id_component_alarm) SELECT registro, (SELECT MAX(id_component_alarm) FROM component_alarm);
	 
	END LOOP;

END;
$$ LANGUAGE plpgsql;
SELECT insert_data_component_alarm();
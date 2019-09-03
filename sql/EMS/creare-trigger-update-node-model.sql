CREATE or REPLACE FUNCTION update_node_model_inventory() RETURNS trigger AS
  $BODY$
BEGIN
	IF NEW.name = 'nodeModel' THEN
		UPDATE public.inventory 
		SET node_model = (SELECT committed_value FROM data_unit WHERE id_node_data = NEW.id_node_data)
		WHERE id_inventory IN ( 
					SELECT id_inventory 
					FROM ne_component 
					WHERE id_ne_component = NEW.id_ne_component ); 
					
	ELSIF NEW.name = 'macAddress' THEN
		UPDATE public.inventory 
		SET mac_address = (SELECT committed_value FROM data_unit WHERE id_node_data = NEW.id_node_data)
		WHERE id_inventory IN ( 
					SELECT id_inventory 
					FROM ne_component 
					WHERE id_ne_component = NEW.id_ne_component );
					
	ELSIF NEW.name = 'serialCode' THEN
		UPDATE public.inventory 
		SET serial_code = (SELECT committed_value FROM data_unit WHERE id_node_data = NEW.id_node_data)
		WHERE id_inventory IN ( 
					SELECT id_inventory 
					FROM ne_component 
					WHERE id_ne_component = NEW.id_ne_component );
					
	ELSIF NEW.name = 'ponSerialNumber' THEN
		UPDATE public.inventory 
		SET pon_serial_number = (SELECT committed_value FROM data_unit WHERE id_node_data = NEW.id_node_data)
		WHERE id_inventory IN ( 
					SELECT id_inventory 
					FROM ne_component 
					WHERE id_ne_component = NEW.id_ne_component );
										
	ELSIF NEW.name = 'softwareVersion' THEN
		UPDATE public.inventory 
		SET software_version = (SELECT committed_value FROM data_unit WHERE id_node_data = NEW.id_node_data)
		WHERE id_inventory IN ( 
					SELECT id_inventory 
					FROM ne_component 
					WHERE id_ne_component = NEW.id_ne_component );
										
	ELSIF NEW.name = 'firmwareVersion' THEN
		UPDATE public.inventory 
		SET firmware_version = (SELECT committed_value FROM data_unit WHERE id_node_data = NEW.id_node_data)
		WHERE id_inventory IN ( 
					SELECT id_inventory 
					FROM ne_component 
					WHERE id_ne_component = NEW.id_ne_component );
										
	ELSIF NEW.name = 'hardwareVersion' THEN
		UPDATE public.inventory 
		SET hardware_version = (SELECT committed_value FROM data_unit WHERE id_node_data = NEW.id_node_data)
		WHERE id_inventory IN ( 
					SELECT id_inventory 
					FROM ne_component 
					WHERE id_ne_component = NEW.id_ne_component );
										
	ELSIF NEW.name = 'productCode' THEN
		UPDATE public.inventory 
		SET product_code = (SELECT committed_value FROM data_unit WHERE id_node_data = NEW.id_node_data)
		WHERE id_inventory IN ( 
					SELECT id_inventory 
					FROM ne_component 
					WHERE id_ne_component = NEW.id_ne_component );
	ELSE
		-- hmm, the only other possibility is that number is null									
					
	END IF;
					
RETURN NEW;
END
$BODY$
LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS update_node_model_inventory
ON public.node_data;

CREATE TRIGGER update_node_model_inventory
AFTER UPDATE 
ON public.node_data
FOR EACH ROW
EXECUTE PROCEDURE update_node_model_inventory(); 

UPDATE node_data SET last_update = (SELECT EXTRACT(EPOCH FROM TIMESTAMP '2017-11-21 15:37:28.876944') * 1000)
WHERE name IN ('nodeModel', 'macAddress', 'serialCode', 'ponSerialNumber', 'softwareVersion', 'firmwareVersion', 'hardwareVersion', 'productCode');
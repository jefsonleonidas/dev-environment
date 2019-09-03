DROP FUNCTION public.reset_alarm_activation() CASCADE;

CREATE or REPLACE FUNCTION reset_alarm_activation() RETURNS trigger AS
  $BODY$
BEGIN
	UPDATE public.component_alarm 
	SET active = 0
	WHERE id_ne_component IN ( 
					SELECT id_ne_component 
					FROM ne_component 
					WHERE id_agent_link = NEW.id_agent_link AND description ILIKE 'Radio 2200 - 3D'
				);
RETURN NEW;
END
$BODY$
LANGUAGE plpgsql;

CREATE TRIGGER update_alarm_activation
AFTER UPDATE 
ON public.agent_link
FOR EACH ROW
EXECUTE PROCEDURE reset_alarm_activation(); 
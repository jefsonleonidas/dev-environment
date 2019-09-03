COPY
	(
	SELECT '/usr/bin/pg_dump --host localhost --port 5432 --username "asga_tms" --no-password  --format plain --data-only --inserts --column-inserts --verbose --file "/home/ems/Backups/no_equip/'||table_name||'_aux.sql" --table "public.'||table_name||'" "asga_tms"'
	FROM information_schema.tables 
	WHERE table_schema='public'
	ORDER BY table_name)
TO STDOUT (DELIMITER '|');


COPY
	(
	SELECT 'cat /home/ems/Backups/no_equip/'||table_name||'_aux.sql | grep INSERT\ INTO > /home/ems/Backups/no_equip/'||table_name||'.sql'
	FROM information_schema.tables 
	WHERE table_schema='public'
	ORDER BY table_name)
TO STDOUT (DELIMITER '|');
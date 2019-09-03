COPY (
      SELECT id_audit, user_login, user_name, to_timestamp(datetime/1000) AS date, source, target, message, category, id_client, type, ip_address
      FROM audit
      WHERE message ILIKE 'Node Added%'
      ORDER BY datetime
      )
TO '/home/ems/audit_tim.csv' WITH CSV
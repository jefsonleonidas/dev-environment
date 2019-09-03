SELECT *,
	CASE WHEN severity = 10 THEN 'WARNING'
	WHEN severity = 20 THEN 'MINOR'
	WHEN severity = 30 THEN 'MAJOR'
	WHEN severity = 40 THEN 'SEVERE'
	WHEN severity = 45 THEN 'CRITICAL'
	WHEN severity = 50 THEN 'UNREACHABLE'
	END AS severity
FROM faults_integration.component_alarm
ORDER BY message

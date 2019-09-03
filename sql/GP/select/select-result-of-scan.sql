SELECT olt.host,
olt.name,
CONCAT(ori.slot, '/', ori.port, '/', ori.onu_index) as pondata,
onu.serial_number,
onu.normalized_serial_number,
(CASE onu.model
WHEN 1 THEN "FK_ONT_G400R"
WHEN 2 THEN "FK_ONT_G420R"
WHEN 3 THEN "FK_ONT_G420W"
WHEN 4 THEN "FK_ONT_G421R"
WHEN 5 THEN "FK_ONT_G421W"
WHEN 7 THEN "FK_ONT_G400B_POE"
WHEN 8 THEN "FK_ONT_G400B_POE_S2"
WHEN 9 THEN "ONU100"
WHEN 10 THEN "LD111_21R"
WHEN 11 THEN "LD1102W"
WHEN 12 THEN "LD420_10R"
WHEN 15 THEN "LD421_21W"
END) AS model,
onu.mac_address,
onu.firmware_version,
(CASE ori.operational_status
WHEN 1 THEN "ACTIVE"
WHEN 2 THEN "BUSY"
WHEN 3 THEN "INACTIVE"
END) AS status,
ori.last_active,
(CASE onu.model
WHEN 1 THEN (CASE onu.firmware_version WHEN "3.03p2-1146" THEN FALSE ELSE TRUE END)
WHEN 2 THEN (CASE onu.firmware_version WHEN "3.03p4-1148" THEN FALSE ELSE TRUE END)
WHEN 3 THEN (CASE onu.firmware_version WHEN "3.03p2-1146" THEN FALSE ELSE TRUE END)
WHEN 5 THEN (CASE onu.firmware_version WHEN "3.03p4-1148" THEN FALSE ELSE TRUE END)
WHEN 7 THEN (CASE onu.firmware_version WHEN "1.01-1014" THEN FALSE ELSE TRUE END)
WHEN 8 THEN (CASE onu.firmware_version WHEN "1.00-1031" THEN FALSE ELSE TRUE END)
WHEN 9 THEN (CASE onu.firmware_version WHEN "V1.1.9" THEN FALSE ELSE TRUE END)
WHEN 11 THEN (CASE onu.firmware_version WHEN "4.8.1-GD-L3" THEN FALSE ELSE TRUE END)
WHEN 10 THEN (CASE onu.firmware_version WHEN "4.8.1-GD-L3" THEN FALSE ELSE FALSE END)
WHEN 12 THEN (CASE onu.firmware_version WHEN "V1.1" THEN FALSE ELSE TRUE END)
WHEN 15 THEN (CASE onu.firmware_version WHEN "V1.1" THEN FALSE ELSE TRUE END)
END) AS atualizar
FROM onu_origin as ori
INNER JOIN olt_device olt on ori.olt_device_id = olt.id
INNER JOIN onu_device onu on ori.onu_device_id = onu.id
WHERE onu.firmware_version IS NOT NULL
AND onu.mac_address IS NOT NULL
AND onu.model IS NOT null
AND ori.operational_status = 1 -- ACTIVE
AND onu.model = 15
ORDER BY olt.host, pondata, onu.serial_number, onu.model;
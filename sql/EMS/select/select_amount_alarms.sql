--Select amount of alarms

SELECT ne.id_component_template, ne.id_ne_component, ne.description, ne.name, COUNT(al.id_ne_component) AS qtd_alarm FROM 
( SELECT id_component_template,  id_ne_component, name, description FROM ne_component) AS ne
INNER JOIN  
(SELECT id_ne_component FROM component_alarm ) AS al
ON ne.id_ne_component = al.id_ne_component 
GROUP BY ne.id_ne_component, ne.id_component_template, ne.description, ne.name
ORDER BY qtd_alarm, ne.id_component_template

select source, message, count(message)
--*, datetime, to_timestamp(datetime/1000)
from event_log 
where source ilike '10.255.192.42'
group by source, message and datetime > 
having count(message) > 1
--order by datetime

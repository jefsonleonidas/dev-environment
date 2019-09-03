select to_timestamp(next_execution/1000) as next_execution_fmt, to_timestamp((next_execution + 86400000)/1000)
from equipment_backup_schedule
order by next_execution

--update equipment_backup_schedule set frequency = 0

--select to_timestamp(1500606000000/1000)

select to_timestamp(next_execution/1000) as next_execution_fmt, age(to_timestamp(next_execution/1000), now())
from equipment_backup_schedule
order by next_execution

select age(next_execution, now())
from equipment_backup_schedule
order by next_execution


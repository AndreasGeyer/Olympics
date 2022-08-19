select athlete, athlete_id, count(distinct sport) as "Anzahl Sportarten"
from olympics.athlete_event_results

group by athlete, athlete_id 
order by "Anzahl Sportarten" desc 
limit 1
;
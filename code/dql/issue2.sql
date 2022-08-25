select athlete, athlete_id, count(medal) as Medals
from olympics.athlete_event_results
where 	medal = 'Gold'
or		medal = 'Silver'
or		medal = 'Bronze'
group by athlete, athlete_id 
order by Medals desc 
limit 1
;
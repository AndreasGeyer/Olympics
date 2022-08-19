select country_noc, count(total) as Count
from olympics.games_medal_tally
group by country_noc
order by Count desc 
limit 1
;
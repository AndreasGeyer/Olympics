-- Check if the joined tables are compatible
/*
select		distinct *
from		olympics.athlete_bio a
	full outer join
			olympics.athlete_event_results b 
	on 		a.athlete_id = b.athlete_id

;
*/

-- Check which information is useful in the select and how they get grouped
/*
select distinct 
			extract(year from a.born) as year, count(a.athlete_id) as Anzahl, b.medal
from		
			olympics.athlete_bio a
	full outer join 
			olympics.athlete_event_results b 
	on 		
			a.athlete_id = b.athlete_id		
group by	
			a.athlete_id, a.born, b.medal
;
*/

-- Fast fertig, gibt jedoch die Jahre getrennt in Art der Medaille wieder.
/*
select
			extract(year from a.born) as year, 
			count(distinct b.result_id) as Anzahl, 
			b.medal
from		
			olympics.athlete_bio a
	full outer join 
			olympics.athlete_event_results b 
	on 		
			a.athlete_id = b.athlete_id		

where		
			b.medal notnull
and			a.born	notnull

group by	
			a.athlete_id, a.born, b.medal
order by	year
;
*/

--Checken ob random Geburtsjahr genau so viele Einträge bei medal = silver hat, wie bei der aggregation als anzahl angegeben wird
/*
select 		distinct *
from		
			olympics.athlete_bio a
	full outer join 
			olympics.athlete_event_results b 
	on 		
			a.athlete_id = b.athlete_id
where 		
			extract(year from a.born) = 1841
;
*/

select
			extract(year from a.born) as year, 
			count(distinct b.result_id) as Anzahl, 
			b.medal
from		
			olympics.athlete_bio a
	full outer join 
			olympics.athlete_event_results b 
	on 		
			a.athlete_id = b.athlete_id		

where		
			b.medal notnull
and			a.born	notnull

group by	
			a.athlete_id, a.born, b.medal
order by	Anzahl desc
;

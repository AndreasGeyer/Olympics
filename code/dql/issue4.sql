/*		Welche „Generation“ (Geburtsjahr) 
 * 		der Sportler war das erfolgreichste 
 * 		(meiste Medaillen)? #4
 * 
 * 
 * */

-- Check if the joined tables are compatible
/*
select		distinct *
from		olympics.athlete_bio a
	full outer join
			olympics.athlete_event_results b 
	on 		a.athlete_id = b.athlete_id

;
*/

/*
select 
		year,
		count(medal) as Anzahl_medals
		
		from (select		
			b.result_id,
			a.athlete_id,
			extract(year from a.born) as year,  
			b.medal
from		
			olympics.athlete_bio a
	inner join 
			olympics.athlete_event_results b 
	on 		
			a.athlete_id = b.athlete_id		

where		
			b.medal 	is not null
and			a.born 		is not null

group by	
			year,
			a.athlete_id,
			b.result_id,
			b.medal
order by	
			year) as subquery
group by year
order by Anzahl_medals desc
;
*/

/*
with subquery as (
					select		
								b.result_id,
								a.athlete_id,
								extract(year from a.born) as year, 
								b.medal
					from		
								olympics.athlete_bio a
						inner join 
								olympics.athlete_event_results b 
						on 		
								a.athlete_id = b.athlete_id		
					
					where		
								b.medal 	is not null
					and			a.born 		is not null
					
					group by	
								year,
								a.athlete_id,
								b.result_id,
								b.medal
					order by	
								year
					) 
select 			year,
				count(medal) as Anzahl_medals 
				
from 			subquery

group by 		year

order by 		Anzahl_medals desc
;
*/

--first valid try
select		
			extract(year from a.born) as year,
			count(medal)

from		
			olympics.athlete_bio a
	inner join 
			olympics.athlete_event_results b 
	on 		
			a.athlete_id = b.athlete_id		

where		
			b.medal 	is not null
and			a.born 		is not null

group by	
			year
order by	
			count(medal) desc
;


/*
select 		
			b.result_id,
			b.athlete_id,
			count(*)
from		
			olympics.athlete_bio a
	inner join 
			olympics.athlete_event_results b 
	on 		
			a.athlete_id = b.athlete_id	

where		b.medal is not null
group by 	b.result_id,
			b.athlete_id
;


select *
from olympics.athlete_event_results
where result_id = 51896
and 	medal is not null
order by athlete_id;
*/
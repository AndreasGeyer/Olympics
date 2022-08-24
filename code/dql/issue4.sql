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

select		
			distinct 
			b.result_id,
			a.athlete_id,
			extract(year from a.born) as year, 
			--count(distinct b.result_id) as Anzahl, 
			b.medal
			--count(distinct b.medal) as anzahl_medal
from		
			olympics.athlete_bio a
	full outer join 
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
;

/*
 * 	Erstelle eine Tabelle der 10 „unglücklichsten“ Sportler.
 *  Welche Sportler haben nie eine Medaille gewonnen sind aber 
 * 	am häufigsten auf dem 4ten Platz gelandet
 * 
 */

-- First valid Output, aber uneffizient. I wonder how, I wonder why ~~~
/*
select
			athlete_id, count(athlete_id) as "Anzahl 4ter Platz"
from	
			olympics.athlete_event_results
			
where 		athlete_id != all(
								select 	athlete_id 
								from 	olympics.athlete_event_results
								where 	medal is not null 
								)
and			pos = '4'
group by	athlete_id
order by	"Anzahl 4ter Platz" desc
;	
*/

drop view if exists view_issue6;

-- Verbesserung der Effizienz bei gleichem Output.
create view view_issue6 as
with subquery as (
								select  distinct
										athlete_id
								from 	olympics.athlete_event_results
								where 	medal is not null		
					) 
select 			athlete_id,
				count(athlete_id) as "Wie oft vierter Platz" 
				
from 			olympics.athlete_event_results

where			athlete_id not in	(
									select athlete_id from subquery
									)
and 			pos = '4'

group by 		athlete_id

order by 		"Wie oft vierter Platz" desc
;


select * from view_issue6;


/* Wieso kriegt der hier Bronze wenn er aufm 4ten Platz steht??
select athlete_id, pos, medal
from olympics.athlete_event_results aer 
where athlete_id = 66140
and		medal is not null;
*/
/*
 * 	Erstelle eine Tabelle der 10 „unglücklichsten“ Sportler.
 *  Welche Sportler haben nie eine Medaille gewonnen sind aber 
 * 	am häufigsten auf dem 4ten Platz gelandet
 * 
 */
/* subquery gibt alle athlete_id welche eine medal gewonnen haben,
 * auch duplikate. wenn athlete_id nicht in der subquery vorkommt,
 * wird sie in der ersten ebene in der liste aufgeführt.
 * aka alle athlete_id welche noch nie eine medal gewonnen haben
 * 
select
			athlete_id, medal, pos
from	
			olympics.athlete_event_results
where 		athlete_id != all(
								select 	athlete_id 
								from 	olympics.athlete_event_results
								where 	medal is not null 
								)
;
*/

select
			athlete_id, medal, pos, count(athlete_id) as "Anzahl 4ter Platz"
from	
			olympics.athlete_event_results
where 		athlete_id != all(
								select 	athlete_id 
								from 	olympics.athlete_event_results
								where 	medal is not null 
								)
and			pos = '4'
group by	athlete_id, medal, pos
order by	"Anzahl 4ter Platz" desc
limit 5

;	
							
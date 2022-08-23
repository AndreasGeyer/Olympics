/*
 * 	Erstelle eine Tabelle der 10 „unglücklichsten“ Sportler.
 *  Welche Sportler haben nie eine Medaille gewonnen sind aber 
 * 	am häufigsten auf dem 4ten Platz gelandet
 * 
 */

/*
select				athlete_id, result_id, medal, pos
from				olympics.athlete_event_results
where				0 = any(
						select	count(medal)
						from	olympics.athlete_event_results
						group by athlete_id
);
*/


select distinct  
			athlete_id, medal
from	
			olympics.athlete_event_results
where	
			medal is null
group by 	
			athlete_id, medal
;

/*
select 	athlete_id, count(medal)
from	olympics.athlete_event_results
group by athlete_id
;
*/

select				athlete_id, result_id, medal, pos
from				olympics.athlete_event_results
where				athlete_id = 44959
group by 			athlete_id, result_id, medal, pos
;


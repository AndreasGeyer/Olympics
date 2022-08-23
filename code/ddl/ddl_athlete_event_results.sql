drop table if exists olympics.athlete_event_results;

create table olympics.athlete_event_results
as
select

	case
		when edition = 'na' then null
		when edition = ' % ' then cast(trim(both from edition) as varchar)
		else edition
	end as edition,
	
	case
		when country_noc = 'na' then null
		when country_noc = ' % ' then cast(trim(both from country_noc) as varchar)
		else country_noc
	end as country_noc,
	
	case
		when sport = 'na' then null
		when sport = ' % ' then cast(trim(both from sport) as varchar)
		else sport
	end as sport,
	
	case
		when event = 'na' then null
		when event = ' % ' then cast(trim(both from event) as varchar)
		else event
	end as event,
	
	result_id,
	
	case
		when athlete = 'na' then null
		when athlete = ' % ' then cast(trim(both from athlete) as varchar)
		else athlete
	end as athlete,
	
	athlete_id,
	
	case
		when pos = 'na' then null
		when pos like '=%' then trim('=' from pos)												-- changed from pos = '=%' to current. fixed it.
		when pos ~ '^[A-Z]' then null
		-- when pos ~ '(^[0-9])\w+' then 
		-- when pos ~ '([ ])\w+' then regexp_replace(pos, '([ ])\w+', '', 'g')					-- Erster Versuch um Werte wie "63 r1/2" zu entfernen, funktioniert nicht aber gibt kein error aus
		else pos
	end as pos,
	
	case
		when medal = 'na' then null
		when medal = ' % ' then cast(trim(both from medal) as varchar)
		else medal
	end as medal,
	
	"isTeamSport"

from
	rohdaten.athlete_event_results ;
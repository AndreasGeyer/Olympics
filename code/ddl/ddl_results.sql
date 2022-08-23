drop table if exists olympics.results;

create table olympics.results
as
select

	result_id,
	
	case
		when event_title = 'na' then null
		else trim(event_title)
	end as event_title,
	
	case
		when edition = 'na' then null
		else trim(edition)
	end as edition,
	
	case
		when sport = 'na' then null
		else trim(sport)
	end as sport,
	
	case
		when sport_url = 'na' then null
		when sport_url not like '/%' then null
		else trim(sport_url)
	end as sport_url,
	
	case
		when result_location = 'na' then null
		else trim(result_location)
	end as result_location,
	
	case
		when result_participants = 'na' then null
		else trim(result_participants)
	end as result_participants,
	
	case
		when result_format like 'na' then null
		else trim(result_format)
	end as result_format,
	
	case
		when result_detail like 'na' then null
		else trim(result_detail)
	end as result_detail,
	
	case
		when result_description = 'na' then null
		else result_description
	end as result_description,
	
	case
		when start_date = 'na' then null
		when cast(start_date as varchar)  ~ '^[0-9\.]+$' then to_date(cast(start_date as text), 'YYYY-MM-DD') 			-- finally, hab den cast auf date hinbekommen nach 153518 trys
		else to_date(cast(start_date as text), 'YYYY-MM-DD')
	end as start_date,
	
	case
		when end_date = 'na' then null
		when cast(end_date as varchar)  ~ '^[0-9\.]+$' then to_date(cast(end_date as text), 'YYYY-MM-DD') 				-- finally, hab den cast auf date hinbekommen nach 153518 trys
		else to_date(cast(end_date as text), 'YYYY-MM-DD')
	end as end_date,
	
	
	-- Wie könnte man die Zeiten bei time handhaben?
	case
		when time = 'na' then null
		else time
	end as time
	
from
	rohdaten.results ;
	

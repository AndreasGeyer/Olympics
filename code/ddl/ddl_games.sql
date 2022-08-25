drop table if exists olympics.games;

create table olympics.games
as
select

	case
		when edition = 'na' then null
		when edition = ' % ' then cast(trim(both from edition) as varchar)
		else edition
	end as edition,
	
	case
		when edition_url = 'na' then null
		else trim(edition_url)
	end as edition_url,
	
	case
		when cast(year as varchar)  ~ '^[0-9\.]+$' then to_date(cast(year as text), 'YYYY') 			-- finally, hab den cast auf date hinbekommen nach 153518 trys
		else to_date(cast(year as text), 'YYYY')
	end as year,
	
	case
		when city = 'na' then null
		else trim(city)
	end as city,
	
	case
		when country_flag_url = 'na' then null
		when country_flag_url not like '%.png' then null
		else country_flag_url
	end as country_flag_url,
	
	case
		when country_noc = 'na' then null
		else trim(country_noc)
	end as country_noc,
	
	case
		when start_date = 'na' then null
		when cast(start_date as varchar)  ~ '^[0-9\.]+$' then to_date(cast(start_date as text), 'YYYY-MM-DD') 			-- finally, hab den cast auf date hinbekommen nach 153518 trys
		else to_date(cast(start_date as text), 'YYYY-MM-DD')
	end as start_date,
	
	case
		when end_date = 'na' then null
		when cast(end_date as varchar)  ~ '^[0-9\.]+$' then to_date(cast(end_date as text), 'YYYY-MM-DD') 			-- finally, hab den cast auf date hinbekommen nach 153518 trys
		else to_date(cast(end_date as text), 'YYYY-MM-DD')
	end as end_date,
	
	case
		when "isHeld" = 'na' then null
		else "isHeld"
	end as "isHeld",
	
	case
		when competition_start_date = 'na' then null
		when cast(competition_start_date as varchar)  ~ '^[0-9\.]+$' then to_date(cast(competition_start_date as text), 'YYYY-MM-DD') 			-- finally, hab den cast auf date hinbekommen nach 153518 trys
		else to_date(cast(competition_start_date as text), 'YYYY-MM-DD')
	end as competition_start_date,
	
	case
		when competition_end_date = 'na' then null
		when cast(competition_end_date as varchar)  ~ '^[0-9\.]+$' then to_date(cast(competition_end_date as text), 'YYYY-MM-DD') 			-- finally, hab den cast auf date hinbekommen nach 153518 trys
		else to_date(cast(competition_end_date as text), 'YYYY-MM-DD')
	end as competition_end_date
	
	
from
	rohdaten.games ;
drop table if exists olympics.games_medal_tally;

create table olympics.games_medal_tally 
as
select

	case
		when edition = 'na' then null
		when edition = ' % ' then cast(trim(both from edition) as varchar)
		else edition
	end as edition,
	
	edition_id,
	
	case
		when cast(year as varchar) like '%' then to_date(cast(year as text), 'YYYY') 			-- finally, hab den cast auf date hinbekommen nach 153518 trys
		else to_date(cast(year as text), 'YYYY')
	end as year,
	
	case
		when country = 'na' then null
		when country = ' % ' then cast(trim(both from country) as varchar)
		else country
	end as country,
	
	case
		when country_noc = 'na' then null
		when country_noc = ' % ' then cast(trim(both from country_noc) as varchar)
		else country_noc
	end as country_noc,
	
	gold,
	
	silver,
	
	bronze,
	
	total
	
from
	rohdaten.games_medal_tally ;

drop table if exists olympics.games_medal_tally;

create table olympics.games_medal_tally 
as
select

	case
		when edition = 'na' then null
		else trim(edition)
	end as edition,
	
	edition_id,
	
	case
		when year < 1000 or year > 9999 then null 
		else to_date(cast(year as text), 'YYYY')
	end as year_dt,
	
	case
		when country = 'na' then null
		else trim(country)
	end as country,
	
	case
		when country_noc = 'na' then null
		else trim(country_noc)
	end as country_noc,
	
	gold,
	
	silver,
	
	bronze,
	
	total
	
from
	rohdaten.games_medal_tally ;

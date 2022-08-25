drop table if exists olympics.country;

create table olympics.country
as
select

	case
		when country_noc = 'na' then null
		else trim(country_noc)
	end as country_noc,
	
	case
		when country = 'na' then null
		else trim(country)
	end as country
	
from
	rohdaten.country ;
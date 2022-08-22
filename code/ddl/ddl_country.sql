drop table if exists olympics.country;

create table olympics.country
as
select

	case
		when country_noc = 'na' then null
		when country_noc = ' % ' then cast(trim(both from country_noc) as varchar)
		else country_noc
	end as country_noc,
	
	case
		when country = 'na' then null
		when country = ' % ' then cast(trim(both from country) as varchar)
		else country
	end as country
	
from
	rohdaten.country ;
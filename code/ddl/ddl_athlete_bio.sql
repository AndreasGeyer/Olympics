drop table if exists olympics.athlete_bio;

create table olympics.athlete_bio
as
select

	athlete_id,
	
	case
		when name = 'na' then null
		when name = ' % ' then cast(trim(both from name) as varchar)
		else name
	end as name,
	
	case
		when sex = 'na' then null
		when sex = ' % ' then cast(trim(both from sex) as varchar)
		when sex not like 'Male' and sex not like 'Female' then null
		else sex
	end as sex,
	
	case
		when born = 'na' then null
		when cast(born as varchar)  ~ '^[0-9\.]+$' then to_date(cast(born as text), 'YYYY-MM-DD') 			-- finally, hab den cast auf date hinbekommen nach 153518 trys
		when born not like '____-__-__' then null
		else to_date(cast(born as text), 'YYYY-MM-DD')
	end as born,
	
	case
		when height = 'na' then null 
		else cast(height as float)
	end as height,
	case
		when weight = 'na' then null
		when weight like '%-%' then null
		when weight like '%,%' then null
		when weight like '% ' then cast(trim(weight) as float)
		else cast(weight as float)
	end as weight,
 
	case
		when country = 'na' then null
		else trim(country)
	end as country,
	
	case
		when country_noc = 'na' then null
		when country_noc = ' % ' then cast(trim(both from country_noc) as varchar)
		else country_noc
	end as country_noc,
	
	case
		when description = 'na' then null
		else description
	end as description,
	
	case
		when special_notes = 'na' then null
		else special_notes
	end as special_notes
	
from
	rohdaten.athlete_bio ;

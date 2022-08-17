/* Lösche Altdaten */
delete from olympics.country ;
/* Daten laden */
insert into olympics.country (country, country_noc)
select country,
case when country_noc = 'na' then null 
else country_noc end as country_noc 
from import_schema.olympics_country_csv;
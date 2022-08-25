

select	r.result_id, r.edition, r.sport, r.start_date, r.end_date  , max(end_date - start_date) as Anzahl_Tage
from	olympics.results r 
where	start_date notnull
and 	end_date notnull
group by r.result_id, r.edition, r.sport, r.start_date, r.end_date
order by max(end_date - start_date) desc
;

-- 142 als max-wert bei start_date = 1920-04-23 and end_date = 1920-09-12.
-- https://www.timeanddate.com/date/durationresult.html?d1=23&m1=04&y1=1920&d2=12&m2=09&y2=1920
-- Gibt den gleichen Wert aus. 142 Tage


-- Vergleichsquery um Anzahl Entries zu prüfen. 
-- Müsste die gleiche sein wie oben.
-- Beide haben 4261 Entries

select 	r.result_id, r.edition, r.sport, r.start_date, r.end_date
from	olympics.results r 
where	start_date notnull
and 	end_date notnull
;
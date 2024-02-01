select geoID, sum(Amount),avg(Amount),sum(boxes)
from sales
group by geoID;

select g.geo, sum(Amount), avg(amount), sum(boxes)
from sales as s 
join geo as g  on s.GeoID = g.GeoID
group by g.geo;

select pr.Category, p.team, sum(boxes), sum(amount)
from sales as s
join people as p on p.spid = s.spid
join products as pr on pr.pid = s.pid
group by pr.Category, p.team;

select pr.Category, p.team, sum(boxes), sum(amount)
from sales as s
join people as p on p.spid = s.spid
join products as pr on pr.pid = s.pid
group by pr.Category, p.team
having p.team <> '' 
order by pr.Category, p.team;

select pr.product, sum(s.Amount) as 'Total Amount'
from sales as s 
join products as pr on pr.pid = s.pid 
group by pr.Product
order by 'Total Amount' desc; 
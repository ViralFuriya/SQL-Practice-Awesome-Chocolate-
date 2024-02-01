select s.SaleDate, s.Amount, p.Salesperson, s.SPID, p.SPID
from sales as s 
join people as p on p.spid = s.spid; 

select s.saledate, s.Amount, s.spid
from sales as s 
left join products as pr on pr.pid = s.pid;
select s.SaleDate, s.Amount, p.Salesperson, pr.Product, p.Team
from sales as s 
join people as p on p.spid = s.spid
join products as pr on pr.pid = s.pid;

select s.SaleDate, s.Amount, p.Salesperson, pr.Product, p.Team
from sales as s 
join people as p on p.spid = s.spid
join products as pr on pr.pid = s.pid
where s.amount < 500
and p.Team ='Delish';

select s.SaleDate, s.Amount, p.Salesperson, pr.Product, p.Team
from sales as s 
join people as p on p.spid = s.spid
join products as pr on pr.pid = s.pid
where s.amount < 500
and p.Team ='';

select s.SaleDate, s.Amount, p.Salesperson, pr.Product, p.Team
from sales as s 
join people as p on p.spid = s.spid
join products as pr on pr.pid = s.pid
join geo as g on g.GeoID = s.GeoID
where s.amount < 500
and p.Team =''
and g.Geo in ('New Zealand','India')
order by saledate ;

select * from sales;

select SaleDate, Amount, Customers from sales;

select Amount, Customers, GeoID from sales;

select SaleDate, Amount, Boxes, Amount/Boxes as "Amount per Box" from sales;

select * from sales where Amount > 10000;

select * from sales where Amount > 10000 order by amount;
select * from sales where Amount > 10000 order by amount desc;

select * from sales
where geoid = 'g1'
order by PID, Amount desc;

select * from sales 
where amount > 10000 and SaleDate >='2022-01-01'
order by SaleDate desc;

select SaleDate,Amount from sales
where amount>10000 and year(SaleDate) =2022
order by amount desc;

select * from sales
where boxes > 0 and boxes <=50;

select * from sales
where boxes between 0 and 50;

select SaleDate , Amount , Boxes , weekday(SaleDate) as 'Day of the week'
from sales
where weekday(SaleDate) =4;

select * from people;
select * from people 
where team ='Delish' or team = 'Jucies';
select * from people 
where team in ('Delish','Jucies');

select * from people 
where salesperson like 'B%';
select * from people 
where salesperson like '%B%';

select SaleDate, Amount,
	case	when amount < 1000 then 'Under 1k'
			when amount < 5000 then 'Under 5k'
			when amount < 10000 then 'Under 10k'
	else '10k or more'
end as 'Amount Category'
from sales
order by Amount;
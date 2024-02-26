# Awesome Chocolate Dataset SQL Practice Queries

Welcome to the Awesome Chocolate dataset SQL practice queries repository! This repository contains SQL queries written to practice querying the "Awesome Chocolate" dataset. The dataset includes information about sales, people, products, and geographical locations related to chocolate products.

## Dataset Description

The "Awesome Chocolate" dataset consists of the following tables:

- **Sales**: Contains information about sales transactions, including sale date, amount, number of boxes sold, product ID, customer ID, and geographical ID.
- **People**: Provides details about salespeople, including their salesperson ID, name, team, and region.
- **Products**: Contains information about different chocolate products, including product ID, product name, category, and price.
- **Geo**: Contains geographical information such as geographical ID and geographical region.

## SQL Practice Queries

### Basic Queries
```sql
-- Select everything from sales table
select * from sales;

-- Show just a few columns from sales table
select SaleDate, Amount, Customers from sales;

-- Adding a calculated column with SQL
Select SaleDate, Amount, Boxes, Amount / boxes  from sales;

-- Naming a field with AS in SQL
Select SaleDate, Amount, Boxes, Amount / boxes as 'Amount per box'  from sales;

-- Using WHERE Clause in SQL
select * from sales
where amount > 10000;

-- Showing sales data where amount is greater than 10,000 by descending order
select * from sales
where amount > 10000
order by amount desc;
```

### Joins
```sql
-- Joining Sales and Geo Tables
select g.geo, sum(Amount), avg(amount), sum(boxes)
from sales as s 
join geo as g  on s.GeoID = g.GeoID
group by g.geo;

-- Joining Sales, People, and Products Tables
select pr.Category, p.team, sum(boxes), sum(amount)
from sales as s
join people as p on p.spid = s.spid
join products as pr on pr.pid = s.pid
group by pr.Category, p.team;
```

### Aggregation and Filtering
```sql
-- Grouping by Team and Counting People
select team, count(*) from people
group by team;

-- Grouping by Product Category and Team with Conditions
select pr.Category, p.team, sum(boxes), sum(amount)
from sales as s
join people as p on p.spid = s.spid
join products as pr on pr.pid = s.pid
group by pr.Category, p.team
having p.team <> '' 
order by pr.Category, p.team;

-- Using CASE to Categorize Amount
select 	SaleDate, Amount,
		case 	when amount < 1000 then 'Under 1k'
				when amount < 5000 then 'Under 5k'
                when amount < 10000 then 'Under 10k'
			else '10k or more'
		end as 'Amount category'
from sales;
```

### Advanced Queries
```sql
-- Showing Sales Data Where Geography is 'g1' by Product ID
select * from sales
where geoid='g1'
order by PID, Amount desc;

-- Using BETWEEN Condition to Filter Rows
select * from sales
where boxes between 0 and 50;

-- Using WEEKDAY Function to Select Data for a Specific Day
select SaleDate, Amount, Boxes, weekday(SaleDate) as 'Day of week'
from sales
where weekday(SaleDate) = 4;
```

## Getting Started
To run these queries, you'll need access to a database management system (DBMS) such as MySQL, PostgreSQL, or SQLite, and the "Awesome Chocolate" dataset.

## Contributing
Contributions are welcome! If you have additional SQL queries to practice with the "Awesome Chocolate" dataset or suggestions for improvements, feel free to submit a pull request.


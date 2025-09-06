use testdb

create table prod(
				order_date date,
				Sales int);
insert into prod (order_date,Sales)
values
('2021-01-01',20),('2021-01-02',32),('2021-02-08',45),('2021-02-04',31),('2021-03-21',33),
('2021-03-06',19),('2021-04-07',21),('2021-04-22',10);

select * from prod

select *, datepart (year, order_date) as years, datename (month,order_date) As months
from prod
----------------------------------------------------------

select datepart (year, order_date) as years, datename (month,order_date) As months,
sum(sales) AS TotalSales 
from prod
group by datepart(year, order_date),
		 datename(month, order_date)
order by TotalSales desc




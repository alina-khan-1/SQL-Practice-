select * from dbo.payment

select count(amount) from dbo.payment

select count(*) from dbo.payment

select sum(amount) from dbo.payment

select max(amount) from dbo.payment

select min(amount) from dbo.payment

select avg(amount) [Avg Amount] from dbo.payment

select * from [dbo].[payment]

select mode, sum(amount) As total 
from [dbo].[payment]
group by mode
order by total asc


select mode, count(amount) AS Total_count
from dbo.payment 
group by mode
having count(amount)>=3

use testdb
select * from [dbo].[payment]

select mode, count(amount) As Total_count
from dbo.payment
group by mode
having count (amount)>=3

select mode, count(amount) As total_count
from dbo.payment 
group by mode 
having count(amount) >= 2 AND count(amount)<4
order by total_count DESC

select * from [dbo].[payment]

select datepart (month, [payment_date]) as payment_month, [payment_date]
from [dbo].[payment]

select datename(month, payment_date) as month_name, payment_date
from dbo.payment

SELECT DATENAME(WEEKDAY, [payment_date]) AS day_of_week, [payment_date]
from [dbo].[payment]


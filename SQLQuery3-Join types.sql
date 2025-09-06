use testdb
select * from [dbo].[payment]
select * from [dbo].[customerss]

select * 
from customerss AS c 
INNER JOIN payment as p
ON c.customer_id = p.customer_id

select c.first_name, p.amount, p.mode
from customerss as c
inner join payment as p
on c.customer_id=p.customer_id

select * from [dbo].[customer]

select *
from customer as cv
inner join payment as pp
on cv.ID = pp.customer_id

use [testdb]
select * from dbo.payment
select * from [dbo].[customer]

select *
from customer as c 
left join payment as p
on c.ID=p.customer_id

select *
from payment as p
left join customer as c
on p.customer_id=c.ID

use testdb

select * 
from payment as p
right join customer as c
on p.customer_id=c.ID

select * from 
customer as c
right join payment as p
on c.ID=p.customer_id

select * from
customer as c
full outer join payment as p
on c.ID=p.customer_id

select * 
from payment as p
full outer join customer as c
on p.customer_id=c.ID

create table empl
(
	"Empid" int primary key,
	"Empl_name" varchar(50) not null,
	"Manager_ID" int not null);
	
select * from [dbo].[empl]

insert into [dbo].[empl]
(Empid,Empl_name,Manager_ID)
values
(1,'Agni',3),
(2,'Akash',4),
(3,'Dharti',2),
(4,'Vayu',3);

select * from empl

select * from
empl as t1
join empl as t2
on t2.Empid=t1.Manager_ID

select t1.Empl_name AS employee_name, t2.Empl_name AS Manager_name from
empl as t1
join empl as t2
on t2.Empid=t1.Manager_ID

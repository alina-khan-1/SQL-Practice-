create database testdb	

create table customer 
(
	"ID" int  PRIMARY KEY,
	"Name" varchar(50) NOT NULL,
	"Age" int NOT NULL,
	"City" char(50),
	"Salary" numeric);


	select * from customer 

insert into customer
(ID,Name,Age,City,Salary)
values
(1,'Sam',26,'Delhi',9000),
(2,'Ram',19, 'Bangolre', 11000),
(3,'Pam', 31,'Mumbai',6000),
(4,'Jam',42,'Pune',10000);

select * from customer

update customer
set Name='Xam',Age=32
where ID=4;

select*from customer

select distinct Name,Age from customer

select name, City from customer
where Age= 19

select * from customer

insert into customer
(ID,Name,Age,City,Salary)
values
(5,'Sham',26,'Delhi',9000),
(6,'Reema',19, 'jaipur', 11000),
(7,'Padmavat', 31,'Mumbai',6000),
(8,'Jamse',42,'kolkata',10000),
(9,'Sheela',26,'Delhi',9000),
(10,'Rita',19, 'bhopal', 11000),
(11,'Preeti', 31,'Mumbai',6000),
(12,'Jay',42,'Pune',10000);

select * from customer

select * from customer
order by Name ASC

select * from customer 
order by City DESC


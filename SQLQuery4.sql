select * from dbo.customerss

SELECT UPPER(first_name) from [dbo].[customerss]

SELECT LOWER([first_name]) from[dbo].[customerss]

select len(first_name), first_name from [dbo].[customerss]

select SUBSTRING(first_name, 2,4),first_name from [dbo].[customerss]

select CONCAT(first_name,last_name), first_name, last_name from [dbo].[customerss]

select REPLACE (first_name, 'Mary', 'Mohan'), first_name from [dbo].[customerss] 
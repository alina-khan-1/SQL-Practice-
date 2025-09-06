select * from [dbo].[payment-case statement]

--find the average value
select AVG(amount) from [dbo].[payment-case statement]

-- filter the customer data > avg amount

select * from [dbo].[payment-case statement]
where amount >164


-- diffrennt approch( right one )
-- sub query
select * from [dbo].[payment-case statement]
where amount >(select AVG(amount) from [dbo].[payment-case statement])

select [ID] from [dbo].[customer]
-- from above synatax we are getting multiple outputs in these senerios we use logical operators 
 
 select [customer_id], [amount],[mode]
 from [dbo].[payment-case statement]
 where [customer_id] IN (select [ID] from [dbo].[customer])

 SELECT * FROM [dbo].[customerss]

 -- INNER QUERY
 SELECT [customer_id], [amount]
 FROM [dbo].[payment-case statement]
 WHERE AMOUNT >100

 SELECT [first_name], [last_name]
 FROM [dbo].[customerss] C
 WHERE EXISTS(	SELECT [customer_id], [amount]
				FROM [dbo].[payment-case statement] P
				WHERE P.CUSTOMER_ID = C.CUSTOMER_ID
				AND AMOUNT >=100)


 SELECT * FROM [dbo].[customerss]
 SELECT * FROM [dbo].[payment-case statement]




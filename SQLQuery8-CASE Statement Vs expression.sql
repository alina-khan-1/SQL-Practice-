use testdb

select * from [payment-case statement]
--- CASE STAEMENT

SELECT customer_id, amount,
CASE 
	WHEN amount >100 THEN 'EXPENSIVE_PRODUCT'
	WHEN amount = 100 THEN 'MODERATE_PRODUCT'
	ELSE 'INEXPENSIVE PRODUCT'
END AS PRODUCTSTATUS
FROM [payment-case statement]

-- CASE EXPRESSION
SELECT customer_id,
CASE amount 
	WHEN 500 THEN 'Prime Customer'
	WHEN 100 THEN 'Plus Customer'
	ELSE 'Regular customer'
END AS CustomerStatus 
FROM [payment-case statement]


select * from [payment-case statement]
select * from customerss


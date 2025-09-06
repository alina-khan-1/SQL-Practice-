use testdb
select * from [payment-case statement]
select * from customerss


WITH my_cte AS (
    SELECT
        P.amount,
        C.first_name,
        C.last_name,
        P.customer_id,
        AVG(P.amount) OVER(ORDER BY P.customer_id) AS "Average_price",
        COUNT(C.address_id) OVER(ORDER BY P.customer_id) AS "Count"
    FROM
        [payment-case statement] AS P
    INNER JOIN
        customerss AS C ON P.customer_id = C.customer_id
)
SELECT
    first_name,
    last_name,
    amount
FROM
    my_cte;

    -------------------------------------------------------------
WITH c AS (
    SELECT  first_name, last_name
    FROM customerss
    INNER JOIN [payment-case statement]
        ON customerss.customer_id = [payment-case statement].customer_id),
ca AS ( SELECT  amount, mode FROM [payment-case statement]
    INNER JOIN customerss ON [payment-case statement].customer_id = [payment-case statement].customer_id
)SELECT c.first_name, c.last_name, ca.amount, ca.mode
FROM c INNER JOIN ca ON c.customer_id = ca.customer_id;
------------------------------------------------------------------------

WITH c AS (
    SELECT
        customerss.customer_id,
        customerss.first_name,
        customerss.last_name
    FROM customerss
    INNER JOIN [payment-case statement]
        ON customerss.customer_id = [payment-case statement].customer_id
),
ca AS (
    SELECT
        P.customer_id,
        P.amount,
        P.mode
    FROM [payment-case statement] AS P
    INNER JOIN customerss AS C
        ON P.customer_id = C.customer_id
)
SELECT
    c.first_name,
    c.last_name,
    ca.amount,
    ca.mode
FROM c
INNER JOIN ca
    ON c.customer_id = ca.customer_id;

    ------------------------------------------------------------------------------------

WITH my_cte AS (
    SELECT mode,
           MAX(amount) AS highest_price,
           SUM(amount) AS total_price
    FROM [payment-case statement]
    GROUP BY mode
)
SELECT p.customer_id, p.amount, p.mode,
       c.highest_price, c.total_price
FROM [payment-case statement] p
JOIN my_cte c
    ON p.mode = c.mode;


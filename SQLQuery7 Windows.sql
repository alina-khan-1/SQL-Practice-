use testdb

create table Window_exam
(new_id int,
new_cat varchar(50) not null);

insert into [dbo].[Window_exam]
(new_id, new_cat)
values
(100,'Agni'),
(200,'Agni'),
(500, 'Dharti'),
(700,'Dharti'),
(200,'Vayu'),
(300,'Vayu'),
(500,'Vayu');

select * from [dbo].[Window_exam]
-- Aggregation function of window
SELECT new_id, new_cat,
SUM(new_id) OVER(PARTITION BY new_cat) AS "TOTAL",
AVG(new_id) OVER(PARTITION BY new_cat )AS "AVERAGE",
COUNT(new_id) OVER(PARTITION BY new_cat )AS "COUNT",
MIN(new_id) OVER(PARTITION BY new_cat )AS "MIN",
MAX(new_id) OVER(PARTITION BY new_cat )AS "MAX"
FROM [dbo].[Window_exam]

SELECT
    new_id,
    new_cat,
    SUM(new_id) OVER(PARTITION BY new_cat) AS "TOTAL"
FROM [dbo].[Window_exam]

use testdb

select new_id, new_cat,
SUM(new_id)over(order by new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "TOTAL",
AVG(new_id)over(order by new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "AVERAGE",
COUNT(new_id)over(order by new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "COUNT",
MIN(new_id)over(order by new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "MIN",
MAX(new_id)over(order by new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "MAX"
FROM [dbo].[Window_exam]

-- Ranking Function of window

select new_id,
ROW_NUMBER() OVER(ORDER BY new_id)AS "ROW_NUMBER",
RANK() OVER(ORDER BY new_id) AS "RANK",
DENSE_RANK() OVER(ORDER BY new_id) AS "DENSE_RANK",
PERCENT_RANK() OVER(ORDER BY new_id) AS "PERCENT_RANK"
FROM [dbo].[Window_exam]

-- ANALYTIC FUNSTION OF WINDOW

SELECT new_id,
FIRST_VALUE(new_id) OVER (ORDER BY new_id) AS "FIRST_VALUE",
LAST_VALUE(new_id) OVER (ORDER BY new_id) AS "LAST_VALUE",
LEAD(new_id) OVER (ORDER BY new_id) AS "LEAD_V",
LAG(new_id) OVER (ORDER BY new_id) AS "LAG_V"
FROM [dbo].[Window_exam];

SELECT new_id,
LEAD (new_id,2) OVER(ORDER BY new_id) AS "lead_by2",
LAG (new_id,2) OVER(ORDER BY new_id) AS "lag_by2"
from [dbo].[Window_exam]
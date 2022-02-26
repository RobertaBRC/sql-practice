/****** LeetCode Practice
Pivoting the monthly revenue of a table so that there is a department id column and a revenue column for each month.
The columns originally in the table were: id, revenue and month******/

SELECT id,
[Jan] AS Jan_Revenue,
[Feb] AS Feb_Revenue,
[Mar] AS Mar_Revenue,
[Apr] AS Apr_Revenue,
[May] AS May_Revenue,
[Jun] AS Jun_Revenue,
[Jul] AS Jul_Revenue,
[Aug] AS Aug_Revenue,
[Sep] AS Sep_Revenue,
[Oct] AS Oct_Revenue,
[Nov] AS Nov_Revenue,
[Dec] AS Dec_Revenue
FROM 
(
SELECT id, [month], SUM(revenue) AS revenue
  FROM [LeetCode].[dbo].[Department]
GROUP BY id, month
) AS sub
PIVOT(
	SUM(revenue)
    FOR [month] IN (
        [Jan], 
        [Feb], 
        [Mar], 
        [Apr], 
		[May],
        [Jun], 
        [Jul],
		[Aug],
		[Sep],
		[Oct],
		[Nov],
		[Dec])
) AS PivotTable;

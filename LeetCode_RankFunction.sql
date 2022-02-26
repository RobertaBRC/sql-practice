/****** LeetCode Practice 
Creating a function to dynamically find Nth highest salary******/

CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
RETURN(
      SELECT TOP 1 Salary FROM
        (SELECT Salary, DENSE_RANK() OVER (ORDER BY Salary DESC) AS Rank_Salary
        FROM Employee
        WHERE Salary IS NOT NULL) AS Subquery
     WHERE Subquery.Rank_Salary = @N
    );
END;

-- Testing the newly created function:
PRINT dbo.getNthHighestSalary(2);


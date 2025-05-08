
-- Leetcode problem LeetCode SQL Premium Problem 2853: 'Highest Salary Difference'


-- DDL for Salaries table
CREATE TABLE Salaries (
emp_name VARCHAR(50),
department VARCHAR(50),
salary INT,
PRIMARY KEY (emp_name, department)
);

-- DML for Salaries table
INSERT INTO Salaries (emp_name, 
					  department, salary) VALUES
('Kathy', 'Engineering', 50000),
('Roy', 'Marketing', 30000),
('Charles', 'Engineering', 45000),
('Jack', 'Engineering', 85000),
('Benjamin', 'Marketing', 34000),
('Anthony', 'Marketing', 42000),
('Edward', 'Engineering', 102000),
('Terry', 'Engineering', 44000),
('Evelyn', 'Marketing', 53000),
('Arthur', 'Engineering', 32000);



/*
Write an SQL query to calculate the difference 
between the highest salaries 
in the marketing and engineering department. 
Output the absolute difference in salaries.
*/
select * from Salaries
select
            MAX(case when
                 department='Engineering' then salary end)-
            MAX(case when
                 department='Marketing' then salary end) as salary_diff 
from Salaries 

/*other way*/

SELECT 
    (SELECT MAX(salary) FROM Salaries WHERE department = 'Engineering') -
    (SELECT MAX(salary) FROM Salaries WHERE department = 'Marketing') AS salary_diff;

/* for modular level*/
WITH max_salaries AS (
    SELECT department, MAX(salary) AS max_salary
    FROM Salaries
    WHERE department IN ('Engineering', 'Marketing')
    GROUP BY department
)
SELECT 
    MAX(CASE WHEN department = 'Engineering' THEN max_salary END) -
    MAX(CASE WHEN department = 'Marketing' THEN max_salary END) AS salary_diff
FROM max_salaries;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT,
    dep_id INT,
    dep_name VARCHAR(50)
);

INSERT INTO employees (emp_id, emp_name, salary, dep_id, dep_name) VALUES
(1, 'Ankit', 14300, 100, 'Analytics'),
(3, 'Vikas', 12100, 100, 'Analytics'),
(4, 'Rohit', 7260, 100, 'Analytics'),
(5, 'Agam', 15600, 200, 'IT'),
(6, 'Mudit', 15000, 200, 'IT'),
(2, 'Mohit', 14000, 200, 'IT'),
(7, 'Sanjay', 12000, 200, 'IT'),
(8, 'Ashish', 7200, 200, 'IT'),
(10, 'Rakesh', 8000, 300, 'HR'),
(9, 'Mukesh', 7000, 300, 'HR'),
(11, 'Akhil', 4000, 500, 'Ops');

select * from employees

------ find the 3rd highest salary department wise, and if not, give the lowest ---------

WITH ranked_employees AS (
    SELECT *,
           RANK() OVER (PARTITION BY dep_name ORDER BY salary DESC) AS salary_rank,
           DENSE_RANK() OVER (PARTITION BY dep_name ORDER BY salary ASC) AS salary_min_rank,
           COUNT(*) OVER (PARTITION BY dep_name) AS dep_count
    FROM employees
)
SELECT dep_name, emp_name, salary
FROM ranked_employees
WHERE 
    (dep_count >= 3 AND salary_rank = 3)
    OR
    (dep_count < 3 AND salary_min_rank = 1);






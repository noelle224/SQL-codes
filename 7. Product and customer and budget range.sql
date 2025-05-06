CREATE TABLE products (
    product_id VARCHAR(10),
    cost INT
);

CREATE TABLE customers (
    customer_id INT,
    budget INT
);

-- Products table
INSERT INTO products (product_id, cost) VALUES
('P1', 200),
('P2', 300),
('P3', 500),
('P4', 800);

-- Customers table
INSERT INTO customers (customer_id, budget) VALUES
(100, 400),
(200, 800),
(300, 1500);

SELECT * FROM PRODUCTS

SELECT * FROM CUSTOMERS

with cte as (
Select *,
sum(cost) over(order by cost) as running_sum
from products
)
select
customer_id, 
budget, 
count(1) as total_product_count,
STRING_AGG(product_id, ',') as Product_List
from cte A 
join customers B
on B.budget > A.running_sum
group by customer_id, budget

CREATE TABLE orders (
    order_number INT,
    order_date DATE,
    cust_id INT,
    salesperson_id INT,
    amount INT
);

INSERT INTO orders (order_number, order_date, cust_id, salesperson_id, amount) VALUES
(30, '1995-07-14', 9, 1, 460),
(10, '1996-08-02', 4, 2, 540),
(40, '1998-01-29', 7, 2, 2400),
(50, '1998-02-03', 6, 7, 600),
(60, '1998-02-03', 7, 7, 720),
(70, '1998-05-06', 9, 7, 150),
(20, '1999-01-30', 8, 4, 1800);

select * from orders
with ranking as (
select *,
rank() over(partition by salesperson_id order by amount desc) as ranking
from orders
)
select * from ranking where ranking = 1
order by order_number
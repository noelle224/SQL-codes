CREATE TABLE people (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO people (id, name, city) VALUES
(1, 'Sachin', 'Mumbai'),
(2, 'Virat', 'Delhi'),
(3, 'Rahul', 'Bangalore'),
(4, 'Rohit', 'Mumbai'),
(5, 'Mayank', 'Bangalore');

select * from people

-- pivot them city wise

with cte as (
select *,
rank() over(partition by city order by name) as player_groups
from people
)
select 
max(
case when city = 'Bangalore' then name end
) as Bangalore,
max(
case when city = 'Mumbai' then name end
) as Mumbai,
max(
case when city = 'Delhi' then name end
) as Delhi
from cte
group by player_groups
   CREATE TABLE stadium (
    id INT PRIMARY KEY,
    visit_date DATE,
    no_of_people INT
)

INSERT INTO stadium (id, visit_date, no_of_people) VALUES
(1, '2017-07-01', 10),
(2, '2017-07-02', 103),
(3, '2017-07-03', 150),
(4, '2017-07-04', 99),
(5, '2017-07-05', 145),
(6, '2017-07-06', 1455),
(7, '2017-07-07', 199),
(8, '2017-07-08', 188);

select * from stadium

--Q. We want to find sequences of consecutive days where no_of_people >= 100 and the sequence length is at least 3.

-- we want to do consecutive, so we do grouping.

with filtered as (
select *, 
row_number() over(order by visit_date) as rowing
from stadium
where no_of_people >= 100
)
, grouping as (
select *,
dateadd(day, -rowing, visit_date) as grp_date
from filtered
)
SELECT id, visit_date, no_of_people
FROM grouping
WHERE grp_date IN (
  SELECT grp_date
  FROM grouping
  GROUP BY grp_date

  HAVING COUNT(*) >= 3
);





CREATE TABLE sms_log (
    sms_date DATE,
    sender VARCHAR(50),
    receiver VARCHAR(50),
    sms_no INT
);

INSERT INTO sms_log (sms_date, sender, receiver, sms_no) VALUES
('2020-04-01', 'Avinash', 'Vibhor', 10),
('2020-04-01', 'Vibhor', 'Avinash', 20),
('2020-04-01', 'Avinash', 'Pawan', 30),
('2020-04-01', 'Pawan', 'Avinash', 20),
('2020-04-01', 'Vibhor', 'Pawan', 5),
('2020-04-01', 'Pawan', 'Vibhor', 8),
('2020-04-01', 'Vibhor', 'Deepak', 50);

select * from sms_log

with cte as (
select 
sms_date,
case when sender < receiver then sender else receiver end as sender1,
case when sender > receiver then sender else receiver end as receiver1,
sms_no
from sms_log 
)
select sms_date, sender1 as sender, receiver1 as receiver,
sum(sms_no) as total_sms
from cte
group by sms_date, sender1, receiver1 



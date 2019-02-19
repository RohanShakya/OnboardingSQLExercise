--View

--1
create view vwNYsaleman
as
select * from salesman where city='NY'

select * from dbo.vwNYsaleman

--2
create view vwSalesman
as
select salesman_id,name,city from salesman

select * from dbo.vwSalesman

--3
select * from dbo.vwNYsaleman where comission>.13

--4
create view vwgradecount(grade,number) as
select grade, count(*)
from customer
group by grade

select * from dbo.vwgradecount

--5
create view vwtotalforday as
select ord_date,count(customer_id) as c_no,
count(salesman_id) as s_no,
avg(purch_amt) as avg_purch,
sum(purch_amt) as sum_purch
from orders
group by ord_date

select * from vwtotalforday













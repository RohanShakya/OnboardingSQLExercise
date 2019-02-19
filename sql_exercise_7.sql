--Aggregate functions

--1
select sum(purch_amt) from dbo.orders

--2
select avg(purch_amt) from dbo.orders

--3
select count(distinct salesman_id) from orders

--4
select count(*) from customer

--5
select count(all grade) from customer 

--6
select max(purch_amt) from orders

--7
select min(purch_amt) from orders

--8
select city,max(grade) as max_grade from customer
group by city

--9
select customer_id, max(purch_amt) from orders
group by customer_id

--10
select customer_id,ord_date, max(purch_amt) from orders
group by customer_id, ord_date

--11
select salesman_id,max(purch_amt) from orders
where ord_date='2012-08-17'
group by salesman_id

--12
select customer_id,ord_date,max(purch_amt)
from orders
group by customer_id,ord_date
having max(purch_amt)>2000
















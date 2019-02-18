-- SQL subqueries

--1
select * from orders as o
where o.salesman_id=
(select salesman_id from salesman
where name='James')

--2
select * from orders 
where salesman_id =
(select salesman_id from salesman where city='London')

--3
select * from orders
where salesman_id=
(select distinct salesman_id from orders
where customer_id=3007)

--4
select * from orders
where purch_amt>(select avg(purch_amt) 
from orders where ord_date='2012-10-05')

--5
SELECT *
FROM orders
WHERE salesman_id =
    (SELECT salesman_id 
     FROM salesman 
     WHERE city ='NY');

--6
select s.name, s.comission from salesman as s
where salesman_id=(select salesman_id from
customer where city='Paris')

--7
select * from customer
where customer_id=
(select salesman_id-2001 from
salesman where name='Mc')

--8
select grade,count(customer_id) from
customer group by grade having grade>
(select avg(grade) from customer
where city='NY')

--9
select * from customer c, orders o
where c.customer_id=o.customer_id
and o.ord_date='2012-10-05'

--10
select c.cust_name,o.ord_no,o.ord_date,o.purch_amt 
from customer c, orders o
where c.customer_id=o.customer_id
and o.ord_date='2012-08-17'

--11
select s.name, s.salesman_id
from salesman s
where (select count(*) from customer c
where c.salesman_id=s.salesman_id)>1

--12
select * from orders o
where purch_amt>(select avg(purch_amt)
from orders ord where
ord.customer_id=o.customer_id)

--14
select o.ord_date,sum(o.purch_amt) 
from orders o
group by o.ord_date
having sum(o.purch_amt)>(select 1000+
max(purch_amt) from orders a
where o.ord_date=a.ord_date)

--15
select * from customer 
where exists(
select * from customer where city='London'
)

--16
SELECT * 
FROM salesman 
WHERE salesman_id IN (
   SELECT DISTINCT salesman_id 
   FROM customer a 
   WHERE EXISTS (
      SELECT * 
      FROM customer b 
      WHERE b.salesman_id=a.salesman_id 
      AND b.cust_name<>a.cust_name));
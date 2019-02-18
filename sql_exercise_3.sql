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







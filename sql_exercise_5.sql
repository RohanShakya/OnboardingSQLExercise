--Union

--1
select name,'Salesman' from salesman
where city='London'
union
select cust_name,'Customer' from customer
where city='London'

--2
select salesman_id, city from customer
union
select salesman_id,city from salesman

--3
select salesman_id,customer_id from customer
union 
select salesman_id, customer_id from orders

--4
select s.name, ord_date,purch_amt,'max' 
from salesman s, orders o
where s.salesman_id=o.salesman_id
and o.purch_amt=(select max(purch_amt) from orders a
where a.ord_date = o.ord_date)
union
select s.name, ord_date,purch_amt,'min' 
from salesman s, orders o
where s.salesman_id=o.salesman_id
and o.purch_amt=(select min(purch_amt) from orders a
where a.ord_date = o.ord_date)

--5
select s.name,ord_no, ord_date,purch_amt,'max' 
from salesman s, orders o
where s.salesman_id=o.salesman_id
and o.purch_amt=(select max(purch_amt) from orders a
where a.ord_date = o.ord_date)
union
select s.name,ord_no, ord_date,purch_amt,'min' 
from salesman s, orders o
where s.salesman_id=o.salesman_id
and o.purch_amt=(select min(purch_amt) from orders a
where a.ord_date = o.ord_date)
order by 2





















-- Formatting output

--1
select salesman_id,name,city,comission*100 as comission,'%'
from salesman

--2
select 'For',ord_date,'there are',
count(ord_no),'orders'
from orders
group by ord_date

--3
select * from orders order by ord_no

--4
select * from orders order by ord_date desc

--5
select * from orders order by ord_date,purch_amt desc

--6
select cust_name,city,grade
from customer order by customer_id

--7
select salesman_id,ord_date,max(purch_amt) 
from orders 
group by salesman_id,ord_date
order by salesman_id,ord_date

--8
select cust_name,city, grade
from customer order by grade desc

--9
select customer_id,count(distinct ord_no) as ord_count,
max(purch_amt) as max_purch_amt
from orders
group by customer_id
order by ord_count desc

--10
select ord_date,sum(purch_amt) as sum_purch_amt,
sum(purch_amt)*.15
from orders
group by ord_date
order by ord_date





















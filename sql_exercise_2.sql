--SQL Joins
--1
select s.name as salesman, c.cust_name, s.city
from salesman as s
inner join customer as c
on s.salesman_id = c.salesman_id
where s.city = c.city

--2
select o.ord_no,o.purch_amt,c.cust_name,c.city
from orders as o
inner join customer as c
on o.customer_id =c.customer_id
where o.purch_amt between 500 and 2000

--3
select c.cust_name, s.name as salesman 
from salesman s 
inner join customer c
on s.salesman_id=c.salesman_id

--4
select c.cust_name, s.name as salesman, s.comission
from customer c
inner join salesman s
on s.salesman_id =c.salesman_id
where s.comission>0.12

--5
select c.cust_name, c.city, 
s.name as salesman, s.city, s.comission
from customer c
inner join salesman s
on s.salesman_id =c.salesman_id
where s.comission>0.12
and c.city!=s.city

--6
select o.ord_no,o.ord_date,o.purch_amt,
c.cust_name,s.name as salesman
from orders o
inner join customer c
on o.customer_id = c.customer_id
inner join salesman s
on o.salesman_id =s.salesman_id;

--7
--select * from orders
--natural join customer;
--natural join salesman;

--8
select c.cust_name, s.name as salesman
from customer c
left join salesman s
on c.salesman_id=s.salesman_id
order by c.customer_id

--9
select c.cust_name,c.grade, s.name as salesman
from customer c
left join salesman s
on c.salesman_id=s.salesman_id
where c.grade<300
order by c.customer_id

--10
select c.cust_name,c.city,o.ord_no,o.ord_date,o.purch_amt
from orders o
right join customer c
on o.customer_id =c.customer_id
order by o.ord_date

--11
select c.cust_name,c.city,o.ord_no,o.ord_date,
o.purch_amt, s.name as salesman, s.comission
from customer c
left join orders o
on o.customer_id =c.customer_id
left join salesman s
on o.salesman_id = s.salesman_id

--12
select s.name as salesman, c.cust_name
from customer c
right join salesman s
on c.salesman_id =s.salesman_id
order by s.salesman_id

--13
select s.name as salesman, c.cust_name
from customer c
right join salesman s
on c.salesman_id =s.salesman_id
right join orders o
on o.customer_id =c.customer_id

--14
select c.cust_name,s.name as salesman,o.purch_amt
from customer c
right join salesman s
on c.salesman_id =s.salesman_id
left join orders o
on o.customer_id =c.customer_id
where o.purch_amt>=2000
and c.grade is not null

--15
select c.cust_name,c.city,
o.ord_no,o.ord_date,o.purch_amt
from customer c
full outer join orders o
on c.customer_id = o.customer_id

--16
select c.cust_name,c.city,
o.ord_no,o.ord_date,o.purch_amt
from customer c
full outer join orders o
on c.customer_id = o.customer_id
where c.grade is not null

--17
select * from salesman
cross join customer

--18
select * from salesman s
cross join customer c
where s.city is not null

--19
select * from salesman s
cross join customer c
where s.city is not null
and c.grade is not null

--20
select * from salesman s
cross join customer c
where s.city is not null
and s.city!=c.city
and c.grade is not null

--21
create table company_mast(
com_id int primary key not null,
com_name varchar(20)
);

insert into company_mast values
(11,'Samsung'),
(12,'iBall'),
(13,'Epsion'),
(14,'Zebronics'),
(15,'Asus'),
(16,'Frontech')

alter table item_mast
add foreign key(pro_com) references company_mast(com_id)

select *
from item_mast i
inner join company_mast c
on i.pro_com = c.com_id






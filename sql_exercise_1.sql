create table salesman(
salesman_id int primary key not null,
name varchar(20),
city varchar(20),
comission float
);

insert into salesman
values
(5001,'James','New York',0.15);

insert into salesman
values
(5002,'Nail','Paris',0.13),
(5005,'Pit','London',0.11),
(5006,'Mc','Paris',0.14),
(5003,'Lauson','',0.12),
(5007,'Paul','Rome',0.13);

Select * from dbo.salesman

Select 'This is SQL Exercise, Practice and Solution'
select 5,10,15
select 10+15
select 5+10*2-1
select name,comission from dbo.salesman

create table customer(
customer_id int primary key not null,
cust_name varchar(20),
city varchar(20),
grade int,
salesman_id int foreign key references salesman(salesman_id)
);

create table orders(
ord_no int primary key not null,
purch_amt float,
ord_date date,
customer_id int foreign key references customer(customer_id),
salesman_id int foreign key references salesman(salesman_id)
);

insert into customer values
(3002,'Nick','NY',100,5001)

insert into customer values
(3005,'Graham Rimando','California',200,5002),
(3001,'Brad Zusi','London','',5005),
(3004,'Fabian Jons','Paris',300,5006),
(3007,'Brad Davis','NY',200,5001),
(3009,'Geoff Camero','Berlin',100,5003),
(3008,'Julian Green','London',300,5002),
(3003,'Jozy Altidor','Moscow',200,5007);

insert into orders
values
(70001,150.5,'2012-10-05',3005,5002);

insert into orders values
(70009,270.65,'2012-09-10',3001,5005),
(70002,65.26,'2012-10-05',3002,5001),
(70004,110.5,'2012-08-17',3009,5003),
(70007,948.5,'2012-09-10',3005,5002),
(70005,2400.6,'2012-07-27',3007,5001);

select ord_date,salesman_id,ord_no,purch_amt from dbo.orders

select s.salesman_id, o.ord_no 
from salesman as s
inner join orders as o
on s.salesman_id = o.salesman_id

select distinct salesman_id from orders

select name, city from salesman where city='Paris';

select * from customer where grade=200

select ord_no,ord_date,purch_amt from dbo.orders
where salesman_id=5001

create table nobel_win(
year int,
subject varchar(20),
winner varchar(30)
);

insert into nobel_win values
(1970,'Physics','Hannes'),
(1970,'Chemistry','Luis'),
(1970,'Psychology','Ulf'),
(1971,'Physics','Dennis'),
(1971,'Chemistry','Gerhard'),
(1987,'Economics','Robert'),
(1994,'Literature','Kenzzburo');

select * from dbo.nobel_win where year=1970

select winner from dbo.nobel_win 
where year=1971 and subject='Literature';

select year,subject from dbo.nobel_win
where winner='Dennis'

select * from dbo.nobel_win

select winner from dbo.nobel_win
where subject='Physics' and year>=1950

select * from dbo.nobel_win 
where subject='Chemistry' and 
year between 1965 and 1975
 
-- 17
alter table nobel_win
add country varchar(20),
category varchar(20);

select * from nobel_win

update dbo.nobel_win
set country='Sweden',category='Scientist'
where winner='Hannes'

update dbo.nobel_win
set country='Japan',category='Linguist'
where winner='Kenzzburo'

insert into nobel_win values
(1978,'Peace','Menachem','Israel','Prime Minister'),
(1994,'Peace','Yitzhak','Israel','Prime Minister')

select * from dbo.nobel_win
where year>1972 and
category='Prime Minister' and
winner in ('Menachem','Yitzhak')

--18
select * from dbo.nobel_win
where winner like 'Lui%'

--19
select * from dbo.nobel_win
where subject='Physics' and year=1970
union
select * from dbo.nobel_win
where subject='Economics' and year=1971

--20
select * from dbo.nobel_win
where year=1970
except
select * from dbo.nobel_win
where subject='Physiology' or subject='Chemistry'

--21
select * from dbo.nobel_win
where subject='Psychology' and year<1971
union
select * from dbo.nobel_win
where subject='Peace' and year>=1974

--23
select * from dbo.nobel_win
where subject not like 'P%'
order by year desc, winner 

--24
select * from dbo.nobel_win
where year=1970
order by 
 case 
 when subject in('Economics','Chemistry') then 1 
 else 0
 end asc,
subject, winner;

--25
create table item_mast(
pro_id int primary key not null,
pro_name varchar(20),
pro_price int,
pro_com int
);

insert into item_mast values
(101,'Mother board',3200,15),
(102,'Keyboard',450,16),
(103,'Zip drive',250,14),
(104,'Speaker',550,16),
(105,'Monitor',5000,11)


select * from dbo.item_mast
where pro_price between 200 and 600

--26
select avg(pro_price) from dbo.item_mast
where pro_com=16

--28
select pro_name,pro_price from dbo.item_mast
where pro_price>=250 order by pro_price desc,pro_name

--29
select avg(pro_price), pro_com 
from dbo.item_mast group by pro_com

--30
select pro_name,pro_price from dbo.item_mast
where
pro_price=(select min(pro_price) from dbo.item_mast)





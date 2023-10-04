create table customer
(
 "ID" int8 primary key,
 "Name" varchar(50) not null,
 "Age" int not null,
 "City" char(50),
 "Salary" numeric
);

select * from customer

insert into customer
("ID", "Name", "Age", "City", "Salary")
values
(1, 'Sam', 22, 'Delhi', 45000),
(2, 'Rittu', 23, 'Chennai', 48000),
(3, 'Mittu', 24, 'Mumbai', 50000),
(4, 'Chintu', 25, 'Kerala', 51000),
(5, 'Sita', 26, 'Rajasthan', 55000);

update customer
set "Name" = 'Divya', "City" = 'Jaipur'
where "Age" = 26

select * from customer

delete from customer
where "ID" = 5

alter table customer rename to cust2

select * from cust2

alter table cust2 rename to customer

alter table customer rename "ID" TO "CUST_ID"

select * from customer

alter table customer
add column "Address" varchar(300);

alter table customer
drop column "Address"

alter table customer
alter column "CUST_ID" set data type numeric

truncate table customer

select * from customer

drop table customer

create table classroom
(
 "rollno" int8,
 "name" varchar(100),
 "house" char(15),
 "garde" char(1)
);

alter table classroom rename "garde" to "grade"

insert into classroom
("rollno", "name", "house", "grade")
values
(1, 'shubham', 'akash', 'A'),
(2, 'ram', 'agni', 'B'),
(3, 'shyam', 'jai', 'A'),
(4, 'sundar', 'agni', 'B'),
(5, 'ram', 'vayu', 'A');
  
select * from classroom

select distinct name from classroom

select * from classroom
where name = 'ram' and rollno > 2
 
select name from classroom
limit 3

select * from classroom
order by rollno asc

create table customer
( customer_id int8 primary key,
  first_name varchar(50),
  last_name varchar(50),
  email varchar(100),
  address_id int8
);

select * from customer

copy customer(customer_id, first_name, last_name, email, address_id)
from 'E:\customer.csv'
delimiter ','
csv header;

CREATE table payment
(
 customer_id int8 primary key,
 amount numeric,
 mode varchar(100),
 payment_date date
);

copy payment(customer_id, amount, mode, payment_date)
from 'E:\payment.csv'
delimiter ','
csv header;

select * from payment

select * from customer

select replace(first_name, 'Mary', 'John') from customer

select (amount) from payment


SELECT mode, sum(amount) as total
from payment
group by mode
having mode = 'Mobile Payment'

select abs(-4.55)

select ceil(5.66)

select floor(5.66)

select round(5.6689,2)

select * from payment

select power(6,3)

select TRUNCATE(369.339,1);

select sqrt(144);

select 81 mod  8;

select sign(0)

select rand();

select * from customer

select * from customer
where first_name like 'M%' and last_name like 'M%'

select * from customer
where last_name like any (array['S%','R%','K%','P%']);


show timezone

select now()

select current_date

select current_time

select date(current_date)

select * from payment

select age(payment_date) from payment

select trim(to_char(payment_date, 'DD-MM-yyyy'))
from payment





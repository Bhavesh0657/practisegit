select * from test_data

select new_id, new_cat,
sum(new_id) over(partition by new_cat order by new_id) as "total"
from test_data

select new_id, new_cat,
sum(new_id) over (partition by new_cat order by new_id) as "Total",
avg(new_id) over (partition by new_cat order by new_id) as "Avg",
count(new_id) over (partition by new_cat order by new_id) as "Count",
max(new_id) over (partition by new_cat order by new_id) as "Max",
min(new_id) over (partition by new_cat order by new_id) as "Min"
from test_data

select new_id, new_cat,
sum(new_id) over (order by new_id rows between unbounded preceding and unbounded following) as "Total",
avg(new_id) over (order by new_id rows between unbounded preceding and unbounded following) as "Avg", 
count(new_id) over (order by new_id rows between unbounded preceding and unbounded following) as "Count",
min(new_id) over (order by new_id rows between unbounded preceding and unbounded following) as "Min",
max(new_id) over (order by new_id rows between unbounded preceding and unbounded following) as "Max"
from test_data

select new_id, new_cat,
row_number() over (order by new_id) as "ROW_NUMBER",
rank() over (order by new_id) as  "RANK",
dense_rank() over(order by new_id) as "DENSE RANK",
percent_rank() over (order by new_id) as "PERCENT_RANK"
from test_data

select new_id, new_cat,
first_value(new_id) over (order by new_id) as "first_value",
last_value(new_id) over (order by new_id) AS "last_value",
lead(new_id,2) over (order by new_id) as "lead",
lag(new_id,2) over (order by new_id) as "lag"
from test_data

select * from payment1


select customer_id, amount,
case
 when amount > 100 then 'expensive product'
 when amount = 100 then 'moderate product'
 else 'inexpensive product'
end as productstatus
from payment


select customer_id, amount,
case
 when amount > 100 then 'expensive product'
 when amount = 100 then 'moderate product'
 else 'inexpensive product'
end as productsales
from payment1

select customer_id, amount,
case amount
 when 500 then 'prime customer'
 when 100 then 'plus customer'
 else 'regular customer'
end as customerstatues
from payment1

cte (common table expression)

create table customer_CTE
(
 customer_id int,
 first_name varchar(200),
 last_name varchar(200),
 address_id int
)

copy customer_CTE(customer_id, first_name, last_name, address_id)
from 'E:\customer2.csv'
delimiter ','
CSV header

select * from customer_CTE

CREATE table payment_CTE
(
 customer_id int8,
 amount int8,
 mode varchar(200),
 payment_date date
);

copy payment_CTE(customer_id, amount, mode, payment_date)
from 'E:\payment2.csv'
delimiter ','
CSV header

select * from payment_CTE

WITH my_cte as (
     select *, AVG(amount) over(order by p.customer_id) as "average_price",
	 count(address_id) over(order by c.customer_id) as "count"
	 from payment_CTE as p
	 inner join customer_CTE as c
	 on p.customer_id = c.customer_id
)
select first_name, last_name
from my_cte

with my_cte as (
 select mode, max(amount) as highest_price, sum(amount) as total_price
 from payment_CTE
 group by mode
)
select p.*, my.highest_price, my.total_price
from payment_CTE p
join my_cte my
on p.mode = my.mode
order by p.mode










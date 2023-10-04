use HR;

show databases

show tables;

select * from employees

-- like 

select first_name from employees

select first_name from employees
where first_name like 'a%'

select first_name from employees
where first_name like 'b%'

select first_name from employees
where first_name like 'c%'

select first_name from employees
where first_name like '%r'

select first_name from employees
where first_name like '%a'

select first_name from employees
where first_name like 'a%a'

select first_name from employees
where first_name like 'a___'

select first_name from employees
where first_name like 'a%' and length(first_name)=6;

select * from any_table where discount like '50\% discount'

















select 
round((count(*) filter (where gender='M') * 100.0 / count(*)),2) as male_ratio,
round((count(*) filter (where gender='F') * 100.0 / count(*)),2) as female_ratio
from employees

select * from employees
where emp_id <= (select count(emp_id)/2 from employees)

select emp_name, salary
from employees

select salary,
concat(substring(salary::text, 1, length(salary::text)-2), '00') as marked_number
from employees

select salary,
concat(substring(salary::text, 1, length(salary::text)-2), 'XX') as marked_number
from employees

select salary, substring(salary::text, 1, 3) from employees

select salary,
concat(substring(salary::text, 1, length(salary::text)-2), 'XX') as marked_salary
from employees

select * from employees
where mod(emp_id,2) =1;

select * from employees
where mod(emp_id,2)=0;

select * from employees
where mod (emp_id,2) = 1;

select * from
    (select *, row_number() over(order by emp_id) 
	 as rownumber from employees) as emp
where emp.rownumber % 2 = 0

select * from 
    (select *, row_number() over (order by emp_id)
	 as rownumber from employees ) as emp1
where emp1.rownumber % 2 = 1

select emp_name from employees
where emp_name like 'v%a';

select distinct emp_name
from people
where emp_name regexp '^[aeiou]';

select distinct emp_name
from employees
where emp_name similar to '[aeiou]%';

select distinct emp_name from employees
where emp_name similar to '[aeiou]%[aeiou]';

select salary from employees
order by salary desc
limit 1 offset N -1

select * from 
    (select *, 
	 row_number() over (order by emp_id) as row_number
	 from employees ) as emp
where emp.row_number % 2 = 0

select * from 
     (select * ,
	  row_number() over (order by emp_id) as row_number
	  from employees) as emp
where emp.row_number % 2 =1


select emp_name from employees
where emp_name like 'a%'

select emp_name from employees
where emp_name like '_a%'

select emp_name from employees
where emp_name like '%y_'

select emp_name from employees
where emp_name like '____l'

select emp_name from employees
where emp_name like 'v%a'


select emp_name from employees
where emp_name similar to '[aeiou]%'


select emp_name from employees
where emp_name similar to '%[aeiou]'

select emp_name from employees
where emp_name similar to '[aeiou]%[aeiou]'

select salary from employees
order by salary desc
limit 1 offset 1



select e1.salary from employees e1
where 3 = (
     select count(distinct(e2.salary))
      from employees e2
       where e2.salary >= e1.salary) 


delete from employee
where emp_id in 
(select emp_id from employees
 group by emp_id
 having count(*) > 1)


select emp_id, emp_name, salary, city, count(*) as duplicate_count
from employees
group by emp_id, emp_name, salary, city
having count(*) > 1

drop table employees_detail

create table employees_detail 
(
 emp_id int,
 project varchar(12),
 doj date
);

insert into employees_detail
(emp_id, project, doj)
values
(1, 'P1', '2019-01-26'),
(2, 'P2', '2020-05-06'),
(3, 'P1', '2020-01-15'),
(4, 'P2', '2019-02-19'),
(5, 'P1', '2021-12-18');	

select * from employees_detail


with cte as
(
select e.emp_id, e.emp_name, ed.project
from employees e
join employees_detail ed
on e.emp_id = ed.emp_id)
select c1.emp_name, c2.emp_name, c1.project
from cte c1, cte c2
where c1.project = c2.project and c1.emp_id != c2.emp_id and c1.emp_id > c2.emp_id

select emp_name, ed.project, max(e.salary) as project_sal
from employees e
inner join employees_detail ed
on e.emp_id = ed.emp_id
group by emp_name, ed.project
order by project_sal desc


with cte as 
(
select project, emp_name, salary,
row_number() over (partition by project order by salary desc) as row_rank
from employees e
inner join employees_detail ed
on e.emp_id = ed.emp_id
)
select project, emp_name, salary
from cte
where row_rank = 1

select extract (year from doj) as join_year , count(*) as emp_count
from employees e
inner join employees_detail ed
on e.emp_id = ed.emp_id
group by join_year
order by join_year asc


select emp_id, emp_name, salary,
   case 
      when salary > 200000 then 'High'
	  when salary >= 100000 and salary <= 200000 then 'Medium'
	  else 'Low'
   end as status
from employees

select 
  emp_id,
  emp_name,
  sum(case when city = 'pune' then salary end) as "pune",
  sum(case when city = 'chennai' then salary end) as "chennai",
  sum(case when city = 'bangalore' then salary end) as "bangalore"
from employees
group by emp_id, emp_name
order by emp_id desc










use HRDB;

/* 01 */
select e.last_name , e.hire_date
from employees e
join departments d
on e.department_id = d.department_id
where d.department_name = 'Sales';

/* 02 */
select employee_id , last_name
from employees
where salary > (
                 select avg(salary)
                 from employees
			   )
order by salary asc;

/* 03 */
select last_name , emplyoee_id
from employees
where department_id in (
                        select id from
						(select last_name, department_id as id
                         from employees
						 where last_name like "%u%")
                         as sub);
    
/* 04 */
select e.last_name , j.job_id , d.department_id
from employees e
join departments d
on d.department_id = e.department_id
join jobs j
on j.job_id = e.job_id
join locations l
on l.location_id = d.location_id
where l.city = 'ATLANTA';

/* 05 */
select last_name, salary
from employees
where manager_id = (select employee_id from employees where last_name = 'Fillmore');
    
/* 06 */
select e.department_id , e.last_name , e.job_id
from employees e
join departments d
on d.department_id = e.department_id
where d.department_name = 'Operations';

/* 07 */
select employee_id , last_name , salary
from employees
where salary > (select avg(salary) from employees)
                and department_id in (select id from (select department_id as id from employees
				                      where last_name like "%u%")
	            as sub);

/* 08 */
select e.first_name
from employees e
join departments d
on d.department_id = e.department_id
where department_name = 'Sales';

/* 09 */
select employee_id, salary,
case
	when department_id = 10 or department_id = 30 then '5%'
    when department_id = 40 or department_id = 50 then '15%'
    when department_id = 20  then '10%' 
    when department_id = 60 then 'No raise'
    else '-'
end as 'raise percentage',
salary * (1 + case
				when department_id in (10, 30) then 0.05
                when department_id = 20 then 0.10
                when department_id in (40, 50) then 0.15
                when department_id = 60 then 0.00
                else 0.00
end) as new_salary
from employees;

/* 10 */
select last_name, salary
from employees
order by salary desc limit 3;

/* 11 */
select first_name, salary, ifnull(commission_pct, 0) as 'Commission'
from employees;

/* 12 */
select concat(m.first_name, ' ', m.last_name) as Manager_name , m.salary , d.department_name
from employees m
join employees e
on m.employee_id = e.manager_id
join departments d
on d.department_id = m.department_id
group by manager_name , salary , d.department_name
order by salary desc limit 3;
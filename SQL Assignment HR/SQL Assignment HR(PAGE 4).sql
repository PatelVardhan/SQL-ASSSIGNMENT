use HRDB;

select * from employees;

/* 01 */
select e.last_name, d.department_id, d.department_name
from employees e
join departments d
on d.department_id = e.department_id;

/* 02 */
select j.job_title, l.city
from jobs j
join employees e
on e.job_id = j.job_id
join departments d
on d.department_id = e.department_id
join locations l
on l.location_id = d.location_id
where e.department_id = 40;

/* 03 */
select e.last_name, d.department_name, l.location_id, l.city
from employees e
join departments d
on d.department_id = e.department_id
join locations l
on l.location_id = d.location_id
where e.commission_pct is not null;

/* 04 */
select e.last_name, d.department_name
from employees e
join departments d
on d.department_id = e.department_id
where e.last_name like '%a%';

/* 05 */
select e.last_name, j.job_title, d.department_id, d.department_name
from employees e
join departments d
on d.department_id = e.department_id
join jobs j
on j.job_id = e.job_id
join locations l
on l.location_id = d.location_id
where l.city = 'ATLANTA';

/* 06 */
select e.employee_id 'employee id' , e.last_name 'employee name' , e.manager_id 'manager id' , m.last_name 'manager name'
from employees e
join employees m
on e.manager_id = m.employee_id;

/* 07 */
select e.employee_id 'employee id' , e.last_name 'employee name' , e.manager_id 'manager id' , m.last_name 'manager name'
from employees e
left join employees m
on e.manager_id = m.employee_id;

/* 08 */
select e1.last_name as employee_last_name , e1.department_id as department_number , e2.last_name as colleague_last_name
from employees e1
join employees e2
on e1.department_id = e2.department_id and e1.employee_id != e2.employee_id
order by e1.department_id, e1.last_name, e2.last_name;

/* 09 */
select e.first_name , j.job_title , d.department_name, e.salary ,
case
	when salary >= 5000 then 'A'
    when salary >= 3000 then 'B'
    else 'C'
end as 'Grade'
from employees e
join departments d
on e.department_id = d.department_id
join jobs j
on e.job_id = j.job_id;

/* 10 */
select e.hire_date 'employee Hire Date' , e.last_name 'employee name' , m.hire_date 'manager Hire Date' , m.last_name 'manager name'
from employees e
join employees m
on e.manager_id = m.employee_id
where e.hire_date < m.hire_date;
use HRDB;

/* 01 */
select min(salary), max(salary), avg(salary)
from employees
where commission_pct is not null;

/* 02 */
select department_id , sum(salary) as 'total salary' , sum(commission_pct*salary) as 'total commission'
from employees
group by department_id;

/* 03 */
select department_id , count(employee_id) as 'number of employees'
from employees
group by department_id;

/* 04 */
select department_id , sum(salary) as 'total salary'
from employees
group by department_id;

/* 05 */
select first_name
from employees
where commission_pct is null order by 1;

/* 06 */
select first_name 'name', department_id 'dept id', ifnull(commission_pct, 'no commission') 'commission'
from employees;

/* 07 */
select first_name 'name', salary 'salary', ifnull(commission_pct*2, 'no commission') 'commission'
from employees;

/* 08 */
select distinct e1.first_name, e1.department_id
from employees e1
join employees e2 on e1.first_name = e2.first_name
				  and e1.employee_id <> e2.employee_id
				  and e1.department_id = e2.department_id
order by e1.department_id, e1.first_name;

/* 09 */
select manager_id, sum(salary) as 'total salary'
from employees
group by manager_id;

/* 10 */
select concat(m.first_name, ' ', m.last_name) as Manager_name , count(e.employee_id) as Employee_count , m.department_id as Manager_department_id
from employees m
join employees e 
on m.employee_id = e.manager_id
group by m.employee_id, m.first_name, m.last_name, m.department_id
order by Manager_name;

/* 11 */
select concat(m.first_name, ' ', m.last_name) as Manager_name , e.first_name 'employee name' , e.department_id, e.salary
from employees e
join employees m
on m.employee_id = e.manager_id
where substring(e.last_name, 2, 1) = 'a'
order by Manager_name;

/* 12 */
select department_id , avg(salary)
from employees
group by department_id
order by department_id;

/* 13 */
select department_id , max(salary)
from employees
group by department_id
order by department_id;

/* 14 */
select commission_pct,
    case
        when commission_pct is null then 1
        else 0.1 * salary
    end as calculated_commission
from employees;
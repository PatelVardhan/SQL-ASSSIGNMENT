use HRDB;

/* 01 */
select * from employees;

/* 02 */
select * from departments;

/* 03 */
select concat(first_name, ', ', job_id) as 'employee and title'
from employees;
 
/* 04 */
select hire_date, first_name, department_id
from employees
where job_id = 'PU_CLERK';

/* 05 */
select concat_ws(', ', employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
as 'the output' from employees;

/* 06 */
select first_name, salary
from employees
where salary > 2000;

/* 07 */
select first_name as 'name', hire_date as 'start date'
from employees;

/* 08 */
select first_name as 'name', hire_date as 'start date'
from employees
order by hire_date;

/* 09 */
select first_name as 'name', salary as 'salary'
from employees
order by salary desc;

/* 10 */
select first_name as 'name', department_id as 'dept', salary as 'salary'
from employees
where commission_pct is not null
order by salary desc;

/* 11 */
select last_name, job_id
from employees
where manager_id is null;

/* 12 */
select last_name, job_id, salary
from employees
where (job_id = 'SA_REP' or job_id ='ST_CLERK') &&
      (salary <> '2500' && salary <> '3500' && salary <> '5000');
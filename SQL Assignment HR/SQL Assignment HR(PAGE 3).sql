use HRDB;

/* 01 */
select concat(upper(substring(last_name, 2, 1)), lower(substring(last_name, 3, 3))) 'modified last name'
from employees;

/* 02 */
select first_name, last_name, month(hire_date) , concat(first_name, '-', last_name)
from employees;

/* 03 */
SELECT last_name AS "employee last name",
    CASE
        WHEN salary * 0.5 > 10000 THEN ROUND(salary * 1.1 + 1500, 2)
        ELSE ROUND(salary * 1.115 + 1500, 2)
    END AS "adjusted salary"
FROM employees;

/* 04 */
select id, A, B, replace(Manager_name, 'Z', '$')
from (
      select concat(substring(e1.employee_id, 1, 2) , '00' , substring(e1.employee_id, 3,1), 'E') as 'id' , e1.department_id as 'A' , e1.salary as 'B' , upper(concat(e2.first_name, ' ', e2.last_name)) as Manager_name
	  from employees e2 join employees e1
	  on e1.employee_id = e2.manager_id) as sub;
    
/* 05 */
select last_name 'last name',
case
	when last_name like 'M%' or
    last_name like 'J%' or
    last_name like 'A%' then length(last_name)
    else '-'
end as 'name length'
from employees
order by last_name;
    
/* 06 */
select last_name 'last Name', lpad(salary, 15, '$') 'salary'
from employees;

/* 07 */
select first_name
from employees
where first_name = reverse(first_name);

/* 08 */
select first_name from employees;

/* if the name with initial were not in capital then use this: */
select concat(upper(substring(first_name, 1, 1)) , lower(substring(first_name, 2))) 'First Name'
from employees;

/* 09 */
select * from locations;
SELECT 
    SUBSTRING(
               SUBSTRING_INDEX(STREET_ADDRESS, ' ', 3), 
               LOCATE(' ', STREET_ADDRESS) + 1, 
			   LOCATE(' ', SUBSTRING_INDEX(STREET_ADDRESS, ' ', 3), LOCATE(' ', STREET_ADDRESS) + 1) - LOCATE(' ', STREET_ADDRESS) - 1
             ) AS Middle_Word
FROM LOCATIONS;
    
/* 10 */
select first_name, lower(concat(substring(first_name, 1, 1), replace(last_name, ' ', ''), '@systechusa.com')) 'e-mail Address'
from employees;

/* 11 */
select * from jobs;
select first_name, job_title
from employees
join jobs
on jobs.job_id = employees.job_id
where employees.job_id = (select job_id from employees where first_name = 'Trenna');

/* 12 */
select * from emp_details_view;
select first_name, department_name
from emp_details_view
where city = (select city 
            from emp_details_view 
            where first_name = 'Trenna');
            
/* 13 */
select first_name, salary
from employees
order by salary limit 1;

/* 14 */
select first_name, salary
from employees
where salary > (
                select min(salary)
                from employees
                );
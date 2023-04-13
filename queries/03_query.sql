select 
	concat (e1.first_name, ' ', e1.last_name) as employee_full_name,
	e1.title as employee_title,
	age(e1.hire_date, e1.birth_date) as employee_age,
	concat(e2.first_name, ' ', e2.last_name) as manager_full_name,
	e2.title as manager_title
from 
	northwind.employees e1 left join northwind.employees e2
on 
	e1.reports_to = e2.employee_id
order by 
	employee_age, employee_full_name asc;


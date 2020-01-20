1. �������� ��� ���������� � �����������, � ����� ������� ������.
select * from employees
where length(first_name) = (select max(length (first_name)) from employees);

2. �������� ��� ���������� � �����������, � ��������� ������� ������� �������� ���� �����������.
select first_name, salary, (select round(avg(salary)) from employees) avg_salary from employees
where salary > (select avg(salary) from employees);

select * from employees
where salary > (select avg(salary) from employees);


3. �������� �����/������, ��� ���������� � ����� ������������ ������ �����.
select * from employees;
Select * from departments;
select * from locations;
            
select l.location_id, l.city, d.department_id, d.department_name, first_name, salary
from employees e
join departments d on (d.department_id = e.department_id)
join locations l on (l.location_id = d.location_id);

select l.city, count(*), sum(salary), avg(salary)
from employees e
join departments d on (d.department_id = e.department_id)
join locations l on (l.location_id = d.location_id)
group by l.city
having sum(salary) = 
    (select min(sum(salary))
    from employees e
    join departments d on (d.department_id = e.department_id)
    join locations l on (l.location_id = d.location_id)
    group by l.city);



4. �������� ��� ���������� � �����������, � ������� �������� �������� �������� ������ 15000.
select first_name, last_name, salary, manager_id from employees
where manager_id in (select employee_id from employees where salary > 15000);


5. �������� ��� ���������� � �������������, � ������� ��� �� ������ ����������.
select * from employees;
select * from departments;
select * from departments where manager_id is null;
select * from departments where department_id not in (select distinct department_id from employees where department_id is not null);

6. �������� ��� ���������� � �����������, ������� �� �������� �����������.
select * from employees where employee_id not in (select distinct manager_id from employees where manager_id is not null);

7. �������� ��� ���������� � ����������, ������� ����� � ���������� ������ 6�� �����������.
select * from employees 
where employee_id in 
    (select manager_id  from employees group by manager_id having count(*) >= 6);
    
--correlated query.
select * from employees e
where (select count(*) from employees where manager_id = e.employee_id) > 6;


8. �������� ��� ���������� � �����������, ������� �������� � ������������ � ��������� IT . 
select * from employees 
where department_id in (select department_id from departments where upper(department_name) like '%IT%');

9. �������� ��� ���������� � �����������, ��������� ������� ���������� �� ������ � 2005�� ����, �� ��� ��� ���� ���������
���������� �� ������ �� 2005 ����.
select * from employees 
where hire_date < to_date('01-JAN-1999','DD-MON-YYYY') AND
    manager_id in (select employee_id from employees where to_char(hire_date, 'YYYY')='1996');


10.�������� ��� ���������� � �����������, ��������� ������� ���������� �� ������ � ������ ������ ����, � ����� job_title ����
����������� ������ 15�� ��������.
select * from employees e
where manager_id in (select employee_id from employees where to_char(hire_date,'MON') = 'JAN')
    and (select length(job_title) from jobs where job_id = e.job_id) >= 15;
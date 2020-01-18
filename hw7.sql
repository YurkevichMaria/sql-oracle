1. �������� ���������� � �������� � ���������� ����������� � ������ �������.
select * from employees;
select * from departments;
select * from locations;
select * from countries;
select * from regions;

select first_name, e.department_id, d.location_id, l.country_id, r.region_id, region_name
from employees e
join departments d
on (e.department_id = d.department_id)
join locations l
on (d.location_id = l.location_id)
join countries c
on (l.country_id = c.country_id)
join regions r
on (c.region_id = r.region_id)
order by region_name;

select first_name, department_id, location_id, country_id, region_id, region_name
from employees e
natural join departments d
natural join locations l
natural join countries c
natural join regions r
order by region_name;

select first_name, department_id, location_id, country_id, region_id, region_name
from employees e
join departments d using (department_id)
join locations l using (location_id)
join countries c using (country_id)
join regions r using (region_id)
order by region_name;

select region_name, count(first_name)
from employees e
join departments d on (e.department_id = d.department_id)
join locations l on (d.location_id = l.location_id)
join countries c on (l.country_id = c.country_id)
join regions r on (c.region_id = r.region_id)
group by region_name
order by region_name;
 

2. �������� ��������� ���������� � ������ ����������: ���, �������, �������� ������������, job_id, �����, ������ � ������.
select * from employees;
select * from departments;
select * from locations;
select * from countries;
select * from regions;
select * from jobs;
select * from job_history;

select first_name, last_name, department_name, e.job_id, street_address, country_name,region_name
from employees e
join departments d using (department_id)
join locations l using (location_id)
join countries c using (country_id)
join regions r using (region_id);


3. �������� ���������� � ����� ���������� ������� ����� � ���������� ������ 6�� �����������, � ����� �������� ����������
�����������, ������� �� �����������.
select * from employees;
select 
    e2.employee_id manager_id, 
    e2.first_name manager_name, 
    e1.first_name people
from employees e1
join employees e2 
on (e1.manager_id = e2.employee_id);

select 
    e2.employee_id,
    e2.first_name manager_name,
    count(e1.first_name)
from employees e1
join employees e2 
on (e1.manager_id = e2.employee_id)
group by e2.employee_id, e2.first_name
having count(e1.first_name) > 6
order by count(e1.first_name) desc;


4. �������� ���������� � �������� ���� ������������� � � ���������� ����������, ���� � ������������ �������� ������ 30�� �����������.
����������� ���������� �USING� ��� ����������� �� id ������������.
select * from employees;
select * from departments;

select department_name, count (first_name)
from employees
join departments
using (department_id)
group by department_name 
having count (first_name) > 30;

5. �������� �������� ���� �������������, � ������� ��� �� ������ ����������.
select * from employees;
select * from departments;

select department_name
from departments d
left outer join employees e
on (e.department_id = d.department_id)
where first_name is null
order by department_name;


6. �������� ��� ���������� � �����������, ��������� ������� ���������� �� ������ � 2005�� ����, �� ��� ��� ���� ���������
���������� �� ������ �� 2005 ����.
select * from employees;
select * from jobs;
select * from job_history;

select *
from employees e1
join employees e2 
on (e1.manager_id = e2.employee_id)
where to_char(e2.hire_date, 'YYYY') = '1997' and e1.hire_date < to_date('01-JAN-1997', 'DD.MM.YYYY');


7. �������� �������� ������ � �������� ������� ���� ������, ��������� natural join.
select * from countries;
select * from regions;
select country_name, region_name
from countries
natural join regions;

8. �������� �����, ������� � �/� �����������, ������� �������� ������, ��� (����������� �/� �� �� ������������� + 1000).
select * from employees;
select * from jobs;
select first_name, last_name, salary, min_salary
from employees e
join jobs j
on (e.job_id = j.job_id)
where e.salary < j.min_salary + 1000;


9. �������� ���������� ����� � ������� �����������, �������� �����, � ������� ��� ��������. ����� �������� ���������� � �����������,
� ������� ������� ��� ����������. � ����� �������� ��� ������, � ������� ��� ����������� ��������.
select * from employees;
select * from departments;
select * from locations;
select * from countries;

select distinct first_name, last_name, country_name 
from employees e
join departments d on (e.department_id = d.department_id)
join locations l on (d.location_id = l.location_id)
join countries c on (l.country_id = c.country_id);

select distinct first_name, last_name, country_name 
from employees e
left outer join departments d on (e.department_id = d.department_id)
left outer join locations l on (d.location_id = l.location_id)
left outer join countries c on (l.country_id = c.country_id)
where country_name is null;

select distinct first_name, last_name, country_name 
from employees e
right outer join departments d on (e.department_id = d.department_id)
right outer join locations l on (d.location_id = l.location_id)
right outer join countries c on (l.country_id = c.country_id)
where first_name is null;


10.�������� ����� � ������� ���� �����������, � ����� �������� �����, ������� �� �������� ��� ����������� ���������� �� �����
�������� ��� �����-���� ������.
select distinct first_name, last_name, country_name 
from employees e
cross join countries c;


11.������ ������ � 1, ��������� Oracle Join ���������.
select region_name, count(first_name)
from 
    employees e, 
    departments d,
    locations l,
    countries c,
    regions r
where 
    e.department_id = d.department_id and
    d.location_id = l.location_id and 
    l.country_id = c.country_id and 
    c.region_id = r.region_id
group by region_name
order by region_name;

12.������ ������ � 5, ��������� Oracle Join ���������.
select department_name
from 
    departments d, 
    employees e
where 
    d.department_id = e.department_id (+)
    and first_name is null
order by department_name;

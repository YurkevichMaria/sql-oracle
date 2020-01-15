1. �������� ������ �� department_id � ����������� � ������������ ���������, � ����� ������ � ����� ������� ����� ������� �� ������ �
� ����������� �����������. ����������� �� ���������� ����������� (�� ��������).
select department_id, min(salary), max(salary), min(hire_date), max(hire_date), count(*)  
from employees
group by department_id
order by count(*) desc;

2. �������� ���������� � ������ ����� ����� ���������� � ���������� ���, ������� ���������� � ���� �����. �������� ������ ��� ����, 
��� ���������� ���, ������������ � �� ������ 1. ����������� �� ����������.
select substr(first_name, 1, 1), count(*)
from employees
group by substr(first_name, 1, 1) 
having count(*) > 3
order by count(*);

3. �������� id ������������, �/� � ���������� �����������, ������� �������� � ����� � ��� �� ������������ � �������� ���������� ��������.
select department_id, salary, count(*)
from employees
group by department_id, salary;

4. �������� ���� ������ � ���������� �����������, ������� ������� �� ������ � ���� ����.
select to_char(hire_date, 'd'), count(*)
from employees
group by to_char(hire_date, 'd')
order by to_char(hire_date, 'd');

5. �������� id �������������, � ������� �������� ������ 30 ����������� � ����� �� �/�-� ������ 300000.
select department_id, sum(salary), count(*)
from employees
group by department_id
having count(*) > 30 and sum(salary) > 300000;

6. �� ������� countries ������� ��� region_id, ��� ������� ����� ���� ���� �� ����� ������ 50��.
select region_id, count(*), sum(length(country_name))
from countries
group by region_id
having sum(length(country_name)) > 50;

7. �������� ���������� � job_id � ����������� ������� �������� ���������� ��� ������� job_id.
select job_id, round(avg(salary))
from employees
group by job_id
order by job_id;

8. �������� ������ id �������������, � ������� �������� ���������� ���������� (>1) job_id.
select * from employees;
select department_id, count(distinct job_id)
from employees
group by department_id
having count(distinct job_id) > 1;

9. �������� ���������� � department, job_id, ������������ � ����������� �/� ��� ���� ��������� department_id - job_id, 
��� ������� �/� ������ 10000.


10.�������� ������ manager_id, � ������� ������� �������� ���� ��� �����������, �� ������� ������������, ��������� � ���������� �� 6000 �� 9000.


11.�������� ���������� �� ����� (�� ��������) ������������ �������� ����� ���� ������� ������� �� �������������.


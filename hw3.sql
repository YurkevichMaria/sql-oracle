1.�������� ������ ���� ����������� � ������ David
select * from employees where first_name = 'David';

2.�������� ������ ���� �����������, � ������� job_id ����� FI_ACCOUNT
select * from employees where job_id = 'FI_ACCOUNT';

3.�������� ���������� � �����, �������, �/� � ������ ������������ ��� ����������� �� 50�� ������������ � ���������, ������� 4000.
select first_name, last_name, salary, department_id 
from employees 
where department_id = 50 and salary > 4000;

4.C����� ���� �����������, ������� �������� ��� � 20�, ��� � 30� ������������
select * from employees where department_id in (20,30);

5.�������� ������ ���� �����������, � ������� ������ � ��������� ����� � ����� ����� 'a'.
select * from employees where first_name like '_a%a';

6.�������� ������ ���� ����������� �� 50�� � �� 80�� ������������, �������� ���� �����(������������). 
������������ ������ �� email (������������ �������), ��������� ��� ���������� �����.
select * from employees;
select * from employees where department_id in (50,80) and commission_pct is not null
order by email;

7.�������� ������ ���� �����������, � ������� � ����� ���������� ������� 2 ����� 'n'.
select * from employees where first_name like '%n%n%';

8.�������� ������ ���� �����������, � ������� ����� ����� ������ 4 ����. 
������������ ������ �� ������ ������������ (��������� �������) ���, ����� �������� �null� ���� � ����� �����.
select * from employees where first_name like '_____%' 
order by department_id desc nulls last;

9.�������� ������ ���� �����������, � ������� �������� ��������� � ���������� �� 3000 �� 7000 (������������), 
��� ������ (������������) � job_id ����� ��������� ���������: PU_CLERK, ST_MAN, ST_CLERK.
select * from employees where salary between 3000 and 7000 and commission_pct is null and job_id in ('PU_CLERK', 'ST_MAN', 'ST_CLERK');

10.�������� ������ ���� ����������� � ������� � ����� ���������� ������ '%'.
select * from employees where first_name like '%\%%' escape '\';

11.�������� ���������� � job_id, ����� � �/� ��� ����������, ������� id ������� ������ ��� ����� 120 � job_id �� ����� IT_PROG.
������������ ������ �� job_id (������������ �������) � ������ (��������� �������).
select job_id, first_name, salary from employees
where employee_id >= 120 and job_id != 'IT_PROG' order by job_id, first_name desc;

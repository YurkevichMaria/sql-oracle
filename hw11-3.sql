1. ������� ������� emp1000 � ������� subquery ���, ����� ��� ����� �������� ��������� �������� ��������� �������� �� �������
employees: first_name, last_name, salary, department_id;
drop table emp1000;
drop view v1000;

create table emp1000 as
select first_name, last_name, salary, department_id from employees;
select * from emp1000;

2. ������� view v1000 �� ������ select-�, ������� ���������� ������� emp1000 � departments �� ������� department_id. 
View ������ ��������� ��������� �������: first_name, last_name, salary, department_name, city .
create force view v1000 as
select first_name, last_name, salary, department_name, e.city from emp1000 e
join departments d on (e.department_id = d.department_id);
select * from v1000;

3. �������� � ������� emp1000 ������� city .
alter table emp1000 add (city varchar2(20));
select * from emp1000;

4. �������������� view v1000.
alter view v1000 compile;

5. �������� ������� syn1000 ��� v1000.
create synonym syn1000 for v1000;
select * from syn1000;

6. ������� v1000.
drop view v1000;

7. ������� syn1000.
drop synonym syn1000;

8. ������� emp1000.
drop table emp1000;

9. �������� ������������������ seq1000, ������� ���������� � 12, ������������� �� 4, ����� ������������ �������� 200 � �����������.
create sequence seq1000 start with 12 increment by 4 maxvalue 200 cycle;

10.�������� ��� ������������������. ������� ������������ �������� � �����������.
alter sequence seq1000 nomaxvalue nocycle;

11.�������� 2 ������ � ������� employees, ��������� ���������� ��������� ���������� ��������. ��������������
������������������� seq1000 ��� ���������� �������� � ������� employee_id.
desc employees;
select seq1000.nextval from dual;
insert into employees (employee_id, last_name, email, hire_date, job_id) 
values (seq1000.nextval, 'example', 'example', to_date('05-FEB-2020', 'DD-MON-YYYY'), 'IT_PROG');

insert into employees (employee_id, last_name, email, hire_date, job_id) 
values (seq1000.nextval, 'example1', 'example1', to_date('01-FEB-1989', 'DD-MON-YYYY'), 'IT_PROG');
select * from employees;

12.��������� commit.
commit;

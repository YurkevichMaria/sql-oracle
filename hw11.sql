1. ������� ������� friends � ������� subquery ���, ����� ��� ����� �������� ��������� �������� ��������� �������� �� �������
employees: employee_id, first_name, last_name ��� ��� �����, ��� ������� ������������. ������� � ������� friends ������ ����������
id, name, surname.

create table friends as (select employee_id, first_name, last_name from employees where commission_pct is not null);
select * from friends;
alter table friends rename column employee_id to id;
alter table friends rename column first_name to name;
alter table friends rename column last_name to surname;

select * from friends;

2. �������� � ������� friends ����� ������� email .
alter table friends add (email varchar2(20));
select * from friends;

3. �������� ������� email ���, ����� ��� �������� �� ��������� ���� �no email�.
alter table friends modify (email varchar2(20) default 'no email');
select * from friends;

4. ��������� ����������� ����� ������, �������� �� ��������� �������� ������� email.
insert into friends (id, name, surname) values (1, 'Masha', 'Yurkevich');
select * from friends;

5. �������� �������� ������� � id �� friends_id .
alter table friends rename column id to friends_id;
select * from friends;

6. ������� ������� friends.
drop table friends;
select * from friends;

7. ������� ������� friends �� ���������� ���������: id, name, surname, email, salary, city, birthday. � �������� salary � birthday ������ ����
�������� �� ���������.
create table friends (
id integer, 
name varchar2(15), 
surname varchar2(20), 
email varchar2(10), 
salary integer default 25000, 
city varchar2(15),
birthday date default to_date('01-JAN-2020', 'DD-MON-YYYY'));

select * from friends;

8. �������� 1 ������ � ������� friends �� ����� ����������.
insert into friends (id, name, surname, email, salary, city, birthday) 
values (1, 'Masha', 'Yurkevich', 'yurkevich', '2000', 'Minsk', to_date('27-NOV-1995', 'DD-MON-YYYY'));
select * from friends;

9. �������� 1 ������ � ������� friends �� ����� ���������� ����� salary � birthday.
insert into friends (id, name, surname, email, city) 
values (2, 'Luda', 'Misko', 'misko', 'Minsk');
select * from friends;


10.��������� commit.
commit;

11.������� ������� salary.
alter table friends drop column salary;
select * from friends;

12.������� ������� email �������������� (unused).
alter table friends set unused column email;
select * from friends;

13.������� ������� birthday �������������� (unused).
alter table friends set unused column birthday;
select * from friends;

14.������� �� ������� friends �������������� �������.
alter table friends drop unused columns;
select * from friends;

15.������� ������� friends ��������� ������ ��� ������.
alter table friends read only;

16.��������� ���������� �������� ����� DML ��������.
delete from friends where id = 1; 
commit;

17.���������� ������� friends.
alter table friends read write;
truncate table friends;
select * from friends;

18.������� ������� friends.
drop table friends;
select * from friends;



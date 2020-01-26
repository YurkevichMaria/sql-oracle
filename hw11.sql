1. Создать таблицу friends с помощью subquery так, чтобы она после создания содержала значения следующих столбцов из таблицы
employees: employee_id, first_name, last_name для тех строк, где имеются комиссионные. Столбцы в таблице friends должны называться
id, name, surname.

create table friends as (select employee_id, first_name, last_name from employees where commission_pct is not null);
select * from friends;
alter table friends rename column employee_id to id;
alter table friends rename column first_name to name;
alter table friends rename column last_name to surname;

select * from friends;

2. Добавить в таблицу friends новый столбец email .
alter table friends add (email varchar2(20));
select * from friends;

3. Изменить столбец email так, чтобы его значение по умолчанию было «no email».
alter table friends modify (email varchar2(20) default 'no email');
select * from friends;

4. Проверить добавлением новой строки, работает ли дефолтное значение столбца email.
insert into friends (id, name, surname) values (1, 'Masha', 'Yurkevich');
select * from friends;

5. Изменить название столбца с id на friends_id .
alter table friends rename column id to friends_id;
select * from friends;

6. Удалить таблицу friends.
drop table friends;
select * from friends;

7. Создать таблицу friends со следующими столбцами: id, name, surname, email, salary, city, birthday. У столбцов salary и birthday должны быть
значения по умолчанию.
create table friends (
id integer, 
name varchar2(15), 
surname varchar2(20), 
email varchar2(10), 
salary integer default 25000, 
city varchar2(15),
birthday date default to_date('01-JAN-2020', 'DD-MON-YYYY'));

select * from friends;

8. Добавить 1 строку в таблицу friends со всеми значениями.
insert into friends (id, name, surname, email, salary, city, birthday) 
values (1, 'Masha', 'Yurkevich', 'yurkevich', '2000', 'Minsk', to_date('27-NOV-1995', 'DD-MON-YYYY'));
select * from friends;

9. Добавить 1 строку в таблицу friends со всеми значениями кроме salary и birthday.
insert into friends (id, name, surname, email, city) 
values (2, 'Luda', 'Misko', 'misko', 'Minsk');
select * from friends;


10.Совершить commit.
commit;

11.Удалить столбец salary.
alter table friends drop column salary;
select * from friends;

12.Сделать столбец email неиспользуемым (unused).
alter table friends set unused column email;
select * from friends;

13.Сделать столбец birthday неиспользуемым (unused).
alter table friends set unused column birthday;
select * from friends;

14.Удалить из таблицы friends неиспользуемые столбцы.
alter table friends drop unused columns;
select * from friends;

15.Сделать таблицу friends пригодной только для чтения.
alter table friends read only;

16.Проверить предыдущее действие любой DML командой.
delete from friends where id = 1; 
commit;

17.Опустошить таблицу friends.
alter table friends read write;
truncate table friends;
select * from friends;

18.Удалить таблицу friends.
drop table friends;
select * from friends;



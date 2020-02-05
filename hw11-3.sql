1. Создать таблицу emp1000 с помощью subquery так, чтобы она после создания содержала значения следующих столбцов из таблицы
employees: first_name, last_name, salary, department_id;
drop table emp1000;
drop view v1000;

create table emp1000 as
select first_name, last_name, salary, department_id from employees;
select * from emp1000;

2. Создать view v1000 на основе select-а, который объединяет таблицы emp1000 и departments по столбцу department_id. 
View должен содержать следующие столбцы: first_name, last_name, salary, department_name, city .
create force view v1000 as
select first_name, last_name, salary, department_name, e.city from emp1000 e
join departments d on (e.department_id = d.department_id);
select * from v1000;

3. Добавьте в таблицу emp1000 столбец city .
alter table emp1000 add (city varchar2(20));
select * from emp1000;

4. Откомпилируйте view v1000.
alter view v1000 compile;

5. Создайте синоним syn1000 для v1000.
create synonym syn1000 for v1000;
select * from syn1000;

6. Удалите v1000.
drop view v1000;

7. Удалите syn1000.
drop synonym syn1000;

8. Удалите emp1000.
drop table emp1000;

9. Создайте последовательность seq1000, которая начинается с 12, увеличивается на 4, имеет максимальное значение 200 и цикличность.
create sequence seq1000 start with 12 increment by 4 maxvalue 200 cycle;

10.Измените эту последовательность. Удалите максимальное значение и цикличность.
alter sequence seq1000 nomaxvalue nocycle;

11.Добавьте 2 строки в таблицу employees, используя минимально возможное количество столбцов. Воспользуйтесь
последовательностью seq1000 при добавлении значений в столбец employee_id.
desc employees;
select seq1000.nextval from dual;
insert into employees (employee_id, last_name, email, hire_date, job_id) 
values (seq1000.nextval, 'example', 'example', to_date('05-FEB-2020', 'DD-MON-YYYY'), 'IT_PROG');

insert into employees (employee_id, last_name, email, hire_date, job_id) 
values (seq1000.nextval, 'example1', 'example1', to_date('01-FEB-1989', 'DD-MON-YYYY'), 'IT_PROG');
select * from employees;

12.Совершите commit.
commit;

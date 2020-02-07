1. Создать таблицу test200 со следующими столбцами: id, name1, name2, address1, address2. 
1-ый должен быть типа integer, остальные - varchar2.
create table test200 (
id integer,
name1 varchar(25),
name2 varchar(25),
address1 varchar(25),
address2 varchar(25)
);
insert into test200 values (1,'masha', 'masha','beruta','beruta');
insert into test200 values (2,'anna', 'anna','chailytko','chailytko');
insert into test200 values (3,'luda', 'luda','libgnehta','libgnehta');
select * from test200;

2. Напишите такой шаблон для изменения строк, который при каждом запуске будет спрашивать, значение какого столбца меняется, 
на какое значение меняется и для какого значения id меняется.
update test200 set &conumn_name = &column_value where id =&id; 


3. Напишите select, в котором требуется вывести всю информацию из таблицы test200 для строк, у которых столбцы name1 и name2 равны
одному и тому же значению, а также столбцы address1 и address2 тоже равны одному и тому же значению. Напишите такой шаблон для этого
statement-а, который при запуске один раз спросит всего 2 значения – одно для первых 2х столбцов и второе для других 2х столбцов
select * from test200 where name1 = '&&name' and name2 = '&name' and address1 = '&&address' and address2 = '&address';
undefine name;
undefine address;

4. Напишите команду/ды, которая удаляет сессионные значения для наших переменных.
undefine name;
undefine address;

select * from employees;

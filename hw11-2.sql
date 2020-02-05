1. Создать таблицу address со следующими столбцами: id, country, city.
При создании таблицы создайте на inline уровне unique constraint с именем ad_id_un на столбец id.
create table address (
id number constraint ad_id_un unique,
country varchar2(20),
city varchar2(20)
);

2. Создать таблицу friends со следующими столбцами: id, name, email, address_id, birthday. При создании таблицы создайте на inline уровне
foreign key constraint на столбец address_id, который ссылается на столбец id из таблицы address, используйте опцию «on delete set null».
Также при создании таблицы создайте на table уровне check constraint для проверки того, что длина имени должна быть больше 3-х.
create table friends (
id number, 
name varchar2(20), 
email varchar2(30),
address_id number constraint fr_adid_fk references address(id) on delete set null,
birthday date,
constraint fr_name_ch check (length(name)>3) 
);

3. Создайте уникальный индекс на столбец id из таблицы friends.
create unique index fr_id_un on friends(id);

4. С помощью функционала «add» команды «alter table» создайте constraint primary key с названием fr_id_pk на столбец id из таблицы friends.
alter table friends add constraint fr_id_pk primary key (id);

5. Создайте индекс с названием fr_email_in на столбец email из таблицы friends.
create unique index fr_email_in on friends (email);

6. С помощью функционала «modify» команды «alter table» создайте constraint not null с названием fr_email_nn на столбец email из таблицы friends.
alter table friends modify (email constraint fr_email_nn not null);

7. Удалите таблицу friends.
drop table friend;

8. Удалите таблицу address
drop table address;
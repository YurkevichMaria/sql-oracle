1. ���������� � ��������� ������ statemenet ��� �������� ������� locations2, ������� ����� ��������� ����� �� �������, ��� � locations:
CREATE TABLE locations2 AS (SELECT * FROM locations WHERE 1=2);

SELECT * FROM locations WHERE 1=2;
CREATE TABLE locations2 AS (SELECT * FROM locations WHERE 1=2);
select * from locations2; 
desc locations2;


2. �������� � ������� locations2 2 ������ � ����������� � id �������, ������, ������, id ������. ����� ������ ������ ��������� � ������ ������.
insert into locations2 (location_id,city, country_id) values (1, 'Milan', 1);
savepoint s1;
select * from locations2;
insert into locations2 (location_id,city, country_id) values (1, 'Milan', 1);
update locations2 set country_id = 'IT';
select * from locations2;
rollback to savepoint s1;
select * from locations2;
insert into locations2 (location_id,city, country_id) values (2, 'Rome', 1);
select * from locations2;

delete from locations2;
select country_id from countries where country_name = 'Italy';
insert into locations2 (location_id, city, country_id) values (2, 'Rome', 'IT');
insert into locations2 (location_id, city, country_id) values (1, 'Milan', 'IT');
select * from locations2;


3. ��������� commit.
commit;
select * from locations2;

4. �������� � ������� locations2 ��� 2 ������, �� ��������� ������������ ��� ��������, � ������� ��������� ����������. �����
������ ������ ��������� � ������ �������. ��� ��������� ��������, ��� ��������, ����������� �������.
savepoint s1;
insert into locations2 
(select * from locations where country_id = (select country_id from countries where country_name = 'United States of America' ));
select * from locations2;
insert into locations2  
(select * from locations where country_id = (select country_id from countries where country_name = 'United States of America' ));


5. ��������� commit.
commit;

select * from locations2;
savepoint s1;
desc locations2;
insert into locations2 values (3, null, null, initcap('france'), null, upper('fr'));
commit;

6. �������� � ������� locations2 ������ �� ������� locations, � ������� ����� �������� ������� state_province ������ 9.
insert into locations2 (select * from locations where length(state_province) > 9);
select* from locations2;

7. ��������� commit.
commit;

8. ���������� � ��������� ������ statemenet ��� �������� ������� locations4europe, ������� ����� ��������� ����� �� �������, ��� �
locations: CREATE TABLE locations4europe AS (SELECT * FROM locations WHERE 1=2);
CREATE TABLE locations4europe 
AS (SELECT * FROM locations WHERE 1=2);
desc locations4europe;

9. ����� statement-�� �������� � ������� locations2 ��� ���������� ��� ���� ����� �� ������� locations, � � ������� locations4europe
�������� ���������� � id �������, ������, ������, id ������ ������ ��� ��� ����� �� ������� locations, ��� ������ ��������� � ������.
select * from locations;
select * from countries;
select * from regions;
select * from locations l where country_id IN (select country_id from countries where region_id IN (select region_id from regions));

select * from locations4europe;
select * from locations2;

insert all
when lower(region_name) = 'europe' then
into locations4europe (location_id, street_address, city, country_id) values (location_id, street_address, city, country_id)
when 5 = 5 then
into locations2 values (location_id, street_address, postal_code, city, state_province, country_id)
select location_id, street_address, postal_code, city, state_province, l.country_id, region_name  from locations l 
join countries c on (l.country_id = c.country_id) 
join regions r on (c.region_id = r.region_id);

rollback;
select * from locations4europe;
select * from locations2;

10.��������� commit.
commit;

11.� ������� locations2 �������� �������� ��� �� ����� �������� � ��� �������, ��� ������ ��� ���������� � �������� ����.
select * from locations2;
update locations2 set postal_code = 00000000 where postal_code is null;

12.��������� rollback.
rollback;

13.� ������� locations2 �������� �������� ��� � ��� �������, ��� ������ ��� ���������� � �������� ����. ����� �������� ������ ���� �����
�� ������� locations ��� ������ � id 2600.
update locations2 set postal_code = (select postal_code from locations where location_id = 2600) where postal_code is null;
select * from locations2;

14.��������� commit.
commit;

15.������� ������ �� ������� locations2, ��� id ������ �IT�.
delete from locations2 where Upper(country_id) = 'IT';
select * from locations2;


16.�������� ������ savepoint.
savepoint s1;

17.� ������� locations2 �������� ����� � ��� �������, ��� id ������� ������ 2500. ����� �������� ������ ���� �Sezam st. 18�
update locations2 set street_address = 'Sezam st. 18' where location_id > 2500;
select * from locations2;

18.�������� ������ savepoint.
savepoint s2;

19.������� ������ �� ������� locations2, ��� ����� ����� �Sezam st. 18�.
delete from locations2 where street_address = 'Sezam st. 18';
select * from locations2;

20.�������� ��������� �� ������� savepoint.
rollback to savepoint s1;

21.��������� commit.
commit;
1. ������� ������� test200 �� ���������� ���������: id, name1, name2, address1, address2. 
1-�� ������ ���� ���� integer, ��������� - varchar2.
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

2. �������� ����� ������ ��� ��������� �����, ������� ��� ������ ������� ����� ����������, �������� ������ ������� ��������, 
�� ����� �������� �������� � ��� ������ �������� id ��������.
update test200 set &conumn_name = &column_value where id =&id; 


3. �������� select, � ������� ��������� ������� ��� ���������� �� ������� test200 ��� �����, � ������� ������� name1 � name2 �����
������ � ���� �� ��������, � ����� ������� address1 � address2 ���� ����� ������ � ���� �� ��������. �������� ����� ������ ��� �����
statement-�, ������� ��� ������� ���� ��� ������� ����� 2 �������� � ���� ��� ������ 2� �������� � ������ ��� ������ 2� ��������
select * from test200 where name1 = '&&name' and name2 = '&name' and address1 = '&&address' and address2 = '&address';
undefine name;
undefine address;

4. �������� �������/��, ������� ������� ���������� �������� ��� ����� ����������.
undefine name;
undefine address;

select * from employees;

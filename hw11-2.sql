1. ������� ������� address �� ���������� ���������: id, country, city.
��� �������� ������� �������� �� inline ������ unique constraint � ������ ad_id_un �� ������� id.
create table address (
id number constraint ad_id_un unique,
country varchar2(20),
city varchar2(20)
);

2. ������� ������� friends �� ���������� ���������: id, name, email, address_id, birthday. ��� �������� ������� �������� �� inline ������
foreign key constraint �� ������� address_id, ������� ��������� �� ������� id �� ������� address, ����������� ����� �on delete set null�.
����� ��� �������� ������� �������� �� table ������ check constraint ��� �������� ����, ��� ����� ����� ������ ���� ������ 3-�.
create table friends (
id number, 
name varchar2(20), 
email varchar2(30),
address_id number constraint fr_adid_fk references address(id) on delete set null,
birthday date,
constraint fr_name_ch check (length(name)>3) 
);

3. �������� ���������� ������ �� ������� id �� ������� friends.
create unique index fr_id_un on friends(id);

4. � ������� ����������� �add� ������� �alter table� �������� constraint primary key � ��������� fr_id_pk �� ������� id �� ������� friends.
alter table friends add constraint fr_id_pk primary key (id);

5. �������� ������ � ��������� fr_email_in �� ������� email �� ������� friends.
create unique index fr_email_in on friends (email);

6. � ������� ����������� �modify� ������� �alter table� �������� constraint not null � ��������� fr_email_nn �� ������� email �� ������� friends.
alter table friends modify (email constraint fr_email_nn not null);

7. ������� ������� friends.
drop table friend;

8. ������� ������� address
drop table address;
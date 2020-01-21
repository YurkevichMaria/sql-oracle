1. �������� � ����� ������� ���������� � ������ �/� �����,
����������� �� id ���������, �� job_id, �� id ������������. ������
������ ��������� 4 �������: id ���������, job_id, id ������������,
������������� �/�.
select manager_id, job_id, department_id, sum(salary) from employees
group by manager_id, job_id, department_id
order by manager_id, job_id, department_id;

select manager_id, to_char(null),to_number(null), sum(salary) from employees group by manager_id
union 
select to_number(null), job_id, to_number(null), sum(salary) from employees group by job_id
union 
select to_number(null), to_char(null), department_id, sum(salary) from employees group by department_id;


2. �������� id ��� �������������, ��� �������� �������� � 100 � ��
�������� ��������� � 145, 201.
select department_id from employees
where manager_id = 100 and manager_id not in (145, 201);

select department_id from employees where manager_id = 100
minus
select department_id from employees where manager_id in (145, 201);


3. ��������� SET ��������� � �� ��������� ���������� ���������,
�������� ���������� ���������� � ������, �������� � �/�
�����������, ������ ������ � ������ ������� ����� ��, � �������
�������� ����� �s� ��� ����������� �� ��������. ������������
��������� �� �/� �� ��������.
select first_name, last_name, salary from employees where first_name like '_a%'
intersect
select first_name, last_name, salary from employees where upper(last_name) like '%S%'
order by salary desc;


4. ��������� SET ��������� � �� ��������� ���������� ���������,
�������� ���������� � id �������, �������� ���� � ������ ���
�������, ������� ��������� � ������ ��� ��������. � ����� ���
�������, �������� ��� ������� �������� ����� �9�.
select * from locations;
select * from countries;

select location_id, postal_code, city from locations 
    where country_id in 
    (select country_id from countries where country_name in ('Italy', 'Germany'))
union 
select location_id, postal_code, city from locations 
    where postal_code like '%9%'
order by city;

5. ��������� SET ��������� � �� ��������� ���������� ���������,
�������� ��� ���������� ���������� ��� �����, ����� ���
������� ������ 8 ��������. � ����� ��� �����, ������� ��������� �� �
����������� �������. ������� ������� ������ ���������� id, country,
region. ������ ������������ �� �������� ����� �� ���������.
select * from countries;
select * from regions;
select * from countries where length(country_name) > 8
union
select * from countries where region_id in (select region_id from regions where region_name != 'Europe')
order by 2 desc;

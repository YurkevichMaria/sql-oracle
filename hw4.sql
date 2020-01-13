1. �������� ������ ���� �����������, � ������� ����� ����� ������ 10 ����.
select * from employees where length (first_name) > 10;

2. �������� ������ ���� �����������, �������� ������� ������ 1000.
select * from employees where mod(salary, 1000) = 0;

3. �������� ���������� ����� � ������ 3� ������� ����� ����������� ������ ����������, ���� ��� ����� ����������� � ������� ���.���.���� .
select phone_number, substr(phone_number,1,3) from employees where phone_number like '___.___.____';

4. �������� ������ ���� �����������, � ������� ��������� ����� � ����� ����� 'm' � ����� ����� ������ 5��.
select * from employees where substr(first_name, -1, 1) = 'm' and length (first_name) > 5;
select * from employees where first_name like '%m' and length (first_name) > 5;

5. �������� ���� ��������� �������.
select next_day(sysdate, 5) from dual;

6. �������� ������ ���� �����������, ������� �������� � �������� ������ 12 ��� � 6�� ������� (150 �������).
select * from employees where months_between (sysdate, hire_date) > 150;

7. �������� ���������� �����, ������� � �������� PHONE_NUMBER ��� '.' �� '-'.
select replace(phone_number, '.', '-') from employees;

8. �������� ���, email, job_id ��� ���� ���������� � �������: STEVEN sking Ad_Pres
select rpad(Upper(first_name), 15, ' ') || rpad (lower(email), 15, ' ') || rpad(initcap(job_id), 7, ' ') employ from employees;

9. �������� ���������� � ����� ��������� � ��� �/�, �� ��������� ������ || , � ����� ����: Steven24000
select rpad(initcap(first_name), length(first_name)+ length(salary), salary) from employees;
select concat(first_name, salary) from employees;

10.�������� ���������� � ���� ����� ���������� �� ������, ���������� ���� ����� �� ������ �� ������ � ������ ��� ���� ����� �� ������.
select hire_date, round(hire_date, 'MM'), round(hire_date, 'DD') from employees; 

11.�������� ���������� � ����� � ������� ���� ����������. ��� ������ �������� �� 10 �������� � ���� ����� ����� ������ 10, ��
���������� �� 10 �������� ������ $. ������� ������ �������� �� 15 �������� � ���� ����� ������� ������ 15, �� ����� ��������
������� ������� ������ ! ������� ����������.
select rpad(first_name, 10, '$'), lpad(last_name, 15, '!') from employees;

12.�������� ��� ���������� � ������� ������ ����� �a� � ��� �����.
select first_name, instr(first_name, 'a', 1, 2) from employees;

13.�������� �� ����� ����� '!!!HELLO!! MY FRIEND!!!!!!!!' � ��� �� �����, �� ��� ������� ��������������� ���� � ������ � ����� ������.
select '!!!HELLO!! MY FRIEND!!!!!!!!' text, trim (both '!' from '!!!HELLO!! MY FRIEND!!!!!!!!') newtext from dual;

14.�������� ���������� �:
? �/� ���������,
? �/� ���������� �� ����������� 3.1415 ,
? ���������� �� ������ �������� ������� ����������� �/�-��,
? ����� ���������� ����� �� ����������� �/�
select salary, salary*3.141589, round(salary*3.141589), trunc(salary*3.141589, -3) from employees; 

15.�������� ���������� �:
? ���� ����� ���������� �� ������,
? ����, ������� ���� ����� ��� ����, ����� �������� ���������� �� ������,
? ���� ���������� ��� � ������ �������� ���������� �� ������.
select hire_date, add_months(hire_date, 6), last_day(hire_date) from employees;





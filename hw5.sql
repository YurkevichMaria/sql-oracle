1. ��������� �������, �������� ������ ���� ����������� � ������� � ����� ���� ����� 'b' (��� ����� ��������).
select * from employees where first_name like '%b%' or first_name like '%B%';
select * from employees where instr(Upper(first_name), 'B') > 0;

2. ��������� �������, �������� ������ ���� ����������� � ������� � ����� ���������� ������� 2 ����� 'a'.
select * from employees where first_name like '%a%a' or first_name like '%A%a';
select first_name, instr(first_name, 'a'), instr(first_name, 'a',instr(first_name, 'a')+1) from employees;
select * from employees 
where instr(Upper(first_name), 'A', instr(Upper(first_name), 'A') + 1) > 2;
select * from employees where instr(upper(first_name), 'A', 1, 2) > 0;

3. �������� ������ ����� �� ����� ������������, ��� ��� �������������, � ������� �������� ������� ������, ��� �� ������ �����.
select * from departments;
select department_name, 
substr(department_name, 1, instr(department_name, ' ')) 
from departments where instr(department_name, ' ') > 1;

4. �������� ����� ����������� ��� ������ � ��������� ����� � �����.
select first_name, 
trim (trailing 
substr(first_name, Length(first_name)) 
from
trim (leading substr(first_name, 1, 1) 
from first_name)) from employees;
select first_name, substr(first_name, 2, Length(first_name)-2) from employees;

5. �������� ������ ���� �����������, � ������� � �������� job_id ����� ����� '_' ��� ������� 3 �������, �� ��� ���� ��� �������� ����� '_' �� ����� 'CLERK'.
select instr(job_id, '_') from employees;
select * from employees 
where length (substr(job_id, instr(job_id, '_')+1)) >= 3
and Upper(substr(job_id, instr(job_id, '_')+1)) != 'CLERK';

select * from employees 
where length (substr(job_id, instr(job_id, '_')+1)) >= 3
and job_id not like '%CLERK';

6. �������� ������ ���� �����������, ������� ������ �� ������ � ������ ���� ������ ������.
select * from employees where hire_date = trunc(hire_date, 'MM');
select * from employees where to_char(hire_date, 'DD') = '01';

7. �������� ������ ���� �����������, ������� ������ �� ������ � 2008�� ����.
select * from employees where To_date ('01-JAN-94') = trunc(hire_date, 'YYYY');
select * from employees where to_char(hire_date, 'YYYY') = '2008';

8. �������� ���������� ���� � �������: Tomorrow is Second day of January
select to_char(sysdate + 1) || ' is Second day of ' || to_char(sysdate, 'Month') as mydate from dual;
select to_char(sysdate + 1, 'fm"Tomorrow is "DDspth" day of "Month') from dual;

9. �������� ��� ���������� � ���� ��� ������� �� ������ � �������: 21st of June, 2007
select first_name, to_char(hire_date, 'fmddth" of "Month", "YYYY') from employees;

10. �������� ������ ���������� � ������������ ���������� �� 20%. �������� �������� � �������: $28,800.00
select first_name, salary, to_char(salary * 1.2, '$999,999.99') from employees;

11. �������� ���������� ���� (��������), + �������, + ������, + ���, + ����, + �����, + ���. 
(�� ��� �� ����������� ������������ � ���������� ����).;
select 
to_char(sysdate, 'DD-MON-YY HH24:MI:SS')              nowtime, 
to_char(sysdate + 1/24/60/60, 'DD-MON-YY HH24:MI:SS') plus_sec, 
to_char(sysdate + 1/24/60, 'DD-MON-YY HH24:MI:SS')    plus_mins,
to_char(sysdate + 1/24, 'DD-MON-YY HH24:MI:SS')       plus_hour, 
sysdate + 1                                           plus_day, 
add_months(sysdate, 1)                                plus_month, 
add_months(sysdate, 12)                               plus_year 
from dual;

12. �������� ��� ����������, ��� �/� � ����� �/�, ������� ����� ������ ���� ��� �������� ������ �$12,345.55�.
select first_name, salary, salary + to_number('$12,345.55', '$99,999.99') new_salary from employees;

13. �������� ��� ����������, ���� ��� ���������������, � ����� ���������� ������� ����� ��� ��� ��������������� � �����, 
������� ���������� �������� �� ������ �SEP, 18:45:00 18 2009�.
select first_name, hire_date,
round(months_between(to_date('SEP, 18:45:00 18 2009', 'MON, HH24:MI:SS DD YYYY'), hire_date), 3) stazh
from employees;

14. �������� ��� ����������, ��� �/�, � ����� ������ �/� (salary + commission_pct(%)) � �������: $24,000.00 .
select first_name , salary, commission_pct,  to_char(salary * NVL2(commission_pct, commission_pct + 1, 1), '$99,999.99') from employees;

15. �������� ��� ����������, ��� �������, � ����� ��������� �different length�, ���� ����� ����� �� ����� ����� ������� 
��� ��������� �same length�, ���� ����� ����� ����� ����� �������. �� ����������� conditional functions.
select first_name, last_name, 
case
when length(first_name) != length(last_name) then 'different length'
else 'same length'
end
from employees;

select first_name, last_name, 
nvl2(nullif(length(first_name), length(last_name)), 'different length', 'same length') 
from employees;

16. �������� ��� ����������, ��� ������������, � ����� ���������� � ������� ������� � �������� � ���� �� � ���� ������������ (Yes/No).
select first_name, commission_pct, nvl2(commission_pct, 'yes', 'no') bonus from employees;

17. �������� ��� ���������� � ��������, ������� ��� ����� ���������������: 
�������� ������������, ���� ������������, 
���� ���, �� id ��� ���������,
���� � ��� �����������, �� ��� �/�.
select first_name, commission_pct, manager_id, salary,
nvl2(commission_pct, commission_pct, nvl2(manager_id, manager_id, salary)) result
from employees; 

select first_name, commission_pct, manager_id, salary,
coalesce (commission_pct, manager_id, salary)
from employees;

18. �������� ��� ����������, ��� �/�, � ����� ������� �������� �������
����������: ������ 5000 ��������� Low level, ������ ��� ����� 5000
� ������ 10000 ��������� Normal level, ������ ��� ����� 10000
��������� High level.
select first_name, salary,
    case
        when salary < 5000 then 'low level'
        when salary >= 5000 and salary < 10000 then 'normal level'
        when salary >= 10000 then 'high level'
        else 'unknown'
    end salarylevel
from employees;

19. ��� ������ ������ �������� ������, � ������� ��� ���������: 1-
Europe, 2-America, 3-Asia, 4-Africa . ��������� ������ �������, ��
��������� ���������� JOIN. ����������� DECODE.
select country_name, region_id, Decode(region_id, 1, '1Europe', 2, '2America', 3, '3Asia', 4, '4Africa') fullform from countries;

20. ������ �19 ������ ��������� CASE.
select country_name, region_id, 
    case region_id
        when 1 then '1Europe'
        when 2 then '2America'
        when 3 then '3Asia'
        when 4 then '4Africa'
    end
from countries;

21. �������� ��� ����������, ��� �/�, � ����� ������� ����, ��������� �
���������� ������� ������� :
--BAD: �/� ������ 10000 � ���������� ������������;
--NORMAL: �/� ����� 10000 � 15000 ���, ���� ������������ ������������;
--GOOD: �/� ������ ��� ����� 15000.
select first_name, salary, commission_pct, 
case 
when salary < 10000 and commission_pct is null then 'bad'
when salary between 10000 and 15000 or commission_pct is not null then 'normal'
when salary >= 15000 then 'good'
end as result
from employees;

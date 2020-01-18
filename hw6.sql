1. ѕолучить репорт по department_id с минимальной и максимальной зарплатой, с самой ранней и самой поздней датой прихода на работу и
с количеством сотрудников. —ортировать по количеству сотрудников (по убыванию).
select department_id, min(salary), max(salary), min(hire_date), max(hire_date), count(*)  
from employees
group by department_id
order by count(*) desc;

2. ¬ыведите информацию о первой букве имени сотрудника и количество имЄн, которые начинаютс€ с этой буквы. ¬ыводить строки дл€ букв, 
где количество имЄн, начинающихс€ с неЄ больше 1. —ортировать по количеству.
select substr(first_name, 1, 1), count(*)
from employees
group by substr(first_name, 1, 1) 
having count(*) > 1
order by count(*) desc;

3. ¬ыведите id департамента, з/п и количество сотрудников, которые работают в одном и том же департаменте и получают одинаковую зарплату.
select department_id, salary, count(*)
from employees
group by department_id, salary;

4. ¬ыведите день недели и количество сотрудников, которых прин€ли на работу в этот день.
select to_char(hire_date, 'day'), count(*)
from employees 
group by to_char(hire_date, 'day')
order by to_char(hire_date, 'day');

5. ¬ыведите id департаментов, в которых работает больше 30 сотрудников и сумма их з/п-т больше 300000.
select department_id, sum(salary), count(*)
from employees
group by department_id
having count(*) > 30 and sum(salary) > 300000;

6. »з таблицы countries вывести все region_id, дл€ которых сумма всех букв их стран больше 50ти.
select region_id, count(*), sum(length(country_name))
from countries
group by region_id
having sum(length(country_name)) > 50;

7. ¬ыведите информацию о job_id и округленную среднюю зарплату работников дл€ каждого job_id.
select job_id, round(avg(salary))
from employees
group by job_id
order by job_id;

8. ѕолучить список id департаментов, в которых работают сотрудники нескольких (>1) job_id.
select department_id, count(distinct job_id)
from employees
group by department_id
having count(distinct job_id) > 1;

9. ¬ыведите информацию о department, job_id, максимальную и минимальную з/п дл€ всех сочетаний department_id - job_id, 
где средн€€ з/п больше 10000.
select department_id, job_id, min(salary), max(salary)
from employees
group by department_id, job_id
having avg(salary) > 10000
order by department_id;

10.ѕолучить список manager_id, у которых средн€€ зарплата всех его подчиненных, не имеющих комиссионные, находитс€ в промежутке от 6000 до 9000.
select * from employees;
select manager_id, round(avg(salary))
from employees
where commission_pct is null
group by manager_id
having avg(salary) between 6000 and 9000;

11.¬ыведите округлЄнную до тыс€ч (не тыс€чных) максимальную зарплату среди всех средних зарплат по департаментам.
select round(max(avg(salary)),-3)
from employees
group by department_id;



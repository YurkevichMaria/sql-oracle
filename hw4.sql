1. Получите список всех сотрудников, у которых длина имени больше 10 букв.
select * from employees where length (first_name) > 10;

2. Получите список всех сотрудников, зарплата которых кратна 1000.
select * from employees where mod(salary, 1000) = 0;

3. Выведите телефонный номер и первое 3х значное число телефонного номера сотрудника, если его номер представлен в формате ХХХ.ХХХ.ХХХХ .
select phone_number, substr(phone_number,1,3) from employees where phone_number like '___.___.____';

4. Получите список всех сотрудников, у которых последняя буква в имени равна 'm' и длина имени больше 5ти.
select * from employees where substr(first_name, -1, 1) = 'm' and length (first_name) > 5;
select * from employees where first_name like '%m' and length (first_name) > 5;

5. Выведите дату следующей пятницы.
select next_day(sysdate, 5) from dual;

6. Получите список всех сотрудников, которые работают в компании больше 12 лет и 6ти месяцев (150 месяцев).
select * from employees where months_between (sysdate, hire_date) > 150;

7. Выведите телефонный номер, заменив в значении PHONE_NUMBER все '.' на '-'.
select replace(phone_number, '.', '-') from employees;

8. Выведите имя, email, job_id для всех работников в формате: STEVEN sking Ad_Pres
select rpad(Upper(first_name), 15, ' ') || rpad (lower(email), 15, ' ') || rpad(initcap(job_id), 7, ' ') employ from employees;

9. Выведите информацию о имени работника и его з/п, не используя символ || , в таком виде: Steven24000
select rpad(initcap(first_name), length(first_name)+ length(salary), salary) from employees;
select concat(first_name, salary) from employees;

10.Выведите информацию о дате приёма сотрудника на работу, округлённой дате приёма на работу до месяца и первом дне года приёма на работу.
select hire_date, round(hire_date, 'MM'), round(hire_date, 'DD') from employees; 

11.Выведите информацию о имени и фамилии всех работников. Имя должно состоять из 10 символов и если длина имени меньше 10, то
дополняйте до 10 символов знаком $. Фамилия должна состоять из 15 символов и если длина фамилии меньше 15, то перед фамилией
ставьте столько знаков ! сколько необходимо.
select rpad(first_name, 10, '$'), lpad(last_name, 15, '!') from employees;

12.Выведите имя сотрудника и позицию второй буквы ‘a’ в его имени.
select first_name, instr(first_name, 'a', 1, 2) from employees;

13.Выведите на экран текст '!!!HELLO!! MY FRIEND!!!!!!!!' и тот же текст, но без символа восклицательный знак в начале и конце текста.
select '!!!HELLO!! MY FRIEND!!!!!!!!' text, trim (both '!' from '!!!HELLO!! MY FRIEND!!!!!!!!') newtext from dual;

14.Выведите информацию о:
? з/п работника,
? з/п умноженной на коэффициент 3.1415 ,
? округлённый до целого значения вариант увеличенной з/п-ты,
? целое количество тысяч из увеличенной з/п
select salary, salary*3.141589, round(salary*3.141589), trunc(salary*3.141589, -3) from employees; 

15.Выведите информацию о:
? дате приёма сотрудника на работу,
? дате, которая была через пол года, после принятия сотрудника на работу,
? дате последнего дня в месяце принятия сотрудника на работу.
select hire_date, add_months(hire_date, 6), last_day(hire_date) from employees;





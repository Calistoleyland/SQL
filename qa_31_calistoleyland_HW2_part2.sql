/* Таблица employees

1)	Создать таблицу employees
- id. serial,  primary key,
- employee_name. Varchar(50), not null
2)	Наполнить таблицу employee 70 строками.*/

create table employees (
	id serial primary key not null,
	employee_name varchar (50) not null);

insert into employees (employee_name)
values ('diana1'), ('diana2'), ('diana3'), ('diana4'), ('diana5'), ('diana6'), ('diana7'), ('diana8'), ('diana9'), ('diana10'), ('diana11'), ('diana12'), ('diana13'), ('diana14'),
('diana15'), ('diana16'), ('diana17'), ('diana18'), ('diana19'), ('diana20'), ('diana21'), ('diana22'), ('diana23'), ('diana24'), ('diana25'), ('diana26'), ('diana27'), ('diana28'),
('diana29'), ('diana30'), ('diana31'), ('diana32'), ('diana33'), ('diana34'), ('diana35'), ('diana36'), ('diana37'), ('diana38'), ('diana39'), ('diana40'), ('diana41'), ('diana42'),
('diana43'), ('diana44'), ('diana45'), ('diana46'), ('diana47'), ('diana48'), ('diana49'), ('diana50'), ('diana51'), ('diana52'), ('diana53'), ('diana54'), ('diana55'), ('diana56'),
('diana57'), ('diana58'), ('diana59'), ('diana60'), ('diana61'), ('diana62'), ('diana63'), ('diana64'), ('diana65'), ('diana66'), ('diana67'), ('diana68'), ('diana69'), ('diana70');

select * from employees;

/* Таблица salary1

3)	Создать таблицу salary
- id. Serial  primary key,
- monthly_salary. Int, not null
4)	Наполнить таблицу salary 15 строками:
- 1000
- 1100
- 1200
- 1300
- 1400
- 1500
- 1600
- 1700
- 1800
- 1900
- 2000
- 2100
- 2200
- 2300
- 2400
- 2500 */

create table salary1 (
	id serial primary key not null,
	monthly_salary int not null
);

insert into salary1 (monthly_salary)
values (1000),
	   (1100),
	   (1200),
	   (1300),
	   (1400),
	   (1500),
	   (1600),
	   (1700),
	   (1800),
	   (1900),
	   (2000),
	   (2100),
	   (2200),
	   (2300),
	   (2400),
	   (2500);


select * from salary1;

/* Таблица employee_salary

5)	Создать таблицу employee_salary
- id. Serial  primary key,
- employee_id. Int, not null, unique
- salary_id. Int, not null */

create table employee_salary (
	id serial primary key not null,
	employee_id int unique not null,
	salary_id int not null
);

/*6)	Наполнить таблицу employee_salary 40 строками:
- в 10 строк из 40 вставить несуществующие employee_id */  

insert into employee_salary (employee_id, salary_id)
values (1,1), (2,2), (3,3), (4,4), (5,5), (6,6), (7,7), (8,8), (9,9), (10,10), (11,11), (12,12), (13,13), (14,14), (15,15), (16,16),
(17,1), (18,2), (19,3), (20,4), (21,5), (22,6), (23,7), (24,8), (25,9), (26,10), (27,11), (28,12), (29,13), (30,14),
(71,1), (72,2), (73,3), (74,4), (75,5), (76,6), (77,7), (78,8), (79,9), (80,10);

select * from employee_salary;


/* Таблица roles

7)	Создать таблицу roles1
- id. Serial  primary key,
- role_name. int, not null, unique*/

create table roles1 (
	id serial primary key not null,
	role_name int not null unique);

/*8) Поменять тип столба role_name с int на varchar(30)*/

alter table roles1
alter column role_name type varchar (30);

/* 9)	Наполнить таблицу roles 20 строками:
id	role_name
1	Junior Python developer
2	Middle Python developer
3	Senior Python developer
4	Junior Java developer
5	Middle Java developer
6	Senior Java developer
7	Junior JavaScript developer
8	Middle JavaScript developer
9	Senior JavaScript developer
10	Junior Manual QA engineer
11	Middle Manual QA engineer
12	Senior Manual QA engineer
13	Project Manager
14	Designer
15	HR
16	CEO
17	Sales manager
18	Junior Automation QA engineer
19	Middle Automation QA engineer
20	Senior Automation QA engineer */

insert into roles1 (role_name)
values ('Junior Python developer'),
 	   ('Middle Python developer'),
	   ('Senior Python developer'),
	   ('Junior Java developer'),
	   ('Middle Java developer'),
	   ('Senior Java developer'),
	   ('Junior JavaScript developer'),
	   ('Middle JavaScript developer'),
	   ('Senior JavaScript developer'),
	   ('Junior Manual QA engineer'),
	   ('Middle Manual QA engineer'),
	   ('Senior Manual QA engineer'),
	   ('Project Manager'),
	   ('Designer'),
	   ('HR'),
	   ('CEO'),
	   ('Sales manager'),
	   ('Junior Automation QA engineer'),
	   ('Middle Automation QA engineer'),
	   ('Senior Automation QA engineer');

select * from roles1;


/* Таблица roles_employee

10)	Создать таблицу roles_employee
- id. Serial  primary key,
- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
- role_id. Int, not null (внешний ключ для таблицы roles1, поле id)*/

create table roles_employee (
	id serial primary key not null,
	employee_id int not null unique,
	role_id int not null,
	foreign key (employee_id) references employees(id),
	foreign key (role_id) references roles1(id)
);


/* 11)	Наполнить таблицу roles_employee 40 строками:*/

insert into roles_employee (employee_id, role_id)
values (7,2), (20,4), (3,9), (5,13), (23,4), (11,2), (10,9), (22,13), (21,3), (34,4), (6,7), (12,12), (13,13), (14,14), (15,15), (16,16),
(17,17), (18,18), (19,19), (55,20), (60,5), (56,6), (47,7), (24,8), (25,9), (26,10), (27,11), (28,12), (29,13), (30,14),
(31,1), (32,2), (33,3), (44,4), (35,5), (36,6), (37,7), (38,8), (39,9), (40,10);

select * from roles_employee; 


--1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select employee_name, monthly_salary from employees e 
join employee_salary es on e.id = es.employee_id 
join salary1 s on s.id = es.salary_id; 

--2. Вывести всех работников у которых ЗП меньше 2000.

select employee_name from employees e 
join employee_salary es on e.id = es.employee_id 
join salary1 s on s.id = es.salary_id
where monthly_salary < 2000; 

--3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select monthly_salary from salary1 s  
join employee_salary es on s.id = es.salary_id 
left join employees e on e.id = es.employee_id
where employee_name is null; 

 --4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select monthly_salary from salary1 s  
join employee_salary es on s.id = es.salary_id 
left join employees e on e.id = es.employee_id
where employee_name is null and monthly_salary < 2000; 

 --5. Найти всех работников кому не начислена ЗП.

select employee_name from employees e full join
employee_salary es on e.id = es.employee_id
full join salary1 s on s.id = es.salary_id 
where monthly_salary is null;


 --6. Вывести всех работников с названиями их должности.

select employee_name, role_name from employees e join roles_employee re  on re.employee_id = e.id join 
roles1 r on r.id = re.role_id;


 --7.Вывести имена и должность только Java разработчиков.

select employee_name, role_name from employees e join roles_employee re  on re.employee_id = e.id join 
roles1 r on r.id = re.role_id 
where role_name like '%Java_developer';


 --8. Вывести имена и должность только Python разработчиков.

select employee_name, role_name from employees e join roles_employee re  on re.employee_id = e.id join 
roles1 r on r.id = re.role_id 
where role_name like '%Python%';


--9. Вывести имена и должность всех QA инженеров.
select employee_name, role_name from employees e join roles_employee re  on re.employee_id = e.id join 
roles1 r on r.id = re.role_id 
where role_name like '%QA%';
 

--10. Вывести имена и должность ручных QA инженеров.
select employee_name, role_name from employees e join roles_employee re  on re.employee_id = e.id join 
roles1 r on r.id = re.role_id 
where role_name like '%Manual%';


 --11. Вывести имена и должность автоматизаторов QA

select employee_name, role_name from employees e join roles_employee re  on re.employee_id = e.id join 
roles1 r on r.id = re.role_id 
where role_name like '%Automation%';

 --12. Вывести имена и зарплаты Junior специалистов

select employee_name, monthly_salary from employees e join
employee_salary es on e.id = es.id join 
salary1 s on s.id = es.salary_id join 
roles_employee re on re.employee_id = e.id
join roles1 r on r.id = re.role_id 
where role_name like '%Junior%';

 --13. Вывести имена и зарплаты Middle специалистов

select employee_name, monthly_salary from employees e join
employee_salary es on e.id = es.id join 
salary1 s on s.id = es.salary_id join 
roles_employee re on re.employee_id = e.id
join roles1 r on r.id = re.role_id 
where role_name like '%Middle%';

 --14. Вывести имена и зарплаты Senior специалистов

select employee_name, monthly_salary from employees e join
employee_salary es on e.id = es.id join 
salary1 s on s.id = es.salary_id join 
roles_employee re on re.employee_id = e.id
join roles1 r on r.id = re.role_id 
where role_name like '%Senior%';


 --15. Вывести зарплаты Java разработчиков

select monthly_salary from salary1 s join employee_salary es on s.id = es.salary_id 
join employees e on es.id = e.id
join roles_employee re on e.id = re.employee_id 
join roles1 r on re.role_id = r.id
where role_name like '%Java_developer';


 --16. Вывести зарплаты Python разработчиков

select monthly_salary from salary1 s join employee_salary es on s.id = es.salary_id 
join employees e on es.id = e.id
join roles_employee re on e.id = re.employee_id 
join roles1 r on re.role_id = r.id
where role_name like '%Python%';

 -- 17. Вывести имена и зарплаты Junior Python разработчиков

select employee_name, monthly_salary from employees e join
employee_salary es on e.id = es.id join 
salary1 s on s.id = es.salary_id join 
roles_employee re on re.employee_id = e.id
join roles1 r on r.id = re.role_id 
where role_name like 'Junior_Python%';


 --18. Вывести имена и зарплаты Middle JS разработчиков

select employee_name, monthly_salary from employees e join
employee_salary es on e.id = es.id join 
salary1 s on s.id = es.salary_id join 
roles_employee re on re.employee_id = e.id
join roles1 r on r.id = re.role_id 
where role_name like 'Middle_JavaScript%';

 --19. Вывести имена и зарплаты Senior Java разработчиков

select * from employees e join
employee_salary es on e.id = es.id join 
salary1 s on s.id = es.salary_id join 
roles_employee re on re.employee_id = e.id
join roles1 r on r.id = re.role_id 
where role_name like 'Senior_Java_developer';  ---доделать условие

 --20. Вывести зарплаты Junior QA инженеров

select monthly_salary from salary1 s join employee_salary es on s.id = es.salary_id 
join employees e on es.id = e.id
join roles_employee re on e.id = re.employee_id 
join roles1 r on re.role_id = r.id
where role_name like '%Junior%QA%';


 --21. Вывести среднюю зарплату всех Junior специалистов

select ROUND(AVG(monthly_salary),2) from employees e join
employee_salary es on e.id = es.id join 
salary1 s on s.id = es.salary_id join 
roles_employee re on re.employee_id = e.id
join roles1 r on r.id = re.role_id 
where role_name like '%Junior%';


 --22. Вывести сумму зарплат JS разработчиков

select SUM(monthly_salary) from salary1 s join employee_salary es on s.id = es.salary_id 
join employees e on es.id = e.id
join roles_employee re on e.id = re.employee_id 
join roles1 r on re.role_id = r.id
where role_name like '%JavaScript%';

 --23. Вывести минимальную ЗП QA инженеров

select MIN(monthly_salary) from salary1 s join employee_salary es on s.id = es.salary_id 
join employees e on es.id = e.id
join roles_employee re on e.id = re.employee_id 
join roles1 r on re.role_id = r.id
where role_name like '%QA%';

 --24. Вывести максимальную ЗП QA инженеров

select MAX(monthly_salary) from salary1 s join employee_salary es on s.id = es.salary_id 
join employees e on es.id = e.id
join roles_employee re on e.id = re.employee_id 
join roles1 r on re.role_id = r.id
where role_name like '%QA%';

 --25. Вывести количество QA инженеров

select count(role_name) from employees e join roles_employee re  on re.employee_id = e.id join 
roles1 r on r.id = re.role_id 
where role_name like '%QA%';

 --26. Вывести количество Middle специалистов.

select count(role_name) from employees e join roles_employee re  on re.employee_id = e.id join 
roles1 r on r.id = re.role_id 
where role_name like '%Middle%';

 --27. Вывести количество разработчиков

select count(role_name) from employees e join roles_employee re  on re.employee_id = e.id join 
roles1 r on r.id = re.role_id 
where role_name like '%developer%';

 --28. Вывести фонд (сумму) зарплаты разработчиков.

select SUM(monthly_salary) from salary1 s join employee_salary es on s.id = es.salary_id 
join employees e on es.id = e.id
join roles_employee re on e.id = re.employee_id 
join roles1 r on re.role_id = r.id
where role_name like '%developer%';

 --29. Вывести имена, должности и ЗП всех специалистов по возрастанию

select employee_name, role_name, monthly_salary from employees e join
employee_salary es on e.id = es.id join 
salary1 s on s.id = es.salary_id join 
roles_employee re on re.employee_id = e.id
join roles1 r on r.id = re.role_id 
order by 3;


 --30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300

select employee_name, role_name, monthly_salary from employees e join
employee_salary es on e.id = es.id join 
salary1 s on s.id = es.salary_id join 
roles_employee re on re.employee_id = e.id
join roles1 r on r.id = re.role_id 
where monthly_salary between 1700 and 2300
order by 3;

 --31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300

select employee_name, role_name, monthly_salary from employees e join
employee_salary es on e.id = es.id join 
salary1 s on s.id = es.salary_id join 
roles_employee re on re.employee_id = e.id
join roles1 r on r.id = re.role_id 
where monthly_salary < 2300
order by 3;

-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000

select employee_name, role_name, monthly_salary from employees e join
employee_salary es on e.id = es.id join 
salary1 s on s.id = es.salary_id join 
roles_employee re on re.employee_id = e.id
join roles1 r on r.id = re.role_id 
where monthly_salary in (1100, 1500, 2000)
order by 3;

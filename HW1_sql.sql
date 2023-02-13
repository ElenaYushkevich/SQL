create table employees(
	id serial primary key,
	employee_name varchar(50) not null
);

insert into employees (employee_name)
values  ('Reggie Batey'), 
		('Clara Poore'), 
		('Tammy Galindo'), 
		('Rickey Jones'), 
		('Jill Anspach'), 
		('Lacy Racicot'), 
		('David Macias'), 
		('Jessica Manns'), 
		('Amber Holcomb'), 
		('Betty Wells'), 
		('Miguel Fletcher'), 
		('Joseph Hodges'), 
		('Ida Bohannon'), 
		('Cindy Merrifield'), 
		('Mary Dowell'), 
		('Marie Thomas'), 
		('Donald Fierro'), 
		('Anna Wick'), 
		('Robert Harian'), 
		('Michael Mark'), 
		('Lucius Patterson'), 
		('Lorna Rose'), 
		('Karen Santiago'), 
		('Peggy Beachler'), 
		('Chester Baird'), 
		('Ronda Colley'), 
		('Robert Chapman'), 
		('Sandra Hibbard'), 
		('Steven Pagano'), 
		('Ramona Russell'), 
		('Ryan Morgan'), 
		('Shannon Daugherty'), 
		('Charlene Little'), 
		('Steve Lewandowski'), 
		('Donnie Shoemaker'), 
		('Veronica Treto'), 
		('Jonathon Belanger'), 
		('William Hughes'), 
		('Courtney Alston'), 
		('Isaac Walters'), 
		('Leon Ashcraft'), 
		('Daniel Patterson'), 
		('Randall Phillips'), 
		('James Williams'), 
		('Nancy Searles'), 
		('Edward Hilliard'), 
		('Joel Vandevelde'), 
		('Nancy Bravo'), 
		('Jesse Clark'), 
		('Gregory Magelssen'), 
		('Ella Cortez'), 
		('Michael Diaz'), 
		('Robert Walsh'), 
		('Valorie Seibert'), 
		('Yoshiko Miller'), 
		('Timothy Johnson'), 
		('Lita Webb'), 
		('Lindsay Barrera'), 
		('Jacqulyn Matthews'), 
		('Lee Rehart'), 
		('Fred Spencer'), 
		('Melinda Webster'), 
		('Shawn Pretti'), 
		('Betty Schaefer'), 
		('Barbara Teets'), 
		('Patricia Tomas'), 
		('Mattie Kelley'), 
		('Mary Yates'), 
		('Andrea Croes'), 
		('Amanda Riley');

create table salary(
	id serial primary key,
	monthly_salary int not null
);

insert into salary (monthly_salary)
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

create table employee_salary(
	id serial primary key,
	employee_id int not null unique,
	salary_id int not null	
);	

insert into employee_salary(employee_id, salary_id)
values (3, 7),
	   (1, 4),
	   (5, 9),
	   (40, 13),
	   (23, 4),
	   (11, 1),
	   (52, 10),
	   (15, 13),
	   (26, 4),
	   (16, 1),
	   (33, 7),
	   (37, 4),
	   (12, 1),
	   (19, 10),
	   (43, 13),
	   (70, 15),
	   (6, 16),
	   (17, 13),
	   (2, 5),
	   (64, 8),
	   (67, 3),
	   (54, 11),
	   (8, 11),
	   (30, 12),
	   (13, 14),
	   (7, 16),
	   (31, 8),
	   (42, 13),
	   (25, 12),
	   (9, 5),
	   (71, 10),
	   (72, 1),
	   (73, 7),
	   (74, 16),
	   (75, 3),
	   (76, 12),
	   (77, 11),
	   (78, 14),
	   (79, 11),
	   (80, 15);

create table roles(
	id serial primary key,
	role_name int not null unique
);	

alter table roles 
alter column role_name TYPE varchar(30);

insert into roles (role_name)
values ('Junior Pyton developer'),
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
	  
create table roles_employee(
	id serial primary key,
	employee_id int not null unique,
	role_id int not null,
	foreign key (employee_id)
		references employees(id),
	foreign key (role_id)
		references roles(id)
);	

insert into roles_employee (employee_id, role_id)
values (7, 2),
       (20, 4),
       (3, 9),
       (5, 13),
       (23, 4),
       (11, 2),
       (10, 9),
       (22, 13),
       (21, 3),
       (34, 4),
       (6, 7),
       (70, 19),
       (30, 10),
       (44, 20),
       (18, 14),
       (60, 1),
       (53, 16),
       (66, 8),
       (51, 17),
       (49, 11),
       (37, 15),
       (13, 6),
       (56, 5),
       (40, 12),
       (25, 18),
       (8, 17),
       (33, 8),
       (47, 11),
       (62, 16),
       (15, 15),
       (1, 1),
       (28, 6),
       (41, 14),
       (59, 5),
       (69, 20),
       (64, 12),
       (16, 10),
       (19, 18),
       (50, 7),
       (45, 19);

/*1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.*/
select employee_name, monthly_salary from employee_salary 
join salary on employee_salary.salary_id=salary.id
join employees on employee_salary.employee_id = employees.id
order by monthly_salary;

/*2. Вывести всех работников у которых ЗП меньше 2000.*/
select employee_name, monthly_salary from employee_salary 
join employees on employee_salary.employee_id = employees.id
join salary on employee_salary.salary_id=salary.id
where monthly_salary<2000
order by monthly_salary;

/*3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)*/
select monthly_salary, employee_name from employee_salary 
join employees on employee_salary.employee_id = employees.id
right join salary on employee_salary.salary_id=salary.id
where employee_name is null
order  by monthly_salary;

select monthly_salary, salary.id from salary 
full join employee_salary on salary.id = employee_salary.salary_id 
where employee_id is null;

select * from salary 
where id not in (select sal.id from employees as emp
     		join employee_salary as mid on emp.id = mid.employee_id
    		join salary as sal on mid.salary_id = sal.id)

/*4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)*/
select monthly_salary, employee_name from employee_salary 
join employees on employee_salary.employee_id = employees.id
right join salary on employee_salary.salary_id=salary.id
where employee_name is null and monthly_salary<2000
order  by monthly_salary;

select monthly_salary, es.salary_id from salary e 
full join employee_salary es on e.id = es.salary_id 
where employee_id is null  and monthly_salary<2000;

/*5. Найти всех работников кому не начислена ЗП.*/
select  employee_name, monthly_salary from employee_salary 
right join employees on employee_salary.employee_id = employees.id
left join salary on employee_salary.salary_id=salary.id
where monthly_salary is null
order by employee_name;

select e.employee_name, es.salary_id from employees e 
full join employee_salary es on e.id = es.employee_id 
where salary_id is null
order by employee_name;

/*6. Вывести всех работников с названиями их должности.*/
select employee_name, role_name from roles_employee 
inner join employees on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id=roles.id;

/*7. Вывести имена и должность только Java разработчиков.*/
select employee_name, role_name	from roles_employee 
inner join employees on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id=roles.id
where role_name like '%Java %';

/*8. Вывести имена и должность только Python разработчиков.*/
select employee_name, role_name	from roles_employee 
inner join employees on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id=roles.id
where role_name like '%Python%'

/*9. Вывести имена и должность всех QA инженеров.*/
select employee_name, role_name	from roles_employee 
inner join employees on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id=roles.id
where role_name like '%QA%'

/*10. Вывести имена и должность ручных QA инженеров.*/
select employee_name, role_name	from roles_employee 
inner join employees on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id=roles.id
where role_name like '%Manual QA%'

/*11. Вывести имена и должность автоматизаторов QA*/
select employee_name, role_name from roles_employee 
inner join employees on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id=roles.id
where role_name like '%Automation QA%'

/*12. Вывести имена и зарплаты Junior специалистов*/
select employee_name, monthly_salary, role_name from employee_salary 
join salary on employee_salary.salary_id=salary.id
join employees on employee_salary.employee_id = employees.id
join roles_employee on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id=roles.id
where role_name like '%Junior%'
order by monthly_salary;

/*13. Вывести имена и зарплаты Middle специалистов*/
select employee_name, monthly_salary, role_name from employee_salary 
join salary on employee_salary.salary_id=salary.id
join employees on employee_salary.employee_id = employees.id
join roles_employee on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id=roles.id
where role_name like '%Middle%'
order by monthly_salary;

/*14. Вывести имена и зарплаты Senior специалистов*/
select employee_name, monthly_salary, role_name from employee_salary 
join salary on employee_salary.salary_id=salary.id
join employees on employee_salary.employee_id = employees.id
join roles_employee on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id=roles.id
where role_name like '%Senior%'
order by monthly_salary;

/*15. Вывести зарплаты Java разработчиков*/
select monthly_salary, role_name from employee_salary 
join salary on employee_salary.salary_id=salary.id
join employees on employee_salary.employee_id = employees.id
join roles_employee on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id=roles.id
where role_name like '%Java %'
order by monthly_salary;

/*16. Вывести зарплаты Python разработчиков*/
select monthly_salary, role_name from employee_salary 
join salary on employee_salary.salary_id=salary.id
join employees on employee_salary.employee_id = employees.id
join roles_employee on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id=roles.id
where role_name like '%Python%'
order by monthly_salary;

/*17. Вывести имена и зарплаты Junior Python разработчиков*/
select employee_name, monthly_salary, role_name from employee_salary 
join salary on employee_salary.salary_id=salary.id
join employees on employee_salary.employee_id = employees.id
join roles_employee on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id=roles.id
where role_name like '%Junior Python%'
order by monthly_salary;

/*18. Вывести имена и зарплаты Middle JS разработчиков*/
select employee_name, monthly_salary, role_name from employee_salary 
join salary on employee_salary.salary_id=salary.id
join employees on employee_salary.employee_id = employees.id
join roles_employee on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id=roles.id
where role_name like '%Middle JavaScript%'
order by monthly_salary;

/*19. Вывести имена и зарплаты Senior Java разработчиков*/
select employee_name, monthly_salary, role_name from employee_salary 
join salary on employee_salary.salary_id=salary.id
join employees on employee_salary.employee_id = employees.id
join roles_employee on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id=roles.id
where role_name like '%Senior Java %'
order by monthly_salary;

/*20. Вывести зарплаты Junior QA инженеров*/
select employee_name, monthly_salary, role_name from employee_salary 
join salary on employee_salary.salary_id=salary.id
join employees on employee_salary.employee_id = employees.id
join roles_employee on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id=roles.id
where role_name like '%Junior%QA%'
order by monthly_salary;

/*21. Вывести среднюю зарплату всех Junior специалистов*/
select  AVG(monthly_salary)  from employee_salary 
join salary on employee_salary.salary_id=salary.id
join employees on employee_salary.employee_id = employees.id
join roles_employee on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id=roles.id
where role_name like '%Junior%';

/*22. Вывести сумму зарплат JS разработчиков*/
select  SUM(monthly_salary)  from employee_salary 
join salary on employee_salary.salary_id=salary.id
join employees on employee_salary.employee_id = employees.id
join roles_employee on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id=roles.id
where role_name like '%JavaS%';

/*23. Вывести минимальную ЗП QA инженеров*/
select  min(monthly_salary)  from employee_salary 
join salary on employee_salary.salary_id=salary.id
join employees on employee_salary.employee_id = employees.id
join roles_employee on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id=roles.id
where role_name like '% QA %';

/*24. Вывести максимальную ЗП QA инженеров*/
select  max(monthly_salary)  from employee_salary 
join salary on employee_salary.salary_id=salary.id
join employees on employee_salary.employee_id = employees.id
join roles_employee on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id=roles.id
where role_name like '% QA %';

/*25. Вывести количество QA инженеров*/
select  count(role_name)  from employee_salary 
join salary on employee_salary.salary_id=salary.id
join employees on employee_salary.employee_id = employees.id
join roles_employee on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id=roles.id
where role_name like '% QA %';

/*26. Вывести количество Middle специалистов.*/
select  count(role_name)  from employee_salary 
join salary on employee_salary.salary_id=salary.id
join employees on employee_salary.employee_id = employees.id
join roles_employee on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id=roles.id
where role_name like '%Middle%';

/*27. Вывести количество разработчиков*/
select  count(role_name)  from employee_salary 
join salary on employee_salary.salary_id=salary.id
join employees on employee_salary.employee_id = employees.id
join roles_employee on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id=roles.id
where role_name like '%dev%';

/*28. Вывести фонд (сумму) зарплаты разработчиков.*/
select  sum(monthly_salary)  from employee_salary 
join salary on employee_salary.salary_id=salary.id
join employees on employee_salary.employee_id = employees.id
join roles_employee on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id=roles.id
where role_name like '%dev%';

/*29. Вывести имена, должности и ЗП всех специалистов по возрастанию*/
select employee_name, monthly_salary, role_name from employee_salary 
join salary on employee_salary.salary_id=salary.id
join employees on employee_salary.employee_id = employees.id
join roles_employee on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id=roles.id
order by monthly_salary;

select employee_name, monthly_salary, role_name from employee_salary 
right join salary on employee_salary.salary_id=salary.id
right join employees on employee_salary.employee_id = employees.id
right join roles_employee on roles_employee.employee_id = employees.id
right join roles on roles_employee.role_id=roles.id
order by monthly_salary;

/*30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300*/
select employee_name, monthly_salary, role_name from employee_salary 
right join salary on employee_salary.salary_id=salary.id
right join employees on employee_salary.employee_id = employees.id
right join roles_employee on roles_employee.employee_id = employees.id
right join roles on roles_employee.role_id=roles.id
where 1700<monthly_salary and monthly_salary<2300
order by monthly_salary;

/*31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300*/
select employee_name, monthly_salary, role_name from employee_salary 
right join salary on employee_salary.salary_id=salary.id
right join employees on employee_salary.employee_id = employees.id
right join roles_employee on roles_employee.employee_id = employees.id
right join roles on roles_employee.role_id=roles.id
where monthly_salary<2300
order by monthly_salary;

/*32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000*/
select employee_name, monthly_salary, role_name from employee_salary 
right join salary on employee_salary.salary_id=salary.id
right join employees on employee_salary.employee_id = employees.id
right join roles_employee on roles_employee.employee_id = employees.id
right join roles on roles_employee.role_id=roles.id
where monthly_salary in (1000, 1300, 1500, 2000, 2500)
order by monthly_salary;

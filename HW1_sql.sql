create table employees(
	id serial primary key,
	employee_name varchar(50) not null
);

insert into employees (employee_name)
values ('Reggie Batey'), 
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

select * from salary;

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
	   (11, 2),
	   (52, 10),
	   (15, 13),
	   (26, 4),
	   (16, 1),
	   (33, 7),
	   (37, 4),
	   (12, 2),
	   (19, 10),
	   (43, 13),
	   (70, 15),
	   (6, 16),
	   (17, 2),
	   (2, 5),
	   (64, 8),
	   (67, 3),
	   (54, 6),
	   (8, 11),
	   (30, 12),
	   (13, 14),
	   (7, 16),
	   (31, 8),
	   (42, 13),
	   (25, 2),
	   (9, 5),
	   (71, 10),
	   (72, 1),
	   (73, 7),
	   (74, 16),
	   (75, 3),
	   (76, 12),
	   (77, 11),
	   (78, 14),
	   (79, 6),
	   (80, 15);
	  
select * from employee_salary;

create table roles(
	id serial primary key,
	role_name int not null unique
);	

alter table roles 
alter column role_name TYPE varchar(30);

select * from roles;

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
	  
select * from roles;	  

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
		
		

select * from roles_employee;	




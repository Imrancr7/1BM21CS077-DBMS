create database employee077;
use employee077;

create table dept(
dept_no int,
dname varchar(20),
dloc varchar(15),
primary key (dept_no)
);
create table project(
p_no int,
p_loc varchar(20),
pname varchar(20),
primary key (p_no)
);
create table employee(
empno int,
ename varchar(20),
mgr_no int,
hiredate date,
sal int,
dept_no int,
primary key (empno),
foreign key (dept_no) references dept (dept_no)
);
create table assigned_to(
empno int,
p_no int,
job_role varchar(20),
primary key(empno,p_no),
foreign key(empno) references employee(empno),
foreign key(p_no) references project(p_no)
);
create table incentives(
empno int,
incentive_date date,
incentive_amount int,
primary key (empno,incentive_date),
foreign key(empno) references employee(empno)
);
insert into dept
values(1,'Web_development','Bengaluru'),
(2,'Graphics','Mysuru'),
(3,'Android','Hyderabad'),
(4,'UX_Design','Bengaluru'),
(5,'Management','Mysuru'),
(6,'Finance','Mumbai');
insert into project
values(01,'Hyderabad','Project_swiggyclone'),
(02,'Mysuru','Project_Alpha'),
(03,'Hyderabad','Project_Beta'),
(04,'Bengaluru','Project_Bankingsite'),
(05,'Bombay','Project_Tiger'),
(06,'Mysuru','Project_Intellisense');

insert into employee
values(001,'Ayanokoji',1210,'2021-10-09',96000,1),
(002,'Naruto',2317,'2021-03-07',56000,1),
(003,'Kakashi',2510,'2021-10-08',76000,1),
(004,'Sasuke',9310,'2021-02-09',32000,2),
(005,'Sakura',3310,'2021-03-04',56000,2),
(006,'Rocklee',5561,'2022-01-05',57900,3),
(007,'Gojo',7810,'2021-11-19',520000,4),
(008,'Neji',4231,'2021-02-13',527100,5),
(009,'Itachi',1324,'2021-07-14',97600,5),
(010,'Hinata',6780,'2021-12-31',123000,5);
insert into incentives
values(001,'2022-10-01',7000),
(006,'2022-11-02',5000),
(002,'2022-05-03',8000),
(005,'2022-07-05',5500),
(010,'2022-08-07',8500);

insert into assigned_to
values(001,01,'Developer'),
(003,04,'Tester'),
(002,05,'Manager'),
(005,03,'Supervisor'),
(007,02,'Team Leader'),
(006,06,'Executive Manager');


select a.empno
from assigned_to a, project p
where a.p_no = p.p_no and p.p_loc in ('Hyderabad','Mysuru','Bengaluru');

select e.empno
from employee e
where e.empno not in (select empno
from incentives);
select e.ename, e.empno, d.dname, a.job_role, d.dloc, p.p_loc
from dept d, employee e, assigned_to a, project p
where e.empno = a.empno and a.p_no = p.p_no and e.dept_no = d.dept_no and d.dloc = p.p_loc;

select *
from assigned_to a, project p
where a.p_no = p.p_no;
select *
from incentives;
select e.ename, e.empno, d.dname, a.job_role, d.dloc, p.p_loc
from dept d, employee e, assigned_to a, project p
where e.empno = a.empno and a.p_no = p.p_no and e.dept_no = d.dept_no;
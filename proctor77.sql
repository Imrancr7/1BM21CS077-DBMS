create database proctor77;
use proctor77;

create table faculty(
fid int,
fname varchar(20),
mob_no int,
d_no int,
primary key(fid),
foreign key(d_no) references department(dno));

create table department(
dno int,
dname varchar(20),
primary key(dno));

create table students(
semno int,
usn varchar(10),
sname varchar(20),
smob int,
email varchar(30),
d_no int,
parentno int,
pname varchar(10),
address varchar(30),
primary key(usn),
foreign key(d_no)references department(dno));

create table assignedproctor(
hodid int,
proctorid int,
proctee_usn varchar(10),
primary key(hodid,proctee_usn),
foreign key(proctee_usn)references student(usn),
foreign key(hodid)references faculty(fid),
foreign key(proctorid)references faculty(fid));

create table meetparents(
slno int,
dateof int,
usn varchar(10),
proctid int,
purpose varchar(30),
outcome varchar(30),
primary key(slno,dateof,usn),
foreign key(usn)references students(usn),
foreign key(proctid)references faculty(fid));

create table meetstudents(
slno int,
dateof int,
usn varchar(10),
proctid int,
purpose varchar(30),
outcome varchar(30),
primary key(slno,dateof,usn),
foreign key(usn)references students(usn),
foreign key(proctid)references faculty(fid));

create table activityrecords(
slno int,
dateof int,
usn varchar(10),
name_ofcomp varchar(20),
proctid int,
duration varchar(15),
primary key(slno,dateof,usn),
foreign key(usn)references students(usn),
foreign key(proctid)references faculty(fid));

create table leaverecords(
slno int,
dateof int,
usn varchar(10),
reason_for_leave varchar(20),
proctid int,
duration varchar(15),
primary key(slno,dateof,usn),
foreign key(usn)references students(usn),
foreign key(proctid)references faculty(fid));

create table semcoursess(
proctid int,
semno int,
usn varchar(10),
coursecode varchar(7),
coursename varchar(15),
credits int,
ciemarks int,
seemarks int,
grade varchar(3),
primary key(semno,usn,coursecode),
foreign key(usn)references students(usn),
foreign key(proctid)references faculty(fid));

create table semresults(
usn varchar(10),
semno int,
cgpa double,
sgpa double,
foreign key(usn)references student(usn));

insert into department values
(001,"Computer_science"),
(002,"Civil_engineering"),
(003,"Electronics"),
(004,"Aeronautics"),
(005,"Astrophysics"),
(006,"Bio_technology");

insert into faculty values
(001,"Ram kumar",123456789,001),
(002,"Rahul singh",321456789,002),
(003,"Soumya Kumbar",765456789,001),
(004,"Nischita Kotary",234556789,001),
(005,"Jagadeesh latti",145556789,002),
(006,"Hanuma Kaushik",1245556789,003),
(007,"kalyan",1267656789,004),
(008,"katraj",1235676789,005);

insert into students values
(001,"1BM21077","Naruto Uzumaki",1234567890,"naruto@gmail.com",001,77654321,"Minato","Banglore"),
(001,"1BM21078","Kushina Uzumaki",1234567890,"kushina@gmail.com",001,778654321,"Hashirama","Banglore"),
(001,"1BM21079","Hinata hyuga",1234567890,"hinata@gmail.com",001,1087654321,"tobirama","Banglore"),
(003,"1BM21080","Neji hyuga",1234567890,"neji@gmail.com",002,2087654321,"salman","Belgavi"),
(003,"1BM21081","Rocklee",1234567890,"rock@gmail.com",002,1087654321,"yash","Belagavi"),
(003,"1BM21082","Sasuke uchiha",1234567890,"Sasuke@gmail.com",002,108765432,"darshan","mysore"),
(005,"1BM21083","Itachi Uchiha",1234567890,"itachi@gmail.com",001,120654321,"Sudeep","mysore"),
(005,"1BM21084","Obito uchiha",1234567890,"obito@gmail.com",001,1037654321,"Katrina","mysore"),
(005,"1BM21085","Tenten",1234567890,"tenten@gmail.com",001,1087654321,"Kareena","mysore"),
(006,"1BM21086","Gojo satoru",1234567890,"gojo@gmail.com",004,1087654321,"kajol","mysore"),
(006,"1BM21087","Sakura ",1234567890,"sakura@gmail.com",004,1654321,"Akshay","belgavi"),
(007,"1BM21088","Gaara",1234567890,"gaaara@gmail.com",006,12354321,"Rehan","Belgavi"),
(008,"1BM21089","Jiraya",1234567890,"jiraya@gmail.com",006,127654321,"Rahul","Bidar");

insert into meetparents values
(1,21122021,"1BM21077",001,"Course registration","Successfull"),
(1,22012021,"1BM21078",001,"Course registration","Successfull"),
(1,21022021,"1BM21079",001,"Course registration","Successfull"),
(1,21032021,"1BM21080",002,"Course registration","Successfull"),
(1,21052021,"1BM21084",001,"Course registration","Successfull");
insert into meetstudents values
(1,21122021,"1BM21077",001,"Course registration","Successfull"),
(1,22012021,"1BM21078",001,"Course registration","Successfull"),
(1,21022021,"1BM21079",001,"Course registration","Successfull"),
(1,21032021,"1BM21080",002,"Course registration","Successfull"),
(1,21052021,"1BM21084",001,"Course registration","Successfull");
insert into activityrecords values
(001,21022021,"1BM21077","microsoft",001,"3months"),
(001,21032021,"1BM21078","Google",001,"3months"),
(001,21022021,"1BM21079","Infosys",001,"3months");
insert into leaverecords values
(001,21022021,"1BM21077","fever",001,"3weeks"),
(001,21032021,"1BM21078","cold",001,"2weeks"),
(001,21022021,"1BM21079","cough",001,"5days");
insert into semcoursess values
(001,001,"1BM21077","1OS3MAT","Mathematics",3,45,34,"A"),
(001,005,"1BM21083","1OS3MAT","Mathematics",3,45,34,"A"),
(001,005,"1BM21084","1OS3MAT","Mathematics",3,45,34,"A"),
(001,003,"1BM21080","1OS3MAT","Mathematics",3,17,15,"F"),
(002,003,"1BM21081","1OS3MAT","Mathematics",3,45,34,"A");
insert into semcoursess values
(001,003,"1BM21080","1OS3ECM","Mechanics",3,45,34,"A"),
(001,003,"1BM21080","1OS3CHE","Chemistry",3,17,15,"F"),
(001,003,"1BM21080","1OS3ENG","English",3,17,15,"F");

select usn,sname
from students 
where usn not in(select usn
                   from semcoursess
                   where semno=5)
       and semno=5;     
       
select count(*)
from meetparents
where dateof between 21012021 and 21052021;

create  view fstudents as
select usn,sname
 from students
 where usn in(select usn 
				from semcoursess 
                where grade="F"
                group by usn
                having count(*)<=5);
select *
from fstudents;                
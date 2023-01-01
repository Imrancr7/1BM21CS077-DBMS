create database airlines_077;
use airlines_077;

create table flights(
flno int primary key,
_from varchar(40),
to_ varchar(40),
distance int,
departs time,
arrives time,
price int);

create table aircraft(
aid int primary key,
aname varchar(40),
cruising_range int
);
create table employees(
eid int primary key,
ename varchar(40),
salary int
);
create table certified(
eid int,
aid int,
primary key(eid,aid),
foreign key(eid) references employees(eid) on delete cascade on update cascade,
foreign key(aid) references aircraft(aid) on delete cascade on update cascade
);

insert into flights
values(1,'Bengaluru','New Delhi',500,'6:00','9:00',5000),
(2,'Bengaluru','Chennai',300,'7:00','8:30',3000),
(3,'Trivandrum','New Delhi',800,'8:00','11:30',6000),
(4,'Bengaluru','Frankfurt',10000,'6:00','23:30',50000),
(5,'Kolkata','New Delhi',2400,'11:00','3:30',9000),
(6,'Bengaluru','Frankfurt',8000,'9:00','23:00',40000);



insert into aircraft
values(1,'Airbus',2000),
(2,'Boeing',700),
(3,'JetAirways',550),
(4,'Indigo',5000),
(5,'Boeing',4500),
(6,'Airbus',2200);



insert into employees
values(101,'Avinash',50000),
(102,'Lokesh',60000),
(103,'Rakesh',70000),
(104,'Santhosh',82000),
(105,'Tilak',5000);


insert into certified
values(101,2),
(101,4),
(101,5),
(101,6),
(102,1),
(102,3),
(102,5),
(103,2),
(103,3),
(103,5),
(103,6),
(104,6),
(104,1),
(104,3),
(105,3);

/*sql query 1 */
Select aname
from aircraft
where aid in(select aid
              from certified
			where eid in (select eid
							from employees
                              where salary >=80000));
/*sql query 2 */ 
SELECT C.eid, MAX(A.cruising_range)
FROM Certified C, Aircraft A
WHERE A.aid = C.aid
GROUP BY C.eid
HAVING COUNT(C.aid) >=3 ;                        

/* sql query 3 */
SELECT ename
 FROM employees
WHERE salary < ( SELECT MIN(price)
                   FROM Flights
                    WHERE _from = "Bengaluru"
                     AND to_ = "Frankfurt" ) ;     
/* sql query 4 */
SELECT a.aid, a.aname, AVG (e.salary)
FROM aircraft a, certified c, employees e
WHERE a.aid = c.aid AND
c.eid = e.eid AND
a.cruising_range > 1000
GROUP BY a.aid, a.aname ; 
/* sql query 5 */
SELECT DISTINCT e.ename
FROM employees e, certified c, aircraft a
WHERE e.eid = c.eid AND
a.aid = c.aid AND
a.aname = "Boeing" ; 
/* sql query 6 */
SELECT DISTINCT a.aid FROM aircraft a
WHERE a.cruising_range > ( SELECT MIN(f.distance)
FROM flights f
WHERE _from = "Bengaluru" AND
to_ = "New Delhi" );                   


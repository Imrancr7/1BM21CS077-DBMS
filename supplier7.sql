create database supplier77;
use supplier77;

create table suppliers(
sid int primary key,
 sname varchar(20), 
 city varchar(20));
 
 create table parts(
 pid int primary key,
 pname varchar(20), 
 color varchar(10));
 
 create table catalog(
 sid int,
 pid int, 
 foreign key(sid) references suppliers(sid), 
 foreign key(pid) references parts(pid),
 cost float(6), primary key(sid, pid));
 
 
 insert into suppliers values(10001, 'Acme_Widget','Bangalore');
insert into suppliers values(10002,  'Johns','Kolkata');
insert into suppliers values(10003, 'Vimal','Mumbai');
insert into suppliers values(10004,  'Reliance','Delhi');
insert into suppliers values(10005,  'Mahindra','Mumbai');

insert into parts values(20001,'Book','Red');
insert into parts values(20002, 'Pen','Red');
insert into parts values(20003, 'Pencil','Green');
insert into parts values(20004, 'Mobile','Green');
insert into parts values(20005, 'Charger','Black');


insert into catalog values(10001, 20001,10);
insert into catalog values(10001, 20002,10);
insert into catalog values(10001, 20003,30);
insert into catalog values(10001, 20004,10);
insert into catalog values(10001, 20005,10);

insert into catalog values(10002, 20001,10);
insert into catalog values(10002, 20002,20);
insert into catalog values(10003, 20003,30);
insert into catalog values(10004, 20003,40);

select pname
from parts
where pid in(select pid
               from catalog);
               
select sname 
from suppliers
where sid in(select sid
            from catalog
            group by sid
            having count(sid)=(select count(*)
                                from parts));
 select sname
 from suppliers
 where sid in(select sid
               from catalog
               where pid in(select pid
							from parts
                            where color='Red'));
 
 select pname
 from parts
 where pid not in(select pid
                   from catalog
                   where sid != (select sid
								 from suppliers
                                 where sname='Acme_Widget'));
                                 
                                 
select s.sid
from parts p ,suppliers s
where s.sid in(select sid 
              from catalog c
              where cost>(select avg(cost)
							from catalog
                            where pid=p.pid)
                            and c.pid =p.pid);

select p.pid ,s.sname
from parts p ,suppliers s
where s.sid in(select sid 
              from catalog c
              where cost=(select max(cost)
							from catalog
                            where pid=p.pid)
                            and c.pid =p.pid);                            
                                 
                
                            
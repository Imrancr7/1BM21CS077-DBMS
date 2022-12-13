use employee077;
select*
from employee;
update employee
set mgr_no=10
where ename="Neji";
/*List the name of the managers with the maximum employees*/
SELECT m.ename, count(*)
FROM employee e,employee m
WHERE e.mgr_no = m.empno
GROUP BY m.ename
HAVING count(*) =(SELECT MAX(mycount)
				   from(SELECT COUNT(*) mycount
				   FROM employee
                    GROUP BY mgr_no) a);
/*Display those managers name whose salary is more than average salary of his
employee.*/                    
select m.ename,sal
from employee m
WHERE sal >=(SELECT avg(e.sal)
			 FROM employee e
              where m.empno = e.mgr_no
               group by e.mgr_no); 
/*Find the employee details who got second maximum incentive in January 2019.*/               
select *
from employee e,incentives i
where e.empno=i.empno and 1 =( select count(*)
                                 from incentives j
                                  where i.incentive_amount < j.incentive_amount) and year(incentive_date)=2021;      
select *
from incentives; 
/*Display those employees who are working in the same department where his
manager is working.*/
select *
from employee e                                 
where e.dept_no=(select m.dept_no
                  from employee m
                  where e.mgr_no=m.empno);
--task1  (lesson8)
-- oracle: https://leetcode.com/problems/department-top-three-salaries/
/* Write your PL/SQL query statement below */

select d.name as Department, e.name as Employee , e.salary as Salary
from Employee e
join Department d
on e.DepartmentId = d.id
WHERE e.name not in 'Janet'
ORDER by Salary DESC

--task2  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/17
SELECT F.member_name, F.status, sum(P.unit_price * P.amount) as costs
from FamilyMembers F 
join Payments P 
on F.member_id = P.family_member
where date LIKE "2005%"
Group by F.member_id
--task3  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/13
SELECT name
FROM Passenger
GROUP BY name
HAVING COUNT(name) > 1
--task4  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/38
select count(first_name) as count
from Student
WHERE first_name = "Anna"
--task5  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/35
SELECT count(Class) as count
from Schedule
where date like "2019-09-02%"
--task6  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/38
select count(first_name) as count
from Student
WHERE first_name = "Anna"
--task7  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/32
SELECT FLOOR(avg
  (
    (YEAR(CURRENT_DATE) - YEAR(birthday)) -                            
    (DATE_FORMAT(CURRENT_DATE, '%m%d') < DATE_FORMAT(birthday, '%m%d'))
  )
  ) AS age
FROM FamilyMembers
--task8  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/27
SELECT G2.good_type_name, sum(P.unit_price * P.amount) as costs
FROM Payments P
join Goods G 
on p.good = g.good_id
join GoodTypes G2
on g.type = G2.good_type_id
where P.date LIKE "2005%"
GROUP BY G2.good_type_name

--task9  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/37
SELECT min((
    (YEAR(CURRENT_DATE) - YEAR(birthday)) -                            
    (DATE_FORMAT(CURRENT_DATE, '%m%d') < DATE_FORMAT(birthday, '%m%d'))
  ) 
  )AS year
from Student
--task10  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/44
select max((
    (YEAR(CURRENT_DATE) - YEAR(birthday)) -                            
    (DATE_FORMAT(CURRENT_DATE, '%m%d') < DATE_FORMAT(birthday, '%m%d'))
  ) 
  )AS max_year
from Student S
left join Student_in_class S2
on S.id = S2.student
left join Class C 
on S2.class = C.id
where name like '10%'


--task11 (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/20
SELECT m.status as status, member_name, (amount * unit_price) as costs
FROM FamilyMembers m
join Payments P
on m.member_id = P.family_member
join Goods G 
on p.good = g.good_id
join GoodTypes G2
on g.type = G2.good_type_id
where good_type_name = 'entertainment'
--task12  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/55
Delete from Company
where name IN 
(
SELECT name
FROM 
(
select name
from Company C
join Trip T 
on C.id = T.company  
GROUP BY company
HAVING COUNT(company) <=
(
select min(company) as min
from (
select COUNT(Company) as company, name
from Company C
join Trip T 
on C.id = T.company  
GROUP BY Company
) as FD
)
) as fgr
) 
--task13  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/45
SELECT classroom
FROM Schedule
GROUP BY classroom
having COUNT(classroom) >=
(
SELECT max(c) as m
FROM 
(
SELECT COUNT(classroom) as c
FROM Schedule
GROUP BY classroom
) AS EW
)
--task14  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/43
select last_name
from Teacher T 
join Schedule S 
on T.id = S.teacher
join Subject S2
on s.subject = S2.id
where name = 'Physical Culture'
ORDER BY last_name
--task15  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/63
select concat(l,".",f,".",m) as name
FROM 
(
select last_name as l, LEFT(first_name,1) as f, LEFT(middle_name,1) as m
from Student
ORDER BY first_name desc
) as gh
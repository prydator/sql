--colab/jupyter: https://colab.research.google.com/drive/1j4XdGIU__NYPVpv74vQa9HUOAkxsgUez?usp=sharing

--task1  (lesson7)
-- sqlite3: Сделать тестовый проект с БД (sqlite3, project name: task1_7). В таблицу table1 записать 1000 строк с случайными значениями (3 колонки, тип int) от 0 до 1000.
-- Далее построить гистаграмму распределения этих трех колонко

--task2  (lesson7)
-- oracle: https://leetcode.com/problems/duplicate-emails/
select *
from
(
select email
from person 
group by email
Having count(email) > 1
)
--task3  (lesson7)
-- oracle: https://leetcode.com/problems/employees-earning-more-than-their-managers/
select E.name as Employee
from Employee E
join Employee E2
on E.ManagerId = E2.id
where E.salary > E2.salary
--task4  (lesson7)
-- oracle: https://leetcode.com/problems/rank-scores/
SELECT Score, DENSE_RANK() OVER (ORDER BY Score Desc) as Rank FROM Scores;

--task5  (lesson7)
-- oracle: https://leetcode.com/problems/combine-two-tables/
SELECT P.FirstName, P.LastName, A.City, A.State 
FROM Person P
LEFT JOIN Address A
ON P.PersonID = A.PersonID

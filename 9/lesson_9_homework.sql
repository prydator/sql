--task1  (lesson9)
-- oracle: https://www.hackerrank.com/challenges/the-report/problem
SELECT
   CASE WHEN G.Grade > 7 THEN S.Name ELSE 'NULL' END AS NameOrNull
    , G.Grade
    , S.Marks
FROM Students S
JOIN Grades G 
ON S.Marks BETWEEN G.Min_Mark AND G.Max_Mark
ORDER BY G.Grade DESC, NameOrNull ASC, S.Marks ASC;



--task2  (lesson9)
-- oracle: https://www.hackerrank.com/challenges/occupations/problem
Select D.Name, P.Name, S.Name, A.Name
from
(Select Name, rank() over (partition by occupation order by name) id from Occupations where Occupation = 'Doctor') D
full join
(Select Name, rank() over (partition by occupation order by name) id from Occupations where Occupation = 'Professor') P on D.id = P.id
full join
(Select Name, rank() over (partition by occupation order by name) id from Occupations where Occupation = 'Singer') S on P.id = S.id
full join
(Select Name, rank() over (partition by occupation order by name) id from Occupations where Occupation = 'Actor') A on S.id = A.id;


--task3  (lesson9)
-- oracle: https://www.hackerrank.com/challenges/weather-observation-station-9/problem
select distinct city
from station
where not (city like 'A%' or city like 'E%' or city like 'I%' or city like 'O%' or city like 'U%');


--task4  (lesson9)
-- oracle: https://www.hackerrank.com/challenges/weather-observation-station-10/problem
select distinct city
from station
where not (city like '%a' or city like '%e' or city like '%i' or city like '%o' or city like '%u');


--task5  (lesson9)
-- oracle: https://www.hackerrank.com/challenges/weather-observation-station-11/problem
select distinct city 
from station 
where city not in 
(select city from station where (city like 'A%' or city like 'E%' or city like 'I%' or city like 'O%' or city like 'U%') AND (city like '%a' or city like '%e' or city like '%i' or city like '%o' or city like '%u'));


--task6  (lesson9)
-- oracle: https://www.hackerrank.com/challenges/weather-observation-station-12/problem
select distinct city 
from station 
where regexp_like(city, '^[^AEIOU].*[^aeiou]$');

--task7  (lesson9)
-- oracle: https://www.hackerrank.com/challenges/salary-of-employees/problem
select name
from Employee
where salary > 2000 and months < 10
order by employee_id;



--task8  (lesson9)
-- oracle: https://www.hackerrank.com/challenges/the-report/problem
SELECT
   CASE WHEN G.Grade > 7 THEN S.Name ELSE 'NULL' END AS NameOrNull
    , G.Grade
    , S.Marks
FROM Students S
JOIN Grades G 
ON S.Marks BETWEEN G.Min_Mark AND G.Max_Mark
ORDER BY G.Grade DESC, NameOrNull ASC, S.Marks ASC;

--схема БД: https://docs.google.com/document/d/1NVORWgdwlKepKq_b8SPRaSpraltxoMg2SIusTEN6mEQ/edit?usp=sharing

--task1
--Корабли: Для каждого класса определите число кораблей этого класса, потопленных в сражениях. Вывести: класс и число потопленных кораблей.
select count(ship) as Q_sunk, class 
from outcomes o 
left join ships s 
on o.ship = s.name
where o.result = 'sunk'
group by class 
--task2
--Корабли: Для каждого класса определите год, когда был спущен на воду первый корабль этого класса. Если год спуска на воду головного корабля неизвестен, определите минимальный год спуска на воду кораблей этого класса. Вывести: класс, год.

select min(launched), class
from ships
group by class
--task3
--Корабли: Для классов, имеющих потери в виде потопленных кораблей и не менее 3 кораблей в базе данных, вывести имя класса и число потопленных кораблей.
select count(ship) as Q_sunk, class 
from outcomes o 
left join ships s 
on o.ship = s.name
where o.result = 'sunk'
group by class 
having count(ship) > 3

--task4
--Корабли: Найдите названия кораблей, имеющих наибольшее число орудий среди всех кораблей такого же водоизмещения (учесть корабли из таблицы Outcomes).
select name
from (select O.ship as name, numGuns, displacement
from Outcomes O 
join Classes C 
on O.ship = C.class AND
O.ship not in (select name
from Ships
)
union
select S.name as name, numGuns, displacement
from Ships S 
join Classes C on S.class = C.class
) as OS  
join (SELECT MAX(numGuns) AS MaxNumGuns, displacement
from Outcomes O
join Classes C 
on O.ship = C.class and 
O.ship not in (select name from  Ships
)
group by displacement
union
select max(numGuns) as MaxNumGuns, displacement
from Ships S 
join Classes C 
ON S.class = C.class
group by displacement
) as GD 
on OS.numGuns = GD.MaxNumGuns and
OS.displacement = GD.displacement

--task5
--Компьютерная фирма: Найдите производителей принтеров, которые производят ПК с наименьшим объемом RAM и с самым быстрым процессором среди всех ПК, имеющих наименьший объем RAM. Вывести: Maker
select distinct maker
from product
where model in 
(
select model
from pc
where ram = 
(
select min(ram) 
from pc
)
and speed = (
select max(speed)
from pc
where ram = 
(
select min(ram)
from pc
)
)
)
and
maker in (
select maker
from product
where type='Printer'
)

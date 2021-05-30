--схема БД: https://docs.google.com/document/d/1NVORWgdwlKepKq_b8SPRaSpraltxoMg2SIusTEN6mEQ/edit?usp=sharing
--colab/jupyter: https://colab.research.google.com/drive/1j4XdGIU__NYPVpv74vQa9HUOAkxsgUez?usp=sharing

--task1 (lesson5)
-- Компьютерная фирма: Сделать view (pages_all_products), в которой будет постраничная разбивка всех продуктов (не более двух продуктов на одной странице). Вывод: все данные из laptop, номер страницы, список всех страниц
create view pages_all_products as 
select *, 
case when num % 2 = 0 then num/2 else num/2 + 1 end as page_num, 
case when total % 2 = 0 then total/2 else total/2 + 1 end as num_of_pages
from (
select *, row_number() over() as num, count(*) over() as total
from Laptop
) as lf

--task2 (lesson5)
-- Компьютерная фирма: Сделать view (distribution_by_type), в рамках которого будет процентное соотношение всех товаров по типу устройства. Вывод: производитель,
create view distribution_by_type as 
select maker, 100.0 * number / sum(number) over () as per
from 
(
select maker, count(maker) as number from product 
group by maker, type
) as kf
group by maker, number

--task3 (lesson5)
-- Компьютерная фирма: Сделать на базе предыдущенр view график - круговую диаграмму

--task4 (lesson5)
-- Корабли: Сделать копию таблицы ships (ships_two_words), но у название корабля должно состоять из двух слов
select * into ships_two_words
from ships s 
where name like '% %'
--task5 (lesson5)
-- Корабли: Вывести список кораблей, у которых class отсутствует (IS NULL) и название начинается с буквы "S"
select ship as name
from ships s 
full join outcomes o 
on s.name = o.ship 
where  o.ship like 'S%' and class is null
--task6 (lesson5)
-- Компьютерная фирма: Вывести все Laptop производителя = 'A' со стоимостью выше средней по принтерам производителя = 'A' и три самых дорогих (через оконные функции). Вывести model


select model
from 
(
select p2.model, DENSE_RANK() OVER(ORDER BY price DESC) as rnk
from laptop l
join product p2
on l.model = p2.model 
where price > 
(
select avg(price)
from printer p3
join product p2
on p3.model = p2.model 
where maker = 'A'
) 
and maker = 'A'
) as ke
where rnk <= 3

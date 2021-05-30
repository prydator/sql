--схема БД: https://docs.google.com/document/d/1NVORWgdwlKepKq_b8SPRaSpraltxoMg2SIusTEN6mEQ/edit?usp=sharing
--colab/jupyter: https://colab.research.google.com/drive/1j4XdGIU__NYPVpv74vQa9HUOAkxsgUez?usp=sharing

--task13 (lesson3)
--Компьютерная фирма: Вывести список всех продуктов и производителя с указанием типа продукта (pc, printer, laptop). Вывести: model, maker, type
select maker, p2.model, type
from product p 
join pc p2 
on p.model = p2.model 
union
select maker, p3.model, p3.type
from product p 
join printer p3
on p.model = p3.model 
union
select maker, l.model, p.type
from product p 
join laptop l
on p.model = l.model 
--task14 (lesson3)
--Компьютерная фирма: При выводе всех значений из таблицы printer дополнительно вывести для тех, у кого цена вышей средней PC - "1", у остальных - "0"

select *, 
case
when price > (select avg(price) from pc) 
then 1
else 0
end flag
from printer



--task15 (lesson3)
--Корабли: Вывести список кораблей, у которых class отсутствует (IS NULL)

select ship
from outcomes o2
left join ships s 
on o2.ship = s.name
where class IS NULl


--task17 (lesson3)
--Корабли: Найдите сражения, в которых участвовали корабли класса Kongo из таблицы Ships.

select name
from ships s
join outcomes o
on s.name = o.ship
where class = 'Kongo'

--task1  (lesson4)
-- Компьютерная фирма: Сделать view (название all_products_flag_300) для всех товаров (pc, printer, laptop) с флагом, если стоимость больше > 300. Во view три колонки: model, price, flag
CREATE view all_products_flag_300 as 

select model, price,
case
when price > (select avg(price) from pc)  
then 1
else 0
end flag
from pc
union 
select model, price,
case
when price > (select avg(price) from printer) 
then 1
else 0
end flag
from printer
union 
select model, price,
case
when price > (select avg(price) from laptop) 
then 1
else 0
end flag
from laptop


--task2  (lesson4)
-- Компьютерная фирма: Сделать view (название all_products_flag_avg_price) для всех товаров (pc, printer, laptop) с флагом, если стоимость больше cредней . Во view три колонки: model, price, flag

CREATE view all_products_flag_avg_price as

select model, price,
case
when price > 300 
then 1
else 0
end flag
from pc
union 
select model, price,
case
when price > 300 
then 1
else 0
end flag
from printer
union 
select model, price,
case
when price > 300 
then 1
else 0
end flag
from laptop

--task3  (lesson4)
-- Компьютерная фирма: Вывести все принтеры производителя = 'A' со стоимостью выше средней по принтерам производителя = 'D' и 'C'. Вывести model

select *
from product p 
join printer p2 
on p.model = p2.model 
where price > (select avg(price) from product p 
join printer p2 
on p.model = p2.model where maker = 'D' or maker = 'C')

--task4 (lesson4)
-- Компьютерная фирма: Вывести все товары производителя = 'A' со стоимостью выше средней по принтерам производителя = 'D' и 'C'. Вывести model

select p.model
from pc p
join product p2 
on p.model = p2.model
where maker = 'A' and price > (select avg(price) from printer p  
join product p2 on p.model = p2.model where maker = 'D' or maker = 'C')
union 
select p3.model
from printer p3
join product p2 
on p3.model = p2.model
where maker = 'A' and price > (select avg(price) from printer p  
join product p2 on p.model = p2.model where maker = 'D' or maker = 'C')
union 
select l.model
from laptop l
join product p2 
on l.model = p2.model
where maker = 'A' and price > (select avg(price) from printer p  
join product p2 on p.model = p2.model where maker = 'D' or maker = 'C')

--task5 (lesson4)
-- Компьютерная фирма: Какая средняя цена среди уникальных продуктов производителя = 'A' (printer & laptop & pc)

select avg(price)
from 
(
select price
from pc p
join product p2 
on p.model = p2.model
where maker = 'A'
union 
select price
from printer p3
join product p2 
on p3.model = p2.model
where maker = 'A'
union 
select price
from laptop l
join product p2 
on l.model = p2.model
where maker = 'A'
) as t

--task6 (lesson4)
-- Компьютерная фирма: Сделать view с количеством товаров (название count_products_by_makers) по каждому производителю. Во view: maker, count
CREATE view count_products_by_makers as 
select maker, count(model) as count
from product p 
group by maker



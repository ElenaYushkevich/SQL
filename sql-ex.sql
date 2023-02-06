/*1	Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. 
Вывести: model, speed и hd*/
SELECT model, speed, hd 
FROM PC WHERE price < 500

/*2	Найдите производителей принтеров. Вывести: maker*/
Select distinct maker from product where type = 'printer'

/*3	Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.*/
select model, ram, screen from laptop where price > 1000

/*4	Найдите все записи таблицы Printer для цветных принтеров.*/
Select * from printer where color = 'y'

/*5	Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.*/
Select model, speed, hd from pc where (cd='12x' or cd='24x') and price<600

/*6	Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. Вывод: производитель, скорость.*/
Select distinct maker, laptop.speed from product join laptop on product.model=laptop.model where laptop.hd>=10 order by maker, speed

/*7	Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).*/
SELECT p.model, price FROM pc JOIN Product p ON PC.model=p.model WHERE maker='B'
UNION
SELECT p.model, price FROM printer pr JOIN Product p ON pr.model=p.model WHERE maker='B'
UNION
SELECT p.model, price FROM laptop lp JOIN Product p ON lp.model=p.model WHERE maker='B'

/*8	Найдите производителя, выпускающего ПК, но не ПК-блокноты.*/
select distinct maker from product where type='PC' 
except
select distinct maker from product where type='Laptop'

/*9	Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker*/
select distinct Product.maker from product join PC on product.model=PC.model where speed>449

/*10	Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price	*/
Select model, price from printer where price = (SELECT MAX(price)
 FROM Printer)
 
 
 

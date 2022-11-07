--1. Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd
select model, speed, hd from PC where price < 500;

--2.Найдите производителей принтеров. Вывести: maker
select distinct maker from product where type = 'Printer';

--3.Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.
select model, ram, screen from laptop where price > 1000;

--4.Найдите все записи таблицы Printer для цветных принтеров.
select * from printer where color = 'y';

--5. Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.
select model, speed, hd from pc where (cd = '12x' or cd = '24x') and price < 600;


--6.Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. Вывод: производитель, скорость.
select distinct maker, speed from product
inner join laptop on product.model = laptop.model
where product.type = 'laptop' and laptop.hd >= 10

--7.Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).
select p.model, price from product p inner join pc on p.model = pc.model where p.maker = 'B'
union
select p.model, price from product p inner join laptop l on p.model = l.model where p.maker = 'B'
union
select p.model, price from product p inner join printer pr on p.model = pr.model where p.maker = 'B'
union
select p.model, price from product p inner join pc on p.model = pc.model where p.maker = 'B';


--8.Найдите производителя, выпускающего ПК, но не ПК-блокноты.
select maker from product where type = 'PC'
except
select maker from product where type in ('laptop');

--9.Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker
select distinct p.maker from product p 
inner join pc on p.model = pc.model
where speed >= 450;

--10.Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price
select model, price from printer where price = (select max(price) from printer);

-- 11. Найдите среднюю скорость ПК.
select avg(speed) from pc;

--12.Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.
select avg(speed) as Avg_speed from laptop 
where price > 1000;

--13.Найдите среднюю скорость ПК, выпущенных производителем A.
select avg(speed) from pc
inner join product p on pc.model = p.model
where maker = 'A';

--14.Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий.
select s.class, s.name, c.country from ships s
inner join classes c on s.class = c.class
where c.numGuns >= 10;

--15.Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD
select hd from pc 
group by hd
having count (model) >= 2;

--16. Найдите пары моделей PC, имеющих одинаковые скорость и RAM. В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i), Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM.
select distinct p1.model, p2.model, p1.speed, p1.ram from pc p1, pc p2
where p1.speed = p2.speed and p1.ram = p2.ram and p1.model > p2.model;

--17. Найдите модели ПК-блокнотов, скорость которых меньше скорости каждого из ПК. Вывести: type, model, speed
select distinct pr.type, l.model, l.speed from product pr, laptop l, pc
where l.speed < all (select speed from pc) and type = 'laptop';

--18.Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price 
select distinct prod.maker, pr.price from product prod inner join printer pr on prod.model = pr.model
where price = (select min(price) from printer where color = 'y') and color = 'y';

--19.Для каждого производителя, имеющего модели в таблице Laptop, найдите средний размер экрана выпускаемых им ПК-блокнотов.Вывести: maker, средний размер экрана.
select pr.maker, avg(screen) as Avgscreen from product pr inner join laptop l on pr.model = l.model
group by maker;

--20. Найдите производителей, выпускающих по меньшей мере три различных модели ПК. Вывести: Maker, число моделей ПК.
Select maker, count(model) as Count_Model from product where type = 'pc' group by maker 
having count(model) >= 3;

--21.Найдите максимальную цену ПК, выпускаемых каждым производителем, у которого есть модели в таблице PC. Вывести: maker, максимальная цена.
select pr.maker, max(pc.price) from product pr inner join pc on pr.model = pc.model
group by pr.maker;

--22.Для каждого значения скорости ПК, превышающего 600 МГц, определите среднюю цену ПК с такой же скоростью. Вывести: speed, средняя цена.
select speed, avg(price) from pc
where speed > 600
group by speed;

--23.Найдите производителей, которые производили бы как ПК со скоростью не менее 750 МГц, так и ПК-блокноты со скоростью не менее 750 МГц. Вывести: Maker
select distinct maker from product inner join pc on pc.model = product.model  
where pc.speed >= 750 and maker in (select maker from laptop inner join product on laptop.model = product.model where laptop.speed >= 750);

--24.

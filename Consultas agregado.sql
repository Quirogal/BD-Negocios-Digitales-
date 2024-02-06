--Consultas Simples con select -SQL-LMD
use NORTHWND
--consultas de agregado
--Caracteristicas principal es que devuelven un solo registro
--Top y percent
--Selecciona las primeras 10 ordenes de compra/
--Los primeros 10 
select top 10  * from Orders
--Los ultimos 10 
select top 10  * from Orders
order by OrderID desc
select top 10 customerID as 'Numero de Cliente', OrderDate as 'Fecha de orden',
ShipCountry as 'Pais de Entrega' from Orders
order by OrderID desc
--Seleccionar el 50 % de los registros 
select top 50 percent *from Orders
select top 25 percent *from Orders
--Seleccionar los primeros 3 clientes de alemania 
select *from Customers 
where Country = 'Germany'
select top 3 * from Customers
where country ='Germany'
select top 3  CompanyName as 'cliente', country as Pais, address as Direccion 
from Customers
where country ='Germany'
--Selevccionar  el producto con el precio mayor 
select *from Products
order by UnitPrice desc 
--Muestra el precio mas alto de los productos (max)
select max (unitprice)as 'Precio Maximo' from Products
--Mostrar el precio minimo de los productos 
select min (unitprice)as 'Precio Minimo' from Products
--Seleccionar todas las ordenes de compra 
select * from Orders 
--Seleccionar el numero total de ordenes (count)
select count(*) as 'Total de ordenes ' from orders Orders
select count(ShipRegion) as 'Total de ordenes ' from orders Orders
--seleccionar todas aquellas ordenes donde la region de envio no se null 
select * from Orders
select * from  Orders
where  ShipRegion is not null
--Seleccionar de forma ascendente  los productos por precio
SELECT *FROM Products
ORDER BY UnitPrice
--Seleccionar el numero de precios de los productos 
SELECT COUNT(DISTINCT UnitPrice) AS UnitPrice
FROM Products
--Contar todos los diferentes paises de los clientes 
select count(distinct country) as 'Numero de paises ' from  Customers
--Seleccionar las suma total de cantidades de las ordenes de compra 
select sum (quantity) from [Order Details]
select * from [Order Details]
--seleccionar todos los registros de orders details calculado su importe 
--Campo calculado
SELECT *, (Quantity * UnitPrice) AS Importe
FROM [Order Details] 
--Seleccionar el total en dinero que a vendido la empresa 
select sum (UnitPrice*Quantity)  as 'total'from [Order Details]
--Seleccionar el total de venta del producto chang
select * from [Order Details]
select sum (UnitPrice*Quantity)  as 'Total' from [Order Details]
where ProductID = 2 
--Seleccionar el promedio de los precios de los productos (avg)
select * from [Order Details]
select avg(UnitPrice) from Products
--Seleccionar el promedio total y el total de  venta  de los productos 41, 60 y 31 
select * from  [Order Details]
select sum(UnitPrice*Quantity) as Total,avg (UnitPrice*Quantity)  from [Order Details]
where ProductID in (41,60,31)
select sum(UnitPrice*Quantity) as Total,avg (UnitPrice*Quantity)  from [Order Details]
where ProductID = 41 or ProductID = 60 or ProductID = 31
--Innstruccion group by 
select.country,count(*)from customers 
select country,count(*)from customers 
group by country
--Seleccionar el numero de clientes agrupados por pais 
select *from customers 
select country,count(*) as 'Total de clientes' from customers 
group by country order by 1 desc
--Seleccionar el numero de ordenes enviadas por el shippervia 
select shipvia,count (*)as 'Numero de ordenes 'from Orders
group by ShipVia
select s.CompanyName as 'Nombre Comapania',count (*)as total from Orders
as o inner join Shippers as s on o. ShipVia = s.ShipperID group by s.CompanyName







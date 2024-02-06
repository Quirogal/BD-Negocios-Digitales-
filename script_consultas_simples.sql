--Consultas Simples con select -SQL-LMD
use NORTHWND
--Selleccionar todos los clientes 
select *from Customers
--Seleccionar  el nombre del cliente, nombre , contacto y la ciudad 
select CompanyName,ContactName,City from  Customers
--Seleccionar todos los paises de los clientes  (distinct)
select country from Customers
select distinct country from Customers
--Selecciona el numero de paises de donde son mis clientes (count)
select count (*) from Customers
select count (Country) from Customers
select count (distinct Country) from Customers
--seleccionar el cliente que tenga una id Anton
select *from Customers 
where CustomerID = 'ANTON'
--Seleccionar todos los clientes de Mexico 
select count (distinct Country) from Customers
select *from Customers 
where Country = 'Mexico'
--Seleccionar todos los registros de los clientes de berlin 
select *from Customers 
where City = 'Berlin'
--Order by 
--Seleccionar todos los productos ordenados por precio 
select * from Products
order by UnitPrice
--seleccionar  todos los productos ordenados por el precio de mayor a menor 
select * from Products
order by UnitPrice DESC
--Seleccionar todos los productos Alfabeticamente 
select * from Products
order by ProductName Asc

--Seleccionar todos los clientes por Pais y dentro por nombre de forma asendente
select country,companyname, city from Customers
order by Country desc, CompanyName asc
--Operador and 
--Seleccionar todos los clientes de españa y que su nombre comience  con G 
select * from Customers 
where  country='spain' and   CompanyName like 'G%'


--Seleccionar todos los clientes de Berlin a Alemania con iun codigo postal mayor a 1200
select *from Customers
where  country='Germany'  and 
city = 'Berlin' and PostalCode>1200

--Seleccionar todos los clientes de españa y que su nombre comience con G o con R 
select *from Customers
where  country='Spain'
and (CompanyName like 'G%' or CompanyName like 'r%')
--Clausula or 
--Seleccionar todos los clientes de Alemania o España 
select *from Customers
where  country='Germany'
or Country ='spain'

--Seleccionar todos los clientes de Berlin o de noruega o que comiencen su nombre con g 
select *from Customers
where  City='Berlin'
or Country ='Norway'
or CompanyName like 'g%'

--Seleccionar solo los clientes de españa 
Select *from  Customers
where not country='Spain'
--seleccionar todos los productos que no tengan un precio entre 18 y 20 dolares 
select * from Products
where not(  UnitPrice>=18 and UnitPrice<=20) 
select* from Products
where UnitPrice not between 18 and 20
--seleccionar todos los clientes que no son de paris o de londres 
select* from  Customers
where not(  City='London' or City='Paris') 
select *from customers 
where city in ('paris','london')
select *from customers 
where city not in ('paris','london')
--seleccionar todos los productos que no tienen precios mayores a 30
select* from Products
where not UnitPrice>30  
--Seleccionar todos los productos que no tienen precios menores a 30
select* from Products
where not UnitPrice<30 
--Operador like
--Seleccionar todos los clientes que comienzan con la letra a
select * from Customers
where  CompanyName like 'a'
--seleccionar todos los clientes que finalizan con la palabra es 
select * from Customers
where  CompanyName like '%es'
--Seleccionar todos los clientes que contengan la palabra mer 
select * from Customers
where  CompanyName like '%mer%'
--Seleccionar todos los clientes con una ciudad que comience con cualqier caracter seguido de la palabra ondon 
select * from Customers
where  City like '_ondon'
--Seleccionar todos los clientes con una ciudad que comience con L seguido de tres cualquiera caracteres y que termine con la palabra ON 
select * from Customers
where  City like 'L___ON'
--Seleccionar todos los productos que comiencen con la letra A,C,T
select *from Products
where  ProductName like '[act]%'
--Seleccionar todos os productos que comiencen de la letra b
select * from Products
where ProductName like '[b-g]%'
--Clausula in()
--seleccionar todos los clientes de alemania, españa y reino unido 
select *from Customers
where Country in('Germany', 'spain','uk')
--Not in 
--Seleccionar todos los clientes que no sean de alemania, españa y reino unido 
select *from Customers
where Country not in('Germany', 'spain','uk')
select *from Customers
where not (country = 'Germany'
or country='Spain' or country ='uk')
--Instrucción between 
--Seleccionar  todos los productos con un precio entre 10 y 20 dolares 
select * from Products
where UnitPrice between 10 and 20
select * from Products
where UnitPrice >= 10 and  UnitPrice <=20
--Alias de columnas y alias de tablas 
--seleccionar el nombre del producto ,su stock y su precio
select ProductName as 'Nombre del producto',
UnitsInStock as 'Existencia ',UnitPrice as 'Precio'from Products

select ProductName as 'Nombre del Producto',
UnitsInStock as existencia, UnitPrice precio from Products

select ProductName as 'Nombre del Producto',
UnitsInStock as existencia, p.UnitPrice precio
from Products as p
inner join [Order Details] as od
on p.ProductID = od.ProductID
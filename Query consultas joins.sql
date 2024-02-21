use NORTHWND
--Consultas con joins 

--inner join
--Seleccionar el numero de orden, nombre del cliente y la fecha de la orden 

select orderId,CompanyName, OrderDate from 
Orders as o inner join Customers as c 
on c.CustomerID =o.CustomerID
--Mostrat el numero de ordenes de cada cliente mostrando el nombre de la compañia 
select CompanyName, count(*) from Orders as o inner join Customers as c
on c.CustomerID =o.CustomerID
group by CompanyName
select CompanyName, count(*) as 'Total pedidos ' 
from Orders as o inner join Customers as c
on c.CustomerID =o.CustomerID 
group by CompanyName
order by 2 desc
--Seleccionar el numero de producto , el nombre del producto
--y el nombre de la categoria  ordenados en forma ascendente con respecto 
--al nombre de la categoria
select ProductID, ProductName,CategoryID
from Products join Categories 
on c.ProductID =o. 
group by CompanyName
order by 2 desc

--Seleccionar todas las ordenes 
--Mostrando las fechas ordenes de compra
--nombre del shipper y el nombre al cliente 
--al que se le vendio 8inner joinn (respecto a 3 tablas )
select o.OrderDate as 'Fecha de Orden',c.CompanyName as 'Nombre del flete',s.CompanyName as 'Cliente'
from Customers as c
inner join Orders  as o
on c.CustomerID = o.CustomerID 
inner join Shippers as s 
on o.ShipVia =s.ShipperID
--Seleccionar el nombre del producto y su categoria 
select ProductName,CategoryID from 
Products 
--Listar el nombre del cliente , 
--la fecha de la orden y los nombres
--de los productos que fueron vendidos 
select c.CompanyName, o.OrderDate  from 
customers as c inner join Orders
as o on c.CustomerID = o.CustomerID
inner join[Order Details] as od on o.OrderID=od.OrderID
inner join Products as p 
on od.ProductID =p.ProductID
--seleccionar los nombres completos de los empleados
--los nombres de los productos que vendio 
--y calcular el importe 
select  Concat(e.firstname,'', e.LastName) as 'Nombre Completo', p.ProductName as 'Descripcion', od.Quantity as'Cantidad',
(od.Quantity * od.UnitPrice) as 'Importe'
from 
Employees as e inner join Orders
as o on e.EmployeeID=o.EmployeeID 
inner join  [Order Details] as od on od.OrderID= o.OrderID
inner join Products as p 
on p.productID =od.ProductID 
--Seleccionar los nombres completos de los empleados ,
--los nombres de los productos que vendio y la cantidad
--de ellos y calcular el importe,
--pero  solo los enviados a  suiza,alemania y francia.
select  Concat(e.firstname,'', e.LastName) as 'Nombre Completo', p.ProductName as 'Descripcion', od.Quantity as'Cantidad',
(od.Quantity * od.UnitPrice) as 'Importe',o.ShipCountry
from 
Employees as e inner join Orders
as o on e.EmployeeID=o.EmployeeID 
inner join  [Order Details] as od on od.OrderID= o.OrderID
inner join Products as p 
on p.productID =od.ProductID 
where o.ShipCountry in ('france','Germany','Swittzerland')
--Seleccionar los nombres completos de los empleados ,
--los nombres de los productos que vendio y la cantidad
--de ellos y calcular el importe,
--pero  solo los enviados a  suiza,alemania y francia.
--Agrupados por la cantidad total de ordenes hechas 
--por los empleados 
-- Total de ordenes enviadas a Francia, alemania y suiza
select count(*) as 'Total de Ordenes'
from
employees as e
inner join orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
inner join Products as p
on p.ProductID = od.ProductID
where o.ShipCountry in ('France', 'Germany','Switzerland')


-- Seleccionar el numero de ordenes enviadas a alemania, suiza y francia
-- agrupadas por el empleado
select count(*) as 'Total de Ordenes', CONCAT(e.FirstName, ' ', e.LastName)
as 'Nombre Completo'
from
employees as e
inner join orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
inner join Products as p
on p.ProductID = od.ProductID
where o.ShipCountry in ('France', 'Germany','Switzerland')
group by CONCAT(e.FirstName, ' ', e.LastName)

 --Seleccionar el total de dinero que se le
 --han vendido a cada uno de los clientes
 --por cada año
select companyName as 'Cliente',
sum(UnitPrice * Quantity) as 'Total de venta'
from
[Order Details] as od
inner join
Orders as o
on od.OrderID = o.OrderID
inner join Customers as c
on o.CustomerID = c.CustomerID
where year(o.OrderDate) = '1996'
group by companyName
order by 2 desc
--Seleccionar el total de dinero que se le
 --han vendido a cada uno de los clientes
 --por cada año
 select companyName as 'Cliente',
sum(UnitPrice * Quantity) as 'Total de venta'
from
[Order Details] as od
inner join
Orders as o
on od.OrderID = o.OrderID
inner join Customers as c
on o.CustomerID = c.CustomerID
where year(o.OrderDate) = '1996,1997,1998,1999,2000'
group by companyName
order by 2 desc

SELECT c.companyName AS 'Cliente',
YEAR(o.OrderDate) AS 'Año',
SUM(od.UnitPrice * od.Quantity) AS 'Total de venta'
FROM [Order Details] AS od
INNER JOIN Orders AS o ON od.OrderID = o.OrderID
INNER JOIN Customers AS c ON o.CustomerID = c.CustomerID
WHERE YEAR(o.OrderDate) IN (1996, 1997, 1998, 1999, 2000)
GROUP BY c.companyName, YEAR(o.OrderDate)
ORDER BY c.companyName, YEAR(o.OrderDate)

--Seleccionar el importe total que se ah vendido por categoria de producto
SELECT c.CategoryName AS 'Categoría de Producto',
       SUM(p.UnitPrice * od.Quantity) AS 'Importe Total Vendido'
FROM Categories AS c
INNER JOIN Products AS p ON c.CategoryID = p.ProductID
GROUP BY c.CategoryName 
ORDER BY SUM(p.UnitPrice * od.Quantity) DESC;

select c.CategoryName,
sum(od.Quantity * od.UnitPrice) as 'Total'
from Categories as c
inner join Products as p
on p.CategoryID =  c.CategoryID
inner join [Order Details] as od
on od.ProductID = p.ProductID
group by c.CategoryName
order by 2 Desc
--Seleccionar el importe  total que se han vendido 
--por categoria y nombre de producto, que permita 
--visualizar el producto mas vendido 
select c.CategoryName,p.productName,
sum(od.Quantity * od.UnitPrice) as 'Total'
from Categories as c
inner join Products as p
on p.CategoryID =  c.CategoryID
inner join [Order Details] as od
on od.ProductID = p.ProductID
group by c.CategoryName,p.productName
order by 2 Desc
--De la consulta anterior solo mostrar aquellos totales 
--que son mayores a 20000
SELECT c.CategoryName,
p.ProductName,
SUM(od.Quantity * od.UnitPrice) AS 'Total'
FROM Categories AS c
INNER JOIN Products AS p ON p.CategoryID = c.CategoryID
INNER JOIN [Order Details] AS od ON od.ProductID = p.ProductID
GROUP BY c.CategoryName, p.ProductName
HAVING SUM(od.Quantity * od.UnitPrice) > 20000
ORDER BY 2 DESC;
--SELECCIONAR EL NUMERO DE CLIENTES POR CADA PAIS 
--EN DONDE SE INCLUYAN LOS QUE TENGAN MAS DE 5 CLIENTES Y 
--ORDNADOS DE FORMA DESENDENTE POR EL NUMERO DE CLIENTES 
SELECT Country, COUNT(CustomerID) AS NumeroDeClientes
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5
ORDER BY NumeroDeClientes DESC;

select country,count(*) from Customers
where  not Country ='Brazil'
group by country
having count(*)>5

--Seleccionar los clientes que han realizado
--pedido en mas de un pais (customerID, Nombre del cliente, shipcountry)
SELECT c.CustomerID, 
c.ContactName AS 'Nombre del Cliente', 
o.ShipCountry
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.ContactName, o.ShipCountry
HAVING COUNT(DISTINCT o.ShipCountry) > 1
--Nombre de categoria , ordenados de forma ascendente con respecto
--al nombre de la categoria 

select * from Products  as p 
inner join Categories as c on p.CategoryID = c.CategoryID
order by c. CategoryName asc
--Left join 
Select c.CompanyName,o.OrderID from  customers as c 
left outer join orders as o 
on c.CustomerID =o.CustomerID
where o.OrderID is null

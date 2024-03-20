select c.CompanyName as 'NombreCliente',
min(o.OrderDate)as'Fecha de la primera compra',
sum (od.Quantity*od.UnitPrice) as 'Total de compras del cliente'
from Orders  as o
inner join [Order Details] as od
on o.OrderID =od.OrderID
inner join Customers as c
on c.CustomerID =o.CustomerID
group by c.CompanyName 
having sum(od.Quantity*od.UnitPrice)>1000
order by 'Total de compras del cliente' desc

select p.ProductName,p.UnitsInStock,
sum(od.Quantity *od.UnitPrice)from 
Products as p
inner join [Order Details] 
as od on  od.ProductID = p.ProductID
group by p.ProductName,p.UnitsInStock
having count(od.OrderID)>0
order by 2 desc 

--Seleccionar las ordenes realizadas por los 
--empleados , mostrando solamente los  que han vendido mas de 50 
--ordenes 

select concat  (e.FirstName,'' ,e.LastName)as fullname,
count(o.OrderID) as 'Total' from  
Orders as o
inner join Employees as e 
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od 
on od.OrderID = od.OrderID
group by concat (e.FirstName,'',e.LastName)
having  count (o.OrderID) > 50 

--emamen
select concat (e.FirstName,'',e.LastName) as fullname,
count (distinct od.ProductID) as 'total'
from Orders as o 
inner join Employees as e 
on e.EmployeeID=o.EmployeeID
inner join [Order Details] as od 
on od.OrderID = o.OrderID
group by concat (e.FirstName,'', e.LastName)
having count (o.OrderID)>50


select count (distinct od.ProductID) as 'Total'
from Orders as o 
inner join Employees as e 
on e.EmployeeID=o.EmployeeID
inner join [Order Details] as od
on od.OrderID=o.OrderID
where concat (e.FirstName,'',e.LastName) = 'Andrew Fuller'


select p.ProductName ,count(od.ProductID)
as totalVeces from [Order Details] as od 
right join Products as p 
on od.ProductID =p.ProductID
group by p.ProductName
having count (od.ProductID)>=1
order by 2 desc 


select p.ProductName ,count(od.ProductID) 
as totalVeces from Products as p
left join [Order Details] as od 
on od.ProductID =p.ProductID
group by p.ProductName
having count (od.ProductID)>=1
order by 2 desc 


select concat (e.FirstName,'',e.LastName) as fullname,
sum (od.Quantity*od.UnitPrice) as 'total'
from Orders as o 
inner join Employees as e 
on e.EmployeeID=o.EmployeeID
inner join [Order Details] as od 
on od.OrderID = o.OrderID
where year(o.OrderDate) = '1996'
group by concat (e.FirstName,'', e.LastName)
having sum (od.Quantity*od.UnitPrice)>500
order by 'Total' desc 
--Vistas 
create view vistaConsulta1 
as 
select c.CompanyName as 'NombreCliente',
min(o.OrderDate)as'Fecha de la primera compra',
sum (od.Quantity*od.UnitPrice) as 'Total de compras del cliente'
from Orders  as o
inner join [Order Details] as od
on o.OrderID =od.OrderID
inner join Customers as c
on c.CustomerID =o.CustomerID
group by c.CompanyName 
having sum(od.Quantity*od.UnitPrice)>1000
select * from vistaConsulta1
where [Nombre Cliente] ='Vaffeljernet'
select sum  ([Total de compras del cliente ]) as total 
from vistaConsultas1 
where year([Fecha Primera Compra ]) =
as 


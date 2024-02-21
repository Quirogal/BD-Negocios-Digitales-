 
--Procedimientos  Almacenados 
select * from Customers
go
--SP para visualizar los clientes
--Crear un SP 
create proc visualizaClientes
as 
begin 
select * from Customers
end 
go 

--Cambiar un SP 
Alter proc visualizaClientes
as begin 
select companyname,contactname  from Customers 
end 
go 
--Eliminar un SP 
drop proc visualizaClientes 
--Ejecutar SP 
exec  visualizaClientes
go 
create proc listarclientesporciudad
@ciudad nvarchar (15)
as 
begin
select *from Customers
where city= @ciudad
end
go 

exec listarclientesporciudad 'London'

create proc listarclientesporNombre
@nombre nvarchar (40)
as 
begin
select *from Customers
where CompanyName like @nombre + 'laz'
end
go 
--Realizar un sp que obtenga las ventas totales 
--realizadas a los clientes por año elegido 
 create proc ventasclientesporaño 
 @nombre nvarchar (40)
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

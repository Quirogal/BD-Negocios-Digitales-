create table productos(
idproducto int not null,
nombreProd varchar(100)not null,
existencia  int not null,
precioUnitario decimal(10,2) not ull,
constraint pk_idproducto
primary key (idproduct),
constraint unique_nombreprd
unique (nombreProd)
)
go
insert into productos 
select tomp 50 ProductID,ProductName,UnitsInStock,UnitPrice
from NORTHWND.dbo.Products
create table ventas (
venta id int not null,
fecha date not null,
idcliente int not null,
idvendedor int not null,
constraint pk_ventas
primary key(ventaid )
)
create table clientes(
idcliente int not null,
nombre varchar(30),


}
create table detalle_venta
( idventa int not null,
id producto int not null,
precioVenta decimal (10,2)
cantidad int 
constraint fk_detalle_venta_venta
foreign key(id venta)
references ventas (ventaid),
contraint fk_detalle_venta_producto
foreign key (idproducto)
references productos (idproducto)
)
alter table ventas
add constraint  fk_venta_cliente
foreign key(idcliente)
references clientes 

alter table venta 
add constraint fk_venta_vendedor 
foreign key(idvendedor)
references vendedor
 

 --Vista de la tabla clientes utilizando customer de northwind
 create view vendedores_view
 as 
 select EmployeeID,firstname,lastname,City,Country
 from NORTHWND.dbo.Employees
 select *from clientes _view

 create view clientes_view
 as 
 select top 30 CustomerID,CompanyName,City,Country
 from NORTHWND.dbo.Customers
  
  create view productos _view
 as 
 select top 50 ProductID,ProductName,UnitsInStock,UnitPrice
 from NORTHWND.dbo.Products

 --Strore procedure que llena las tablas ventas y ordenes utilizando las vistas
 create or alter proc llenar_tablas_sp
 @nombreTabla varchar(20)
 as
 begin
 if @nombreTabla ='detalle_venta'
 begin
 select  vc.CustomerID,o.OrderDate,vc.CustomerID,vv.employeeID 
 from clientes_view as vc
 inner join NORTHWND.dbo.Ordders as o 
 on vc CustomerID =o.CustomerID 
 inner join vendedores _ view as vv
 on vv.EmployeeID =o.EmployeeID 
 end 
 end 
  
--Inner join 
select c. Numero as 'Numero del Cliente',c.Nombre as 'Nombre de Cliente',
c.Pais as 'Pais del cliente',
o.FechaOrden  as 'Fecha de orden',
o.FechaEntrega as 'Fecha de entrega',
o.ClienteId as 'Foreign key de la tabla cliente'
from 
Clientes as c
inner join Ordenes as o 
on c.Numero = o.ClienteId
--Left join (La tabla izquierda siempre es la primera 
--que se pone en el join)
select c. Numero as 'Numero del Cliente',c.Nombre as 'Nombre de Cliente',
c.Pais as 'Pais del cliente',
o.FechaOrden  as 'Fecha de orden',
o.FechaEntrega as 'Fecha de entrega',
o.ClienteId as 'Foreign key de la tabla cliente'
from 
Clientes as c
left join  Ordenes as o 
on c.Numero = o.ClienteId
--Todas aquellos clientes que no le han comprado nunca 
select c. Numero as 'Numero del Cliente',c.Nombre as 'Nombre de Cliente',
c.Pais as 'Pais del cliente',
o.FechaOrden  as 'Fecha de orden',
o.FechaEntrega as 'Fecha de entrega',
o.ClienteId as 'Foreign key de la tabla cliente'
from 
Clientes as c
left join  Ordenes as o 
on c.Numero = o.ClienteId
where o.clienteid is null 
--seleccionar todos los datos de la tabla ordenes 
--y la tabla clientes utilizando un left join 
select c. Numero as 'Numero del Cliente',c.Nombre as 'Nombre de Cliente',
c.Pais as 'Pais del cliente',
o.FechaOrden  as 'Fecha de orden',
o.FechaEntrega as 'Fecha de entrega',
o.ClienteId as 'Foreign key de la tabla cliente'
from 
Clientes as c
left join  Ordenes as o 
on c.Numero = o.ClienteId
--Todas aquellos clientes que no le han comprado nunca 
select c. Numero as 'Numero del Cliente',c.Nombre as 'Nombre de Cliente',
c.Pais as 'Pais del cliente',
o.FechaOrden  as 'Fecha de orden',
o.FechaEntrega as 'Fecha de entrega',
o.ClienteId as 'Foreign key de la tabla cliente'
from 
Ordenes  as o
left join  Clientes  as c
on c.Numero = o.ClienteId
--Right join 
select c. Numero as 'Numero del Cliente',c.Nombre as 'Nombre de Cliente',
c.Pais as 'Pais del cliente',
o.FechaOrden  as 'Fecha de orden',
o.FechaEntrega as 'Fecha de entrega',
o.ClienteId as 'Foreign key de la tabla cliente'
from 
Ordenes  as o
right join   Clientes  as c
on c.Numero select o.Numero,Nombre,Pais, FechaOrden from Ordenes as o 
inner join (select  Numero,Nombre,pais from Clientes)as  c 
on o.ClienteId = c.Numero = o.ClienteId
 

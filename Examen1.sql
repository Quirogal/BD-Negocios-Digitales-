select p.ProductName as 'NombreProducto',(od.Quantity *od.unitPrice)as'Importe'
from[Order Details] as od
inner join Products as p
on p.ProductId =od.ProductID
inner join orders as o 
on o.OrderID=od.OrderID
where year (o.OrderDate) ='1997'
order by 2 

select c.companyName as 'cliente', count (*) as 'Cantidad Compras'
from orders as o 
inner join Customers as c 
on o.CustomerID=c.CustomerID
group by c.CompanyName
having count (*)>1

select *from products as p 
left join 
[Order Details] as od 
on p.ProductID =od.ProductID
where od.ProductID is null
order by p.productName asc

select c.categoryName,COUNT(*) as 'total'
from categories as c
inner join products as p 
on c.CategoryID=p.CategoryID
inner join [Order Details] as od
on od.ProductID=p.ProductID
group by c.CategoryName
having count (*)>10;

select p.ProductName  as 'Nombre producto',
c.categoryName as 'Nombre cagtegoria'
from Products as p 
inner join Categories as c 
on  p.categoryid =c.categoryid
where p.unitprice=50
order by 1,2 


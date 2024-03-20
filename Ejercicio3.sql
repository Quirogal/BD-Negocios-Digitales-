 -- Realizar un SP que calcule las ventas totales hechas por cada
--empleado por año, el sp debe solicitar el nombre del empleado y un año inicial y un año final
 Create proc  CalcularVentasPorEmpleadoYAnio
    @EmployeeName nvarchar(100),
    @StartYear int,
    @EndYear int
as 
begin 
    Set nocount on ;

    select  e.EmployeeID, e.FirstName, e.LastName, YEAR(o.OrderDate) AS Anio, SUM(od.Quantity * od.UnitPrice) AS VentasTotales
    from Employees e
    join  Orders o on  e.EmployeeID = o.EmployeeID
    Join [Order Details] od on  o.OrderID = od.OrderID
    where e.FirstName + ' ' + e.LastName = @EmployeeName
        and year (o.OrderDate) between  @StartYear and  @EndYear
    group by  e.EmployeeID, e.FirstName, e.LastName, year (o.OrderDate);
end ;

--Crear y  sp que Muestre el precio
--promedio de los productos dentro de cada categoría, incluyendo solo aquellas
--categorías cuyo precio promedio de producto supere el precio enviado en el store procedure
Create proc MostrarPrecioPromedioPorCategoria
    @PrecioMinimo money
as 
begin 
    set nocount on ;

    Select c.CategoryID, c.CategoryName, avg(p.UnitPrice) as PrecioPromedio
    from Categories c
    Inner join  Products p on  c.CategoryID = p.CategoryID
    group by  c.CategoryID, c.CategoryName
    having  avg (p.UnitPrice) > @PrecioMinimo;
end ;
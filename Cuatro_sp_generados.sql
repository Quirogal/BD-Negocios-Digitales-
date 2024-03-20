--Crear un sp que permita insertar registros en la tabla Customers 
create proc InsertarCliente
    @CustomerID nchar(5),
    @CompanyName nvarchar(40),
    @ContactName nvarchar(30),
    @ContactTitle nvarchar(30),
    @Address nvarchar(60),
    @City nvarchar(15),
    @Region nvarchar(15),
    @PostalCode nvarchar(10),
    @Country nvarchar(15),
    @Phone nvarchar(24),
    @Fax nvarchar(24)
as 
begin
    set nocount on ;

    Insert into  Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
    Values  (@CustomerID, @CompanyName, @ContactName, @ContactTitle, @Address, @City, @Region, @PostalCode, @Country, @Phone, @Fax);
end ;

--Crear un Sp que permita eliminar  registros en la tabla Customers , por customersID
Create proc  EliminarClientePorID
    @CustomerID nchar(5)
as
begin
    set nocount on;

    delete from  Customers
    where  CustomerID = @CustomerID;
end;

--Crear un SP que permita eliminar un producto de una orden dada
Create proc  EliminarProductoDeOrden
    @OrderID int,
    @ProductID int
as
begin 
    set nocount on ;

    delete from  [Order Details]
    where OrderID = @OrderID AND ProductID = @ProductID;
end;

--Crear un Sp que permita eliminar  un product de una order y modificar el stock (unitstock del producto)
Create proc  EliminarProductoYActualizarStock
    @OrderID int,
    @ProductID int,
    @Quantity int
as
begin
    set nocount on ;

    Begin Transaction ;

    -- Eliminar el producto de la orden
    Delete from  [Order Details]
    Where  OrderID = @OrderID AND ProductID = @ProductID;

    -- Actualizar el stock del producto
    Update  Products
    Set  UnitsInStock = UnitsInStock + @Quantity
    Where  ProductID = @ProductID;

    Commit transaction ;
end;
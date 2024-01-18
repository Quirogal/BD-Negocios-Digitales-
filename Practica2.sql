--Practica 2
--Crear la Practica2

CREATE DATABASE Practica2

go 
--Cambiar de base de datos 
USE Practica2
go
CREATE TABLE tblCliente(
IdCliente int not null,
Nombre varchar(100) not null,
Direccion varchar(100) not null,
Tel varchar(100) not null,
 constraint pk_tblCliente 
 primary key(IdCliente), 
 constraint unique_Nombre 
 unique(Nombre)
 )
 go 
 CREATE TABLE tblEmpleado(
IdEmpleado int not null,
Nombre varchar(50) not null,
Apellidos varchar(80) not null,
Sexo char(1) not null,
Salario decimal(10,2) not null,
 constraint pk_tblEmpleado 
 primary key(IdEmpleado), 
 constraint chk_Salario
check(Salario>400 and Salario<=50000)
 )
 go 

 CREATE TABLE Venta(
IdVenta int not null,
Fecha date not null,
constraint fk_tblCliente_tblVenta
foreign key(IdCliente)
references tblCliente(IdCliente)
constraint fk_tblEmpleado_tblVenta
foreign key(IdEmpleado)
references tblEmpleado(IdEmpleado)




 )
 go

 drop table tblEmpleado

  CREATE TABLE tblEmpleado(
IdEmpleado int not null,
Nombre varchar(50) not null,
Apellidos varchar(80) not null,
Sexo char(1) not null,
Salario decimal(10,2) not null,
 constraint pk_tblEmpleado 
 primary key(IdEmpleado), 
 constraint chk_Salario
check(Salario>=400 and Salario<=50000)
 )
 go 
  CREATE TABLE Venta(
IdVenta int not null,
Fecha date not null,
IdCliente int not null,
IdEmpleado int not null,
constraint fk_tblCliente_tblVenta
foreign key(IdCliente)
references tblCliente(IdCliente),
constraint fk_tblEmpleado_tblVenta
foreign key(IdEmpleado)
references tblEmpleado(IdEmpleado)
 )
 go
 CREATE TABLE Producto(
IdProducto int not null,
Descripcion varchar(100) not null,
Existencia varchar(100) not null,
PrecioUnitario int not null,
 constraint unique_Descripcion
 unique(Descripcion)
 )
 go 

 CREATE TABLE DetalleVenta(
IdVenta int not null,
IdProducto int  not null,
Cantidad int not null,
Precio int not null,
constraint pk_DetalleVenta
Primary Key(IdVenta,IdProducto),
constraint fk_DetalleVenta_Venta
foreign key (IdVenta)
references Venta(IdVenta)


 

 )
 go

 drop table Venta
 drop table DetalleVenta
 drop table Venta
 drop table Producto

 CREATE TABLE tblVenta (
    IdVenta int not null,
    fecha DATE,
    IdCliente INT,
    IdEmpleado INT,
	constraint pk_Venta
	primary key(IdVenta),
    FOREIGN KEY (IdCliente) REFERENCES tblCliente(IdCliente),
    FOREIGN KEY (IdEmpleado) REFERENCES tblEmpleado(IdEmpleado)
)
go

CREATE TABLE tblDetalleVenta (
IdVenta int not null,
IdProducto int not null,
Cantidad int not null,
Precio decimal (10,2) not null,
constraint pk_DetallesVenta
primary key (IdVenta, IdProducto),
foreign key (IdVenta) references tblVenta(IdVenta),
)
go

CREATE TABLE tbl_Producto (
    IdProducto INT NOT NULL,
    Descripcion VARCHAR(200) NOT NULL,
    Existencia INT NOT NULL,
    Precio_Unitario DECIMAL(10,2) NOT NULL,
    IdVenta INT NOT NULL,
    IdEmpleado INT NOT NULL,
    CONSTRAINT pk_Producto PRIMARY KEY (IdProducto),
    CONSTRAINT fk_Venta FOREIGN KEY (IdVenta) REFERENCES tblVenta(IdVenta),
    
)
go
drop table tbl_Producto
drop table tblEmpleado 

drop table tblDetalleVenta
drop table tblDetalleVenta

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
constraint fk_tblCliente_tblVenta
foreign key(IdCliente)
references tblCliente(IdCliente)
constraint fk_tblEmpleado_tblVenta
foreign key(IdEmpleado)
references tblEmpleado(IdEmpleado)




 )
 go
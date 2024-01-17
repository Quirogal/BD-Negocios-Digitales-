--Practica #1
--Crear la Practica1

CREATE DATABASE Practica1

go 
--Cambiar de base de datos 
USE Practica1
go
CREATE TABLE tblContacto(
Idcontacto int not null,
nombre varchar(50) not null,
 constraint pk_tblContacto
 primary key(Idcontacto), 
 constraint unique_nombre 
 unique(nombre)
 )
 go 

 CREATE TABLE tblTelefono(
Idtelefono int not null,
NumeroTelefono varchar(10) not null,
Idcontacto int not null,
constraint pk_tblTelefono
primary key(Idtelefono),
constraint unique_NumeroTelefono
unique(NumeroTelefono),
constraint fk_tblTelefono_tblContacto
foreign key(Idcontacto)
references tblContacto(Idcontacto)
)
go
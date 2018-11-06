--Ensamble--
--Julio Armando Gastelum 
--Francisco Javier Valencia Espinoza 
--Luis Orlando Rodriguez Contreras 

--drop database Maquiladora4A;
--use master;
--CREATE DATABASE Maquiladora4A
--GO

USE Maquiladora4A
GO

create schema Produccion
go
create schema Product
go

--Product

create table Product.Product
(
	idProduct int primary key identity(1,1),
	idMarca int not null,
	idModelo int not null,
	nombre varchar (30) not null,
	precio money not null
)
go

--Produccion
--drop table Produccion
CREATE TABLE Produccion.Produccion
(
	produc_idProduccion int primary key not null,
	produc_nameProducion varchar(25) not null,
	produc_idProduct int FOREIGN KEY REFERENCES Product.Product(idProduct),
	Produc_Inicio DATE,
	produc_final DATE
	--produc_JefeProduccion INT FOREIGN KEY REFERENCES Person.Trabajador(idTrabajador)
)
GO

--drop table Area
--Area
CREATE TABLE Produccion.Area
(
	ar_idArea int primary key not null,
	ar_name varchar(25) not null,
	ar_idProduccion int not null,
	CONSTRAINT FK_Produccion FOREIGN KEY (ar_idProduccion) REFERENCES Produccion.Produccion(produc_idProduccion),
)
GO

--drop table Materiales
--Materiales
CREATE TABLE Produccion.Material
(
	ma_idMateriales int primary key not null,
	ma_name varchar(50) not null
)
GO
--

--Linea
CREATE TABLE Produccion.Linea
(
	lin_idLinea int primary key not null,
	lin_Name varchar(25) not null,
	lin_idArea int FOREIGN KEY REFERENCES Produccion.Area(ar_idArea),
	lin_idMateriales INT FOREIGN KEY REFERENCES Produccion.Material(ma_idMateriales)
)
GO

--ProCESO
--drop table Proceso
CREATE TABLE Produccion.Proceso
(
	produc_idProceso int primary key not null,
	produc_nameProceso varchar(25) not null,
	produc_idLinea INT FOREIGN KEY REFERENCES Produccion.Linea(lin_idLinea)
)
GO

CREATE TABLE Produccion.Detalle
(
	idDetalle INT PRIMARY KEY,
	detalle_Fecha DATE,
	detalle_Cantidad INT,
	detalle_idLinea INT FOREIGN KEY REFERENCES Produccion.Linea(lin_idLinea),

)


----drop table Empleado
----Empleado
--CREATE TABLE Empleado
--(
--	emp_idEmpleado int primary key not null,
--	emp_name varchar(25) not null,
--	emp_idLinea int not null,
--	emp_supervisor int,
--	emp_jefeDeLinea int,
--	CONSTRAINT FK_Linea_Empleado FOREIGN KEY (emp_idLinea) REFERENCES Linea(lin_idLinea),
	
--)
--GO


----Herencia Supervisor
--CREATE TABLE Supervisor
--(
--	emp_supervisor int primary key,
--	emp_supName varchar(25) not null,
--	CONSTRAINT FK_supervisor FOREIGN KEY (emp_supervisor) REFERENCES Empleado(emp_idEmpleado)
--)
--GO
----

----Herencia Jefe de linea
--CREATE TABLE JefeDeLinea
--(
--	emp_jefeDeLinea int primary key,
--	emp_jefName varchar(25) not null,
--	CONSTRAINT FK_JefeDeLinea FOREIGN KEY (emp_jefeDeLinea) REFERENCES Empleado(emp_idEmpleado)
--)
--GO

--Linea


--CREATE TABLE Product_Material
--(
--	idProducMaterial INT PRIMARY KEY,
--	idProduct INT FOREIGN KEY REFERENCES Product(idProducto),
--	idMateriales INT FOREIGN KEY REFERENCES Material(idMateriales)
--)

--drop table Marca
--Marca
--CREATE TABLE Marca
--(
--	mc_idMarca int primary key not null,
--	mc_name varchar(50) not null
--)
--GO

----Modelo
--CREATE TABLE Modelo
--(
--	mc_idModelo int primary key not null,
--	mc_name varchar(50) not null
--)
--GO

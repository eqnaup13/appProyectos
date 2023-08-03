USE master;
GO

DECLARE @dbName NVARCHAR(128) = 'ProyectosBD';

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = @dbName)
BEGIN
    CREATE DATABASE ProyectosBD
END

USE ProyectosBD

CREATE TABLE Estados(
	EstadoId INT NOT NULL IDENTITY,
	Descripcion NVARCHAR(45) NOT NULL
);

ALTER TABLE Estados
ADD CONSTRAINT PK_Estados PRIMARY KEY(EstadoId);

CREATE TABLE Proyectos(
	ProyectoId INT NOT NULL IDENTITY,
	Nombre NVARCHAR(100) NOT NULL,
	Descripcion NVARCHAR(150) NOT NULL,
	ProyectoPadre INT,
	EstadoId INT NOT NULL,
	FechaCreacion DATETIME2 NOT NULL,
	FechaActualizacion DATETIME2
);

ALTER TABLE Proyectos
ADD CONSTRAINT PK_Proyectos PRIMARY KEY(ProyectoId);

ALTER TABLE Proyectos
ADD CONSTRAINT FK_Proyecto_Estados_EstadoId FOREIGN KEY(EstadoId)
REFERENCES Estados(EstadoId) ON DELETE CASCADE;

/* DML - SENTENCIAS INSERT */
-- TABLA ESTADOS
INSERT INTO Estados(Descripcion) VALUES ('Nueva');
INSERT INTO Estados(Descripcion) VALUES ('En Progreso');
INSERT INTO Estados(Descripcion) VALUES ('En Revisión');
INSERT INTO Estados(Descripcion) VALUES ('Pruebas Unitarias');
INSERT INTO Estados(Descripcion) VALUES ('Cerrada');
INSERT INTO Estados(Descripcion) VALUES ('Rechazada');

-- DQL - SENTENCIAS SELECT 
SELECT * FROM Estados;

/* DML - SENTENCIAS INSERT */
--TABLA PROYECTOS
INSERT INTO Proyectos(Nombre,Descripcion,EstadoId,FechaCreacion) VALUES ('P-FRAMEWORK BI','Creación de la estructura de auditoría para BI',1,'2023-07-14 10:58:20');
INSERT INTO Proyectos(Nombre,Descripcion,EstadoId,FechaCreacion) VALUES ('P-Experiencia integral','Generación de ETL Fase I',1,'2022-04-25 17:02:35');
INSERT INTO Proyectos(Nombre,Descripcion,EstadoId,FechaCreacion) VALUES ('P-Tablero BI','Creación de Tableros BI',1,'2022-08-24 07:22:49');
INSERT INTO Proyectos(Nombre,Descripcion,EstadoId,FechaCreacion) VALUES ('P-Sueco educación superior','Proyecto para la Universidad',1,'2020-01-09 15:59:01');
INSERT INTO Proyectos(Nombre,Descripcion,EstadoId,FechaCreacion) VALUES ('P-Sueco Inventario','Proyecto para la Universidad',1,'2019-08-22 15:50:30');
INSERT INTO Proyectos(Nombre,Descripcion,EstadoId,FechaCreacion) VALUES ('P-Sueco Predial','Proyecto para la Universidad',5,'2020-08-31 10:51:42');
INSERT INTO Proyectos(Nombre,Descripcion,EstadoId,FechaCreacion) VALUES ('P-Sueco Nomina','Proyecto para la Universidad',1,'2020-11-02 23:57:58');
INSERT INTO Proyectos(Nombre,Descripcion,EstadoId,FechaCreacion) VALUES ('P-Sueco Transito','Proyecto para la Universidad',5,'2021-02-05 14:38:24');

-- DQL - SENTENCIAS SELECT
SELECT * FROM Proyectos;

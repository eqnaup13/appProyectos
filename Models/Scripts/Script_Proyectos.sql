
CREATE DATABASE ProyectosBD
GO

USE ProyectosBD
GO

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
	FechaCreacion DATETIME2 NOT NULL,
	FechaActualizacion DATETIME2,
	EstadoId INT NOT NULL
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
INSERT INTO Proyectos(Nombre,Descripcion,FechaCreacion,EstadoId) VALUES ('P-FRAMEWORK BI','Creación de la estructura de auditoría para BI','2023-07-14',1);
INSERT INTO Proyectos(Nombre,Descripcion,FechaCreacion,EstadoId) VALUES ('P-Experiencia integral','Generación de ETL Fase I','2022-04-25',1);
INSERT INTO Proyectos(Nombre,Descripcion,FechaCreacion,EstadoId) VALUES ('P-Tablero BI','Creación de Tableros BI','2022-08-24',1);
INSERT INTO Proyectos(Nombre,Descripcion,FechaCreacion,EstadoId) VALUES ('P-Sueco educación superior','Proyecto para la Universidad','2020-01-09',1);
INSERT INTO Proyectos(Nombre,Descripcion,FechaCreacion,EstadoId) VALUES ('P-Sueco Inventario','Proyecto para la Universidad','2019-08-22',1);
INSERT INTO Proyectos(Nombre,Descripcion,FechaCreacion,EstadoId) VALUES ('P-Sueco Predial','Proyecto para la Universidad','2020-08-31',5);
INSERT INTO Proyectos(Nombre,Descripcion,FechaCreacion,EstadoId) VALUES ('P-Sueco Nomina','Proyecto para la Universidad','2020-11-02',1);
INSERT INTO Proyectos(Nombre,Descripcion,FechaCreacion,EstadoId) VALUES ('P-Sueco Transito','Proyecto para la Universidad','2021-02-05',5);

-- DQL - SENTENCIAS SELECT
SELECT * FROM Proyectos;

TRUNCATE TABLE Proyectos;
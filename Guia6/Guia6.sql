-- Guia6

--USE HOTEL;
-- GO

-- Procedimiento Almacenado de Inserción para la Tabla "Paises"

CREATE PROCEDURE InsertarPais
    @NombrePais VARCHAR(60)
AS
BEGIN
    INSERT INTO Paises (Pais)
    VALUES (@NombrePais);
END;

EXEC InsertarPais 'Honduras';

select * from Paises;

--delete Paises where ID_Pais > 5;

-- Procedimiento Almacenado de Consulta con Operación JOIN

CREATE PROCEDURE ConsultarEmpleadosYCargos
AS
BEGIN
    SELECT E.Nombre, E.Apellido, C.Cargo
    FROM Empleados E
    INNER JOIN Cargos C ON E.ID_Cargo = C.ID_Cargo;
END;


EXEC ConsultarEmpleadosYCargos;

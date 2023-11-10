--Guia 9
USE Hotel;

-- Consulta de tablas
SELECT
    R.ID_Resevacion,
    R.FechaEntrada,
    R.FechaSalida,
    C.NombreCaliente AS NombreHuesped,
    C.ApellidoCliente AS ApellidoHuesped,
    H.NumHabitacion,
    H.TipoHabitacion
FROM Reservacion R
INNER JOIN Clientes C ON R.ID_Cliente = C.ID_Cliente
INNER JOIN Habitaciones H ON R.ID_Habitacion = H.ID_Habitacion;

select * from Reservacion;

-- Creación de la Vista
CREATE VIEW VistaReservaciones AS
SELECT
    R.ID_Resevacion,
    R.FechaEntrada,
    R.FechaSalida,
    C.NombreCaliente AS NombreHuesped,
    C.ApellidoCliente AS ApellidoHuesped,
    H.NumHabitacion,
    H.TipoHabitacion
FROM Reservacion R
INNER JOIN Clientes C ON R.ID_Cliente = C.ID_Cliente
INNER JOIN Habitaciones H ON R.ID_Habitacion = H.ID_Habitacion;

-- Consulta de la Vista
SELECT * FROM VistaReservaciones;

-- Borrar la Vista
DROP VIEW VistaReservaciones;

-- Consultar vistas en el sistema
SELECT *
FROM INFORMATION_SCHEMA.VIEWS
WHERE TABLE_SCHEMA = 'dbo';

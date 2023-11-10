-- GUIA 7

USE Hotel;

-- Crear la tabla Facturacion
CREATE TABLE Facturacion (
    ID_Factura int PRIMARY KEY IDENTITY(1, 1),
    ID_Reservacion int, -- FK para relacionar con la tabla Reservacion
    MontoTotal decimal(10, 2) NOT NULL,
    FechaFacturacion date NOT NULL,
    HoraFacturacion time NOT NULL,
);

-- Insertar datos de prueba en la tabla Facturacion
INSERT INTO Facturacion (ID_Reservacion, MontoTotal, FechaFacturacion, HoraFacturacion)
VALUES
(1, 500.00, '2023-11-20', '14:30:00'),
(2, 400.00, '2023-12-15', '12:45:00'),
(3, 300.00, '2023-07-10', '11:15:00'),
(4, 600.00, '2023-12-30', '15:00:00'),
(5, 250.00, '2023-04-17', '09:30:00');

-- Crear una tabla de Facturaci�n
CREATE TABLE Facturacion (
    ID_Factura int PRIMARY KEY IDENTITY(1, 1),
    ID_Reservacion int, -- FK para relacionar con la tabla Reservacion
    MontoTotal decimal(10, 2) NOT NULL,
    FechaFacturacion date NOT NULL,
    HoraFacturacion time NOT NULL
);

-- Procedimiento almacenado para actualizar el MontoTotal en Facturacion
CREATE PROCEDURE ActualizarMontoFacturacion
    @ReservacionID int,
    @NuevoMonto decimal(10, 2)
AS
BEGIN
    UPDATE Facturacion
    SET MontoTotal = @NuevoMonto
    WHERE ID_Reservacion = @ReservacionID;
END;
GO

CREATE TRIGGER trg_ActualizarFacturacion
ON Facturacion
AFTER UPDATE
AS
BEGIN
    PRINT 'se ha actualizado la tabla Facturacion.';
END;
GO

-- Probar el trigger ejecutando el procedimiento almacenado
-- actualizando el MontoTotal para una reservaci�n con ID_Reservacion = 1
EXEC ActualizarMontoFacturacion @ReservacionID = 1, @NuevoMonto = 550.00;

select* from Facturacion;
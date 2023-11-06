-- Guia5

-- USE Hotel;
-- go

--  funci�n escalar para calcular el precio total de una reserva
CREATE FUNCTION CalcularPrecioTotalReserva (@ID_Reservacion INT)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @PrecioTotal DECIMAL(10, 2);
    SELECT @PrecioTotal = SUM(ph.Precio)
    FROM PrecioHabitaciones ph
    WHERE ph.ID_Habitacion = (
        SELECT r.ID_Habitacion
        FROM Reservacion r
        WHERE r.ID_Resevacion = @ID_Reservacion
    );
    RETURN @PrecioTotal;
END;

-- funci�n de tabla que devuelve una lista de empleados con sus nombres y n�meros de tel�fono
CREATE FUNCTION ObtenerEmpleadosConTelefonos ()
RETURNS TABLE
AS
RETURN (
    SELECT e.Nombre, e.Apellido, e.Telefono
    FROM Empleados e
);



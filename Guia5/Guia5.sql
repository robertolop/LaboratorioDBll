-- Guia5

-- USE Hotel;
-- go

--  función escalar para calcular el precio total de una reserva
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

-- función de tabla que devuelve una lista de empleados con sus nombres y números de teléfono
CREATE FUNCTION ObtenerEmpleadosConTelefonos ()
RETURNS TABLE
AS
RETURN (
    SELECT e.Nombre, e.Apellido, e.Telefono
    FROM Empleados e
);



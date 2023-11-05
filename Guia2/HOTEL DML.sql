-- Base de Datos Hotel
-- DML
use Hotel;
go
-- DIRECCIONES
-- Países
INSERT INTO Paises (Pais)
VALUES
('El Salvador'),
('Estados Unidos'),
('México'),
('Canadá'),
('España');
select * from Paises;

-- Departamentos
INSERT INTO Departamentos (ID_Pais, Departamento)
VALUES
(1, 'San Salvador'),
(1, 'Santa Ana'),
(2, 'California'),
(3, 'Ciudad de México'),
(4, 'Ontario');
select * from Departamentos;

-- Municipios
INSERT INTO Municipios (ID_Departamento, Municipio)
VALUES
(1, 'San Salvador'),
(1, 'Santa Tecla'),
(2, 'Santa Ana'),
(3, 'Los Angeles'),
(4, 'Ciudad de México');
select * from Municipios;

-- Distritos
INSERT INTO Distritos (ID_Municipio, Distrito)
VALUES
(1, 'Centro Histórico'),
(1, 'Zona Rosa'),
(3, 'Downtown LA'),
(4, 'Polanco'),
(5, 'Coyoacán');
select * from Distritos;

-- Direcciones
INSERT INTO Direcciones (ID_Distrito, CP)
VALUES
(1, '1010'),
(2, '1020'),
(3, '90001'),
(4, '11560'),
(5, '04100');
select * from Direcciones;

-- Cargos
INSERT INTO Cargos (Cargo)
VALUES
('SysAdmin'),
('RRHH'),
('Recepcionista'),
('Gerente'),
('Contador');
select * from Cargos;

-- HorarioTrabajos
INSERT INTO HorarioTrabajos (ID_Cargo, HoraEntrabajo, HoraSalida)
VALUES
(1, 8, 16),
(2, 9, 17),
(3, 9, 18),
(4, 12, 20),
(5, 7, 15);
select * from HorarioTrabajos;

-- Empleados
INSERT INTO Empleados (ID_Direccion, ID_HorarioTrabajo, Nombre, Apellido, Telefono, DUI)
VALUES
(1, 1, 'Juan', 'Pérez', '12345678', '12345678-1'),
(2, 2, 'Ana', 'González', '23456789', '23456789-2'),
(3, 3, 'Carlos', 'López', '34567890', '34567890-3'),
(4, 4, 'Laura', 'Martínez', '45678901', '45678901-4'),
(5, 5, 'Pedro', 'Ramírez', '56789012', '56789012-5');
select * from Empleados;

-- TarjetaCreditos
INSERT INTO TarjetaCreditos (NumTarjetaCred)
VALUES
('1234 5678 9012 3456'),
('9876 5432 1098 7654'),
('6543 2109 8765 4321'),
('3456 7890 1234 5678'),
('2109 8765 4321 9876');
select * from TarjetaCreditos;

-- TarjetaDebitos
INSERT INTO TarjetaDebitos (NumTarjetaDeb)
VALUES
('1111 2222 3333 4444'),
('2222 3333 4444 5555'),
('3333 4444 5555 6666'),
('4444 5555 6666 7777'),
('5555 6666 7777 8888');
select * from TarjetaDebitos;

-- Clientes
INSERT INTO Clientes (ID_TarjDebito, ID_TarjCredito, ID_Direccion, NombreCaliente, ApellidoCliente, TelelefonoCliente, DUICliente)
VALUES
(6, 5, 1, 'María', 'López', '78901234', '67890123-6'),
(7, 6, 2, 'Roberto', 'García', '89012345', '78901234-7'),
(8, 7, 3, 'Sofía', 'Hernández', '90123456', '89012345-8'),
(9, 8, 4, 'Manuel', 'Rodríguez', '01234567', '90123456-9'),
(10, 9, 5, 'Elena', 'Sánchez', '12345678', '01234567-0');
select * from Clientes;

-- Temporadas
INSERT INTO Temporadas (Temporada, FechaInicio, fechaFinal, Descuesto)
VALUES
('Temporada Alta', '2023-12-01', '2023-12-31', '10% de descuento'),
('Temporada Baja', '2023-06-01', '2023-08-31', '20% de descuento'),
('Temporada de Verano', '2023-07-01', '2023-08-15', '15% de descuento'),
('Temporada de Navidad', '2023-12-24', '2023-12-31', '25% de descuento'),
('Temporada de Semana Santa', '2023-04-10', '2023-04-16', '30% de descuento');
select * from Temporadas;
-- Habitaciones
INSERT INTO Habitaciones (TipoHabitacion, Precio, Cama, NumHabitacion)
VALUES
('Doble', 120.00, '2 camas individuales', '101'),
('Individual', 90.00, '1 cama doble', '102'),
('Suite de Lujo', 200.00, '1 cama king-size', '103'),
('Familiar', 150.00, '2 camas dobles', '104'),
('Estándar', 80.00, '1 cama individual', '105');
select * from Habitaciones;
-- PrecioHabitaciones
INSERT INTO PrecioHabitaciones (ID_Temporada, ID_Habitacion, Precio)
VALUES
(1, 1, 150.00),
(2, 1, 120.00),
(1, 2, 110.00),
(3, 3, 220.00),
(4, 4, 180.00);
select * from PrecioHabitaciones;

-- TipoPagos
INSERT INTO TipoPagos (TipoPago)
VALUES
('Tarjeta de Crédito'),
('Tarjeta de Débito'),
('Efectivo'),
('PayPal'),
('Transferencia Bancaria');
select * from TipoPagos;

-- Reservacion
INSERT INTO Reservacion (ID_Cliente, ID_Habitacion, ID_Temporada, ID_TipoPago, FechaEntrada, FechaSalida, HoraEntrada, HoraSalida)
VALUES
(4, 1, 1, 1, '2023-11-15', '2023-11-20', '15:00:00', '12:00:00'),
(5, 2, 2, 2, '2023-12-10', '2023-12-15', '14:00:00', '11:00:00'),
(6, 3, 3, 3, '2023-07-05', '2023-07-10', '12:00:00', '10:00:00'),
(7, 4, 4, 4, '2023-12-25', '2023-12-30', '16:00:00', '13:00:00'),
(8, 5, 5, 5, '2023-04-12', '2023-04-17', '13:00:00', '10:00:00');
select * from Reservacion;


-- Realizar 5 consultas de tipo Multitabla, Subconsulta y Joins sobre la Base de Datos.

-- Encontrar empleados que tienen números de teléfono válidos:
SELECT Nombre, Apellido, Telefono
FROM Empleados
WHERE Telefono LIKE '______%'; -- Filtra los números de teléfono con al menos 6 dígitos

-- Consultar los nombres de los empleados que trabajan en el Distrito "Centro Histórico":
SELECT e.Nombre, e.Apellido
FROM Empleados e
INNER JOIN Direcciones d ON e.ID_Direccion = d.ID_Direccion
INNER JOIN Distritos di ON d.ID_Distrito = di.ID_Distrito
WHERE di.Distrito = 'Centro Histórico';

-- Consultar las temporadas en las que se ha realizado una reserva para una habitación individual con precio superior a $100:

SELECT t.Temporada, r.FechaEntrada, r.FechaSalida
FROM Temporadas t
INNER JOIN Reservacion r ON t.ID_Temporada = r.ID_Temporada
INNER JOIN Habitaciones h ON r.ID_Habitacion = h.ID_Habitacion
WHERE h.TipoHabitacion = 'Suite de Lujo' AND h.Precio > 100;

-- Consultar los nombres de los clientes que han realizado reservas en temporadas de descuento:
SELECT c.NombreCaliente, c.ApellidoCliente
FROM Clientes c
INNER JOIN Reservacion r ON c.ID_Cliente = r.ID_Cliente
INNER JOIN Temporadas t ON r.ID_Temporada = t.ID_Temporada
WHERE t.Descuesto IS NOT NULL;

-- Consultar los nombres de los empleados que trabajan en la misma dirección que un cliente llamado 'María López':
SELECT e.Nombre, e.Apellido
FROM Empleados e
INNER JOIN Direcciones d ON e.ID_Direccion = d.ID_Direccion
WHERE d.ID_Direccion IN (
    SELECT d2.ID_Direccion
    FROM Clientes c
    INNER JOIN Direcciones d2 ON c.ID_Direccion = d2.ID_Direccion
    WHERE c.NombreCaliente = 'María' AND c.ApellidoCliente = 'López'
);





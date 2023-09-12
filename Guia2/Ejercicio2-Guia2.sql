-- GUIA 2 TERMINADA

-- Inserciones en la tabla Departamentos
INSERT INTO Departamentos (Departamento, Pais)
VALUES
    ('Ahuachapan', 'El salvador'),
    ('Sonsonate', 'El salvador'),
    ('Santa Ana', 'El salvador'),
    ('Cabañas', 'El salvador'),
    ('Morazan', 'El salvador');

-- Inserciones en la tabla Municipios
INSERT INTO Municipios (Municipio, ID_Departamento)
VALUES
    ('Ataco', 1),
    ('Apaneca', 1),
    ('Juayua', 2),
    ('Cara Sucia', 2),
    ('Cacaopera', 3);

-- Inserciones en la tabla Distritos
INSERT INTO Distritos (Distrito, ID_Municipio)
VALUES
    ('Atiquizaya', 1),
    ('San Lorenzo', 1),
    ('San Pedro Puxtla', 2),
    ('San francisco Menendez', 2),
    ('Turin', 3);

-- Inserciones en la tabla Direcciones
INSERT INTO Direcciones (Linea1, Linea2, ID_Distrito, CodigoPostal)
VALUES
    ('123 Calle Principal', 'Colonia Flores', 1, 1001),
    ('456 Avenida Secundaria', 'Colonia Primavera', 1, 1002),
    ('789 Calle Maria', 'Colonia San José', 2, 2001),
    ('1011 Calle del Centro', 'Colonia Moderna', 2, 2002),
    ('1314 Avenida Principal', 'Colonia Central', 3, 3001);


-- Inserciones en la tabla Habitaciones

INSERT INTO Habitaciones (Numero, Piso, Descripcion, Caracteristicas, Precio_diario, Estado, Tipo_habitacion)
VALUES
    ('101', '1', 'Habitación 101', 'WiFi gratuito, cama doble, baño privado', 100.00, 'Disponible', 'Doble'),
    ('102', '1', 'Habitación 102', 'WiFi gratuito, TV de pantalla plana, cama doble, baño privado', 110.00, 'Disponible', 'Doble'),
    ('201', '5', 'Habitación 201', 'TV de pantalla plana, cama doble, baño privado', 120.00, 'Ocupada', 'Doble'),
    ('202', '4', 'Habitación 202', 'WiFi gratuito, TV de pantalla plana, cama doble, baño privado', 130.00, 'No Disponible', 'Doble'),
    ('301', '3', 'Habitación 301', 'WiFi gratuito, TV de pantalla plana, cama individual, baño privado,Barra Libre,Cine', 140.00, 'Disponible', 'Individual');


-- Inserciones en la tabla personas
INSERT INTO personas (ID_Direccion, Nombre, Amaterno, Apaterno, Tipo_documento, Num_documento, Direccion, Telefono, Email)
VALUES

    (1, 'Juan', 'Ramirez', 'Perez', 'DNI', '12345678', 'Calle Principal 123', '123456789', 'correo1@example.com'),
    (2, 'Vanesa', 'Garcia', 'Molina', 'DNI', '23456789', 'Avenida Secundaria 456', '234567890', 'correo2@example.com'),
    (3, 'Thomas', 'Padilla', 'Kane', 'DNI', '34567890', 'Calle Ejemplo 789', '345678901', 'correo3@example.com'),
    (4, 'Paola', 'Rossi', 'Di Marco', 'DNI', '45678901', 'Calle del Centro 1011', '456789012', 'correo4@example.com'),
    (5, 'Lionel', 'Andres', 'Messi', 'DNI', '56789012', 'Avenida Principal 1314', '567890123', 'correo5@example.com');


-- Inserciones en la tabla Clientes
-- Inserciones en la tabla Clientes
INSERT INTO Clientes (ID_Persona, codigo_cliente)
VALUES
    (1, 'C001'),
    (2, 'C002'),
    (3, 'C003'),
    (4, 'C004'),
    (5, 'C005');

-- Inserciones en la tabla Trabajadores
INSERT INTO Trabajadores (ID_Persona, sueldo, acceso, login, password, estado)
VALUES
    (1, 2000.00, 'Acceso1', 'Login1', 'Password1', 'Activo'),
    (2, 2100.00, 'Acceso2', 'Login2', 'Password2', 'Activo'),
    (3, 2200.00, 'Acceso3', 'Login3', 'Password3', 'Activo'),
    (4, 2300.00, 'Acceso4', 'Login4', 'Password4', 'Inactivo'),
    (5, 2400.00, 'Acceso5', 'Login5', 'Password5', 'Activo');

-- Inserciones en la tabla Productos
INSERT INTO Productos (nombre, descripcion, unidad_medida, precio_venta)
VALUES
    ('Pilsener', 'Bebida Alcoholica', '6', 10.00),
    ('Vino', 'Bebida Alcoholica', '2', 20.00),
    ('Wisky', 'Bebida Alcoholica', '3', 30.00),
    ('coca-cola', 'Bebida carbonatada', '4', 40.00),
    ('Vodka', 'Bebida Alcoholica', '3', 50.00);


-- Inserciones en la tabla reservas con datos ficticios
INSERT INTO reservas (ID_Habitacion, ID_Cliente, ID_Trabajador, tipo_reserva, fecha_reserva, fecha_ingreso, fecha_salida, costo_alojamiento, estado)
VALUES
    (1, 1, 1, 'Suit Normal', '2023-09-10', '2023-09-12', '2023-09-15', 200.00, 'Activa'),
    (2, 2, 2, 'Suit Normal', '2023-09-11', '2023-09-14', '2023-09-17', 220.00, 'Activa'),
    (3, 3, 3, 'Suit Normal', '2023-09-12', '2023-09-13', '2023-09-16', 180.00, 'Activa'),
    (4, 4, 4, 'Suit Presidencial', '2023-09-13', '2023-09-16', '2023-09-19', 240.00, 'Ocupada'),
    (5, 5, 5, 'Suit Normal', '2023-09-14', '2023-09-17', '2023-09-20', 260.00, 'Activa');



---Realizar 5 consultas (normales) que incluya operadores aritméticos o lógicos, obtención de datos del sistema, así como cálculos aritméticos sobre cualquier tabla de la Base de Datos.
--1
SELECT SUM(costo_alojamiento) as Costo_Total
FROM reservas
WHERE costo_alojamiento > 200;
--2
SELECT *
FROM Habitaciones
WHERE Estado = 'No Disponible';
--3
SELECT *
FROM Habitaciones
WHERE Estado = 'Disponible';
--4
SELECT Municipio
FROM Municipios
WHERE ID_Departamento = 2;

--5
SELECT *
FROM Habitaciones
WHERE Precio_diario >= 100.00;

--Realizar 5 consultas de tipo Multitabla, Subconsulta y Joins sobre la Base de Datos
--1
SELECT c.Nombre AS NombreCliente, d.Departamento
FROM Clientes cl
JOIN personas c ON cl.ID_Persona = c.ID_Persona
JOIN Direcciones dir ON c.ID_Direccion = dir.ID_Direccion
JOIN Distritos dist ON dir.ID_Distrito = dist.ID_Distrito
JOIN Municipios m ON dist.ID_Municipio = m.ID_Municipio
JOIN Departamentos d ON m.ID_Departamento = d.ID_Departamento;

--2
SELECT c.Nombre AS NombreCliente, SUM(r.costo_alojamiento) AS CostoTotalAlojamiento
FROM reservas r
JOIN Clientes cl ON r.ID_Cliente = cl.ID_Cliente
JOIN personas c ON cl.ID_Persona = c.ID_Persona
WHERE cl.ID_Cliente = 3
GROUP BY c.Nombre;

--3
SELECT h.Numero AS NumeroHabitacion, c.Nombre AS NombreCliente, r.fecha_ingreso
FROM reservas r
JOIN Habitaciones h ON r.ID_Habitacion = h.ID_Habitacion
JOIN Clientes cl ON r.ID_Cliente = cl.ID_Cliente
JOIN personas c ON cl.ID_Persona = c.ID_Persona
WHERE r.estado = 'Ocupada';

--4
SELECT d.Departamento, AVG(t.sueldo) AS SueldoPromedio
FROM Trabajadores t
JOIN personas p ON t.ID_Persona = p.ID_Persona
JOIN Direcciones dir ON p.ID_Direccion = dir.ID_Direccion
JOIN Distritos dist ON dir.ID_Distrito = dist.ID_Distrito
JOIN Municipios m ON dist.ID_Municipio = m.ID_Municipio
JOIN Departamentos d ON m.ID_Departamento = d.ID_Departamento
GROUP BY d.Departamento;

--5
SELECT t.ID_Trabajador, COUNT(r.ID_Reserva) AS TotalReservas
FROM Trabajadores t
JOIN reservas r ON t.ID_Trabajador = r.ID_Trabajador
GROUP BY t.ID_Trabajador;

-- Guia 8
USE Hotel;

-- Crear la tabla Facturacion con la llave primaria basada en la secuencia
create table Facturacion (
    ID_Factura int primary key,
	 ID_Reservacion int,
    MontoTotal decimal(10, 2) not null,
    FechaFacturacion date not null,
    HoraFacturacion time not null
);
-- Crear una secuencia para la llave primaria de Facturacion
create sequence ID_Factura
    start with 1
    increment by 1
    minvalue 1
    maxvalue 99999999;

-- Consultar las secuencias existentes
select * from sys.sequences;

-- Consultar valor actual de la secuencia
select current_value from sys.sequences where name = 'ID_Factura';

-- Consultar siguiente valor de la secuencia
select next value for ID_Factura as next_value;

-- Borrar secuencia
drop sequence ID_Factura;
	
select * from Facturacion;
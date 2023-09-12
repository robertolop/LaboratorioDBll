create database Hotel;
use Hotel;

--Guia 1 terminada
-- Tablas

create table Departamentos(
	ID_Departamento int primary key identity(1, 1),
	Departamento varchar(60) not null,
	Pais varchar(60)
);


create table Municipios(
	ID_Municipio int primary key identity(1, 1),
	Municipio varchar(60) not null,
	ID_Departamento int not null
);
alter table Municipios add foreign key (ID_Departamento) references Departamentos(ID_Departamento);

create table Distritos(
	ID_Distrito int identity(1,1) primary key,
	Distrito varchar(60) not null,
	ID_Municipio int not null
);
alter table Distritos add foreign key (ID_Municipio) references Municipios(ID_Municipio);
alter table Direcciones add foreign key (ID_Distrito) references Distritos(ID_Distrito);

create table Direcciones(
	ID_Direccion int primary key identity(1, 1),
    Linea1 varchar(100) not null,
    Linea2 varchar(100) not null,
    ID_Distrito int not null,
    CodigoPostal int not null
);
-------------------------------------------------------------------------------------------------------------------------------------
-- Tabla `habitacion`
create table Habitaciones (
  ID_Habitacion int primary key identity(1, 1),
  Numero VARCHAR(255) not null,
  Piso VARCHAR(255) not null ,
  Descripcion VARCHAR(255) not null,
  Caracteristicas VARCHAR(512) not null,
  Precio_diario DECIMAL(7,2) not null,
  Estado VARCHAR(15) not null,
  Tipo_habitacion VARCHAR(20) not null
);
-- Tabla `persona`
create table personas (
  ID_Persona int primary key identity(1, 1),
  ID_Direccion int not null, --fk
  Nombre VARCHAR(100) not null,
  Amaterno VARCHAR(100) not null,
  Apaterno VARCHAR(100) not null,
  Tipo_documento VARCHAR(100) not null,
  Num_documento VARCHAR(100) not null,
  Direccion VARCHAR(100) not null,
  Telefono VARCHAR(100) not null,
  Email VARCHAR(100) not null
);
alter table personas add foreign key (ID_Direccion) references Direcciones(ID_Direccion);

-- Tabla `cliente`
create table Clientes (
  ID_Cliente int primary key identity(1, 1),
 ID_Persona int not null, --fk
  codigo_cliente VARCHAR(100) not null
);
alter table Clientes add foreign key (ID_Persona) references personas(ID_Persona);


-- Tabla `trabajador`
create table Trabajadores (
 ID_Trabajador int primary key identity(1, 1),
 ID_Persona int not null, --fk
  sueldo DECIMAL(10,2) not null,
  acceso VARCHAR(100) not null,
  login VARCHAR(100) not null,
  password VARCHAR(200) not null,
  estado VARCHAR(100) not null
 );
 alter table Trabajadores add foreign key (ID_Persona) references personas(ID_Persona);

-- Tabla `producto`
create table Productos (
  ID_Producto int primary key identity(1, 1),
  nombre VARCHAR(100) not null,
  descripcion VARCHAR(255) not null,
  unidad_medida VARCHAR(100) not null,
  precio_venta DECIMAL(10,2) not null
);


-- Tabla `reserva`
create table reservas (
  ID_Reserva int primary key identity(1, 1),
  ID_Habitacion INT not null, --fk
  ID_Cliente INT not null,    --fk
  ID_Trabajador INT not null,  --fk
  tipo_reserva VARCHAR(100)not null,
  fecha_reserva DATE not null,
  fecha_ingreso DATE not null,
  fecha_salida DATE not null,
  costo_alojamiento DECIMAL(10,2) not null,
  estado VARCHAR(100) not null
);
 alter table reservas add foreign key (ID_Habitacion) references Habitaciones(ID_Habitacion);
  alter table reservas add foreign key (ID_Cliente) references Clientes(ID_Cliente);
   alter table reservas add foreign key (ID_Trabajador) references Trabajadores(ID_Trabajador);


-- Tabla `consumo`
CREATE TABLE Consumos (
  ID_Consumo int primary key identity(1, 1),
  ID_Reserva INT  not null, --fk
  ID_Producto INT  not null, --fk
  cantidad DECIMAL(10,2)  not null,
  precio_venta DECIMAL(10,2) not null,
  estado VARCHAR(100)  not null
 );
    alter table Consumos add foreign key (ID_Reserva) references reservas(ID_Reserva);
	   alter table Consumos add foreign key (ID_Producto) references Productos(ID_Producto);


-- Tabla `pago`
CREATE TABLE Pagos (
  ID_Pago int primary key identity(1, 1),
  ID_Reserva INT not null,  --fk
  tipo_comprobante VARCHAR(100) not null,
  num_comprobante VARCHAR(20) not null,
  igv DECIMAL(10,2) not null,
  total_pago DECIMAL(10,2) not null,
  fecha_emision DATE not null,
  fecha_pago DATE not null
 );
    alter table Pagos add foreign key (ID_Reserva) references reservas(ID_Reserva);

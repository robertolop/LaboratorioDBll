create database Hotel;
go
use Hotel;

create table Paises(
ID_Pais int primary key identity(1, 1),
Pais varchar (60) not null,
);

create table Departamentos(
ID_Departamento int primary key identity(1, 1),
ID_Pais int, --fk
Departamento varchar (120) not null

);

create table Municipios (
ID_Municipio int primary key identity(1, 1),
ID_Departamento int, --fk
Municipio varchar (60) not null
);

create table Distritos (
ID_Distrito int primary key identity(1, 1),
ID_Municipio int, --fk
Distrito varchar (60)
);

create table Direcciones(
ID_Direccion int primary key identity(1, 1),
ID_Distrito int, --fk
CP varchar (60)
);

create table Cargos(
ID_Cargo int primary key identity(1, 1),
Cargo varchar (60) not null
);

create table HorarioTrabajos(
ID_HorarioTrabajo int primary key identity(1, 1),
ID_Cargo int, --fk
HoraEntrabajo int,
HoraSalida int
);

create table Empleados(
ID_Empleado int primary key identity(1, 1),
ID_Direccion int, --fk
ID_HorarioTrabajo int, --fk
Nombre varchar (60) not null,
Apellido varchar (60) not null,
Telefono varchar (60) not null,
DUI varchar (60) not null,
);
--ALTER TABLE Empleados
--ADD ID_Cargo INT
-- ALTER TABLE Empleados
-- ADD CONSTRAINT FK_Cargo_Empleado
-- FOREIGN KEY (ID_Cargo) REFERENCES Cargos(ID_Cargo);
-- MANEJO DE ROLES

create table Usuarios (
    ID_Usuario int primary key identity(1, 1),
    ID_Rol int,
    ID_Empleado int,
    Usuario varchar(60) NOT NULL,
    Clave varchar(60) NOT NULL,
    foreign key (ID_Rol) references Roles(ID_Rol),
    foreign key (ID_Empleado) references Empleados(ID_Empleado)
);

create table Roles (
    ID_Rol int primary key identity(1, 1),
    NombreRol varchar(60) NOT NULL
);

create table Opciones (
    ID_Opcion int primary key identity(1, 1),
    NombreOpcion varchar(60) NOT NULL
);

create table Permisos (
    ID_Permiso int primary key identity(1, 1),
    ID_Opcion int,
    ID_Rol int,
    foreign key (ID_Opcion) references Opciones(ID_Opcion),
   foreign key(ID_Rol) references Roles(ID_Rol)
);

create table TarjetaCreditos(
ID_TarjCredito int primary key identity(1, 1),
NumTarjetaCred int not null,
);
alter table TarjetaCreditos
alter column NumTarjetaCred varchar(20);

create table TarjetaDebitos(
ID_TarjDebito int primary key identity(1, 1),
NumTarjetaDeb int not null
);
alter table TarjetaDebitos
alter column NumTarjetaDeb varchar(20);

create table Clientes(
ID_Cliente  int primary key identity(1, 1),
ID_TarjDebito int, --fk
ID_TarjCredito int, --fk
ID_Direccion int, --fk
NombreCaliente varchar (60) not null,
ApellidoCliente varchar (60) not null,
TelelefonoCliente varchar (60) not null,
DUICliente varchar (60) not null
);

create table Temporadas(
ID_Temporada  int primary key identity(1, 1),
Temporada varchar (60) not null,
FechaInicio date,
fechaFinal date,
Descuesto varchar (60) not null
);

create table Habitaciones (
  ID_Habitacion int primary key identity(1, 1),
 TipoHabitacion varchar (60) not null,
 Precio decimal (10,2) not null,
 Cama varchar (100) not null,
 NumHabitacion varchar (60) not null,
);

create table PrecioHabitaciones(
ID_Temporada int, --fk
ID_Habitacion int, --fk
Precio decimal (10,2) not null
);

create table TipoPagos (
ID_TipoPago int primary key identity(1, 1),
TipoPago varchar (60) not null
);

create table Reservacion (
ID_Resevacion int primary key identity(1, 1),
ID_Cliente int, --fk
ID_Habitacion int,
ID_Temporada int,
ID_TipoPago int,
FechaEntrada date,
FechaSalida date,
HoraEntrada time,
HoraSalida time
);

-- Agregar restricciones de clave externa a la tabla Departamentos
alter table Departamentos
add constraint FK_Pais_Departamento
FOREIGN KEY (ID_Pais) references Paises(ID_Pais);

-- Agregar restricciones de clave externa a la tabla Municipios
alter table Municipios
add constraint FK_Departamento_Municipio
foreign key (ID_Departamento) references Departamentos(ID_Departamento);

-- Agregar restricciones de clave externa a la tabla Distritos
alter table Distritos
add constraint FK_Municipio_Distrito
foreign key (ID_Municipio) references Municipios(ID_Municipio);

-- Agregar restricciones de clave externa a la tabla Direcciones
alter table Direcciones
add constraint FK_Distrito_Direccion
foreign key (ID_Distrito) references Distritos(ID_Distrito);

-- Agregar restricciones de clave externa a la tabla HorarioTrabajos
alter table HorarioTrabajos
add constraint FK_Cargo_HorarioTrabajo
foreign key (ID_Cargo) references Cargos(ID_Cargo);

-- Agregar restricciones de clave externa a la tabla Empleados
alter table Empleados
add constraint FK_Direccion_Empleado
foreign key (ID_Direccion) references Direcciones(ID_Direccion);

alter table Empleados
add constraint FK_HorarioTrabajo_Empleado
foreign key (ID_HorarioTrabajo) references HorarioTrabajos(ID_HorarioTrabajo);

-- Agregar restricciones de clave externa a la tabla Clientes
alter table Clientes
add constraint FK_TarjetaDebito_Cliente
foreign key (ID_TarjDebito) references TarjetaDebitos(ID_TarjDebito);

alter table Clientes
add constraint FK_TarjetaCredito_Cliente
foreign key (ID_TarjCredito) references TarjetaCreditos(ID_TarjCredito);

alter table Clientes
add constraint FK_Direccion_Cliente
foreign key (ID_Direccion) references Direcciones(ID_Direccion);

-- Agregar restricciones de clave externa a la tabla PrecioHabitaciones
alter table PrecioHabitaciones
add constraint FK_Temporada_PrecioHabitacion
foreign key (ID_Temporada) references Temporadas(ID_Temporada);

alter table PrecioHabitaciones
add constraint FK_Habitacion_PrecioHabitacion
foreign key (ID_Habitacion) references Habitaciones(ID_Habitacion);

-- Agregar restricciones de clave externa a la tabla Reservacion
alter table Reservacion
add constraint FK_Cliente_Reservacion
foreign key (ID_Cliente) references Clientes(ID_Cliente);

alter table Reservacion
add constraint FK_Habitacion_Reservacion
foreign key (ID_Habitacion) references Habitaciones(ID_Habitacion);

alter table Reservacion
add constraint FK_Temporada_Reservacion
foreign key (ID_Temporada) references Temporadas(ID_Temporada);

alter table Reservacion
add constraint FK_TipoPago_Reservacion
foreign key (ID_TipoPago) references TipoPagos(ID_TipoPago);

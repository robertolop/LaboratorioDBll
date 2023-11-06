-- Base de Datos Hotel
-- DCL
use Hotel;

-- ROLES
go
create role Administrador;
create role Recepcionista;
create role Gerente;
create role RRHH;
create role Contador;

-- LOGINS
go
create login login_admin_juanperez
with password = 'root';
go
create login login_rrhh_anagonzales
with password = 'Gonzales1234';
go
create login login_recep_carloslopez
with password = 'Lopez1234';
go
create login login_ger_lauramartinez
with password = 'Martinez1234';
go
create login login_cont_pedroramirez
with password = 'Ramirez1234';

-- USUARIOS
go
create user admin_juanperez
for login login_admin_juanperez;
go
create user rrhh_anagonzales
for login login_rrhh_anagonzales;

create user recep_carloslopez
for login login_recep_carloslopez;
go
create user ger_lauramartinez
for login login_ger_lauramartinez;
go
create user cont_pedroramirez
for login login_cont_pedroramirez;

-- AGREGAR USUARIOS A ROLES
go
alter role Administrador add member admin_juanperez;
alter role RRHH add member rrhh_anagonzales;
alter role Recepcionista add member recep_carloslopez;
alter role Gerente add member ger_lauramartinez;
alter role Contador add member cont_pedroramirez-- OTORGAR PERMISOS (En base a las opciones)
go
-- Administrador
grant control on database::Hotel to Administrador;
-- SysAdmin
grant select, insert, update, delete on dbo.Cargos to Gerente;
grant select, insert, update, delete on dbo.Clientes to Gerente;
grant select, insert, update, delete on dbo.Empleados to Gerente;
grant select, insert, update, delete on dbo.Habitaciones to Gerente;
grant select, insert, update, delete on dbo.HorarioTrabajos to Gerente;
grant select, insert, update, delete on dbo.PrecioHabitaciones to Gerente;
grant select, insert, update, delete on dbo.Reservacion to Gerente;
grant select, insert, update, delete on dbo.Temporadas to SysAdmin;
grant select, insert, update, delete on dbo.TipoPagos to SysAdmin;
grant select on dbo.Departamentos to SysAdmin;
grant select on dbo.Municipios to SysAdmin;
grant select on dbo.Distritos to SysAdmin;

-- Recepcionista
grant select, insert, update, delete on dbo.Clientes to Recepcionista;
grant select, insert, update, delete on dbo.Reservacion to Recepcionista;

-- RRHH 
grant select, insert, update, delete on dbo.Direcciones to RRHH;
grant select, insert, update, delete on dbo.Cargos to RRHH;
grant select, insert, update, delete on dbo.Empleados to RRHH;
grant select on dbo.Departamentos to RRHH;
grant select on dbo.Municipios to RRHH;
grant select on dbo.Distritos to RRHH;

-- Contador
grant select, insert, update, delete on dbo.TarjetaCreditos to Contador;
grant select, insert, update, delete on dbo.TarjetaDebitos to Contador;
grant select, insert, update, delete on dbo.Empleados to Contador;
grant select, insert, update, delete on dbo.Clientes to Contador;

-- CONSULTAS
go
-- Consulta para obtener una lista de logins en la instancia de SQL Server
select name from sys.server_principals where type_desc = 'SQL_LOGIN';
go
-- Consulta para obtener una lista de usuarios en la instancia de SQL Server
select name from sys.database_principals where type_desc = 'SQL_USER';
go
-- Consulta para obtener una lista de roles en la instancia de SQL Server
select name from sys.database_principals where type_desc = 'DATABASE_ROLE';
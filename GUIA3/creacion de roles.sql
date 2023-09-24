use hotel;

--CREACION DE LOGINS

--Login Administrador
create login sysadmin_login
with password = '12345';

-- Login Gerente
create login gabrielapimentel_login
with password = '12345';

--Login Recepcionista
create login alejandracruz_login
with password = '12345';

--Login Personal de limpieza
create login williamgarzona_login
with password = '12345';

--Login Personal de servicios
create login karlaGuevara_login
with password = '12345';

--Login RRHH
create login yohalmoflores_login 
with password = '12345';

--CREACION DE USUARIOS

--Crear usuario Sysadmin
create user sysadmin_user
for login sysadmin_login;

--Crear usuario Gerente
create user gabrielapimentel_user
for login gabrielapimentel_login;

--Crear usuario Recepcionista
create user alejandracruz_user
for login alejandracruz_login;

--Crear usuario Personal de limpieza
create user williamgarzona_user 
for login williamgarzona_login;

--Crear usuario Personal de servicios
create user karlaGuevara_user
for login karlaGuevara_login;

--Crear usuario RRHH1
create user yohalmoflores_user
for login yohalmoflores_login;


--CREACION DE ROLES

--Crear roles
create role Administrador;
create role Gerente;
create role Recepcionista;
create role PersonaldeLimpieza;
create role PersonaldeServicios;
create role RRHH;


--Unir miembros a los roles
alter role Administrador add member sysadmin_user;
alter role Gerente add member gabrielapimentel_user;
alter role Recepcionista add member alejandracruz_user;
alter role PersonaldeLimpieza add member williamgarzona_user;
alter role PersonaldeServicios add member karlaGuevara_user;
alter role RRHH add member yohalmoflores_user;


--Permisos Administrador
grant select, insert, update, delete on dbo.empleados to Administrador;
grant select, insert, update, delete on dbo.cargos to Administrador;
grant select, insert, update, delete on dbo.servicios_adicionales to Administrador;
grant select, insert, update, delete on dbo.historial_servicios to Administrador;
grant select, insert, update, delete on dbo.clientes to Administrador;
grant select, insert, update, delete on dbo.habitaciones to Administrador;
grant select, insert, update, delete on dbo.tipo_habitaciones to Administrador;
grant select, insert, update, delete on dbo.reservaciones to Administrador;
grant select, insert, update, delete on dbo.valoraciones to Administrador;
grant select, insert, update, delete on dbo.municipios to Administrador;
grant select, insert, update, delete on dbo.departamentos to Administrador;
grant select, insert, update, delete on dbo.distritos to Administrador;
grant select, insert, update, delete on dbo.direcciones to Administrador;
grant select, insert, update, delete on dbo.mantenimientos to Administrador;
grant select, insert, update, delete on dbo.departamentos to Administrador;
grant select, insert, update, delete on dbo.Roles to Administrador;
grant select, insert, update, delete on dbo.opciones to Administrador;

--Permisos Gerente
grant select, insert, update, delete on dbo.empleados to Gerente;
grant select, insert, update, delete on dbo.cargos to Gerente;
grant select, insert, update, delete on dbo.clientes to Gerente;
grant select, insert, update, delete on dbo.habitaciones to Gerente;
grant select, insert, update, delete on dbo.reservaciones to Gerente;
grant select, insert, update, delete on dbo.servicios_adicionales to Gerente;
grant select, insert, update, delete on dbo.historial_servicios to Gerente;
grant select, insert, update, delete on dbo.valoraciones to Gerente;


--Permisos Recepcionista
grant select, insert, update on dbo.clientes to Recepcionista;
grant select, insert, update on dbo.reservaciones to Recepcionista;
grant select, insert, update on dbo.habitaciones to Recepcionista;
grant select, insert, update on dbo.empleados to Recepcionista;
grant select, insert, update on dbo.historial_Servicios to Recepcionista;
grant select, insert, update on dbo.valoraciones to Recepcionista;


--Permisos Personal de Limpieza
grant select on dbo.habitaciones to PersonaldeLimpieza;
grant select, insert on dbo.mantenimientos to PersonaldeLimpieza;

--Permisos Personal de Servicios
grant select on clientes to PersonaldeServicios;
grant select, insert on historial_Servicios to PersonaldeServicios;
grant select on servicios_adicionales to PersonaldeServicios;


--Permisos RRHH
grant select, insert, update on dbo.empleados to RRHH;



use hotel;

--EJEMPLO 2
create procedure AgregarEmpleado
---Variables
		@NombresEmpleado varchar(60),
		@ApellidosEmpleado varchar(60),
		@DUI_Empleado varchar(10),
		@Pasaporte_Empleado varchar,
		@ISSS_Empleado int,
		@ID_Direccion int,
		@FechaNacEmpleado date,
		@Telefono varchar(10),
		@Email varchar(100),
		@ID_Cargo int
		

as
begin
		insert into Empleados values
		(@NombresEmpleado ,
		@ApellidosEmpleado ,
		@DUI_Empleado,
		@Pasaporte_Empleado ,
		@ISSS_Empleado,
		@ID_Direccion,
		@FechaNacEmpleado,
		@Telefono,
		@Email,
		@ID_Cargo);

		select * from Empleados;
end

exec AgregarEmpleado
		@NombresEmpleado = 'Rebeca Natalia' ,
		@ApellidosEmpleado ='Rivera Cortez',
		@DUI_Empleado = '0923875-4',
		@Pasaporte_Empleado ='903442452',
		@ISSS_Empleado = '35456356',
		@ID_Direccion = 'sonsonate',
		@FechaNacEmpleado = '10-02-1990',
		@Telefono = '7809-2388',
		@Email = 'rivera@gmail.com',
		@ID_Cargo = '4'

------------------------------------------
---PROCEDIMIENTO
-- Crear el procedimiento almacenado
create procedure MostrarEmpleado
as
begin
    select e.id_empleado, e.nombre, e.apellido, e.dui, e.pasaporte, e.ISSS, 
           e.id_direccion, e.Fecha, e.Telefono, e.email, c.cargo as nombre_cargo, 
           d.id_direccion
    from empleados e
    INNER JOIN cargos c on e.id_cargo = c.id_cargo
    INNER JOIN direcciones d on e.id_direccion = d.id_direccion;
end

exec MostrarEmpleado
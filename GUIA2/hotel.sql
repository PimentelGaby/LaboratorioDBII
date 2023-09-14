create database hotel;

use hotel;

create table departamentos(
id_departamento int primary key identity(1,1),
nombre_departamento varchar(255) not null
);

create table municipios(
id_municipio int primary key identity(1,1),
nombre_municipio varchar(255),
id_departamento int not null,
foreign key (id_departamento) references departamentos(id_departamento)

);

create table distritos(
	id_distrito int primary key identity(1,1),
	nombre_distrito varchar(255) not null,
	id_municipio int not null,
	foreign key (id_municipio) references municipios(id_municipio)
);

create table direcciones(
id_direccion int primary key identity(1,1),
line1 varchar(255) not null,
linea2 varchar(255),
id_distrito int not null,
codigo_postal int not null,
foreign key (id_distrito) references distritos(id_distrito)
);

create table tipo_habitaciones(
	id_tipo int primary key identity(1,1),
	nombre_tipo varchar(100),
);

create table habitaciones(
	id_habitacion int primary key identity(1, 1),
	nombre_habitacion varchar(50),
	capacidad int not null,
	id_tipo int not null,
	estado int not null,
	precio_noche decimal(10, 2),
	foreign key (id_tipo) references tipo_habitaciones(id_tipo)
);

create table cargos(
	id_cargo int primary key identity (1,1),
	cargo  varchar (50)
);

create table empleados(
	id_empleado int primary key identity (1,1),
	nombre varchar (100),
	apellido varchar (100),
	dui varchar (10),
	pasaporte varchar (500) not null,
	ISSS varchar (20),
	id_direccion int,
	Fecha date,
	Telefono varchar (15),
	email varchar (50),
	id_cargo int not null,
	foreign key (id_cargo) references cargos(id_cargo),
	foreign key (id_direccion) references direcciones(id_direccion)
);

create table clientes(
	id_cliente int primary key identity (1,1),
	nombre varchar (100),
	apellido varchar (100),
	dui varchar (10),
	pasaporte varchar (500) not null,
	id_direccion int,
	Telefono varchar (15),
	email varchar (50)
);

CREATE TABLE reservaciones (
    id_reservacion INT PRIMARY KEY identity(1,1),
    id_cliente INT not null,
    fecha_entrada datetime not null,
    fecha_salida datetime not null,
    id_habitacion INT not null,
    estado_reservacion VARCHAR(255),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_habitacion) REFERENCES habitaciones(id_habitacion)
);

CREATE TABLE servicios_adicionales (
    id_servicio INT PRIMARY KEY identity(1, 1),
    nombre_servicio VARCHAR(255),
    precio_servicio DECIMAL(10, 2)
);

CREATE TABLE historial_Servicios (
    id_registro INT PRIMARY KEY identity(1, 1),
    id_reservacion INT,
    id_servicio INT,
    fecha_servicio datetime not null,
	precio_servicio decimal(10, 2) not null,
	comentarios varchar(255),
    FOREIGN KEY (id_reservacion) REFERENCES reservaciones(id_reservacion),
    FOREIGN KEY (id_servicio) REFERENCES Servicios_Adicionales(id_servicio)
);

CREATE TABLE mantenimientos (
    id_registro_mantenimiento INT PRIMARY KEY identity,
    id_habitacion INT,
    fecha_inicio DATE,
	id_empleado int,
    fecha_finalizacion DATE,
    descripcion_trabajo VARCHAR(255),
    FOREIGN KEY (id_habitacion) REFERENCES habitaciones(id_habitacion)
);

CREATE TABLE valoraciones (
    id_valoracion INT PRIMARY KEY identity(1,1),
    id_reservacion INT,
    comentario varchar(2000),
    puntuacion INT,
    FOREIGN KEY (id_reservacion) REFERENCES reservaciones(id_reservacion)
);
-- Departamentos
insert into departamentos values
	( 'Sonsonate'),
	( 'Ahuachapan'),
	( 'Santa Ana'),
	( 'Cabañas'),
	( 'Usulutan');

-- Municipios
insert into municipios values
	( 'Sonsonate Norte', 1),
	('Sonsonate Este', 1),
	('Sonsonate Oeste', 1),
	('Sonsonate Centro', 1),
	('Ahuachapan Sur', 2);

-- Distritos
insert into distritos values
	( 'Nahuizalco', 1),
	( 'Izalco', 1),
	( 'Acajutla', 1),
	( 'Sonsonate', 2),
	('Guaymango', 2);

-- Direcciones 
insert into direcciones values
	('Col Madera', 'Calle 1', 1, 03005),
	('Col Balsarmar', 'Calle 2', 2, 03007),
	('Col Nueva Ventura', 'Calle 8', 3, 03001),
	('Col Cangrejo', 'Calle 9', 4, 03014),
	('Col Higueras', 'Calle 11', 5, 03006);
	
-- Cargos
insert into cargos values
	('Conserje'),
	('Masajista'),
	('Recepcionista'),
	('Portero'),
	('Gerente');	

-- Empleados
insert into empleados values
	('Gabriela','Pimentel','02938723','2303083421342','273937138',1,'01-09-2000','70160688','gaby@gmail.com',1),
	('Alejandra','Cruz','02908908','1303083421342','373937138',2,'01-09-2001','70160690','ale@gmail.com', 2),
	('William','Garzona','02908653','9303083421342','473937138',3,'01-10-2002','70160656','william@gmail.com',3),
	('Yohalmo','Flores','12308723','0303083421342','573937138',4,'01-03-2000','70160657','flores@gmail.com',4),
	('Karla','Guevara','45608723','5303083421342','073937138',5,'10-09-2000','70160600','karla@gmail.com',5);

	-- Servicios Adicionales
insert into servicios_adicionales values
	('Limpieza',89.00),
	('Masajes', 34.00),
	('GYM', 23.50),
	('orden de equipaje', 12.00),
	('desayuno', 34.00);

insert into clientes values 
('Juan', 'Perez', '55555555-5', '', '', '1111-1111', 'juan.perez@gmail.com'),
('Maria', 'Cortez', '11111111-1', '', '', '2222-2222', 'maria.cortez@gmail.com'),
('Pedro', 'Pascal', '22222222-2', '', '', '3333-3333', 'pedro.pascal@gmail.com'),
('Jorge', 'Portillo', '33333333-3', '', '', '4444-4444', 'jorge.portillo@gmail.com'),
('Cesar', 'Flores', '44444444-4', '', '', '5555-5555', 'cesar.flores@gmail.com');

insert into tipo_habitaciones VALUES
('Habitación temática'),
('Habitación ejecutiva o de negocios'),
('Habitación familiar'),
('Suite'),
('Habitación estándar');


insert into habitaciones values 
('habitacion 1', 12, 1, 1, 59),
('habitacion 2', 6, 2, 1, 117),
('habitacion 3', 5, 3, 1, 59),
('habitacion 4', 2, 4, 1, 59),
('habitacion 5', 3, 5, 1, 59);

insert into reservaciones VALUES
(1, '2023-01-01', '2023-01-17', 1, 1),
(2, '2023-02-11', '2023-02-21', 2, 1),
(3, '2023-06-29', '2023-07-03', 3, 1),
(4, '2023-04-09', '2023-05-08', 4, 1),
(5, '2023-03-12', '2023-03-15', 5, 1);


insert into valoraciones values 
(1, 'buen servicio', 4),
(2, 'mal servicio', 1),
(3, 'buen servicio', 4),
(4, 'exelente servicio', 5),
(5, 'buen servicio', 5);

insert into historial_Servicios values 
(1, 1, '2023-01-11', 17, 'sin comentarios'),
(2, 2, '2023-02-12', 17, 'sin comentarios'),
(3, 3, '2023-07-01', 17, 'sin comentarios'),
(4, 4, '2023-04-10', 17, 'sin comentarios'),
(5, 5, '2023-03-13', 17, 'sin comentarios');

insert into mantenimientos values 
(1, '2023-01-17', 1, '2023-01-17', 'limipieza general'),
(2, '2023-02-21', 1, '2023-02-21', 'limipieza general'),
(3, '2023-07-03', 1, '2023-07-03', 'limipieza general'),
(4, '2023-05-08', 1, '2023-05-08', 'limipieza general'),
(5, '2023-03-15', 1, '2023-03-15', 'limipieza general');
	
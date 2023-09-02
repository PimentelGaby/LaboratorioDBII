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
)

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
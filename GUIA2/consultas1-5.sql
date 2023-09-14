--Consulta para encontrar las habitaciones con una capacidad superior a cierto número
select nombre_habitacion, capacidad
from habitaciones
where capacidad > 4;

--Consulta para calcular el precio total de todos los servicios adicionales
SELECT SUM(precio_servicio) AS precio_total_servicios
FROM servicios_adicionales
WHERE precio_servicio > 30.00;

--Consulta para encontrar empleados que tienen un número de teléfono
select nombre, apellido, Telefono
from empleados
where Telefono LIKE '%%[0-9]%%';

--Consulta para el precio por noche de todas las habitaciones
select AVG(precio_noche) as precio_promedio_noche
from habitaciones;

--Consulta para listar todas las habitaciones con un precio inferior a cierta cantidad
select nombre_habitacion, precio_noche
from habitaciones
where precio_noche < 100;
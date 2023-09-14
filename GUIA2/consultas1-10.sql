--consulta para mostrar a que habitaciones se les hizo limpieza y el horario--
select h.nombre_habitacion,nombre_servicio, hs.precio_servicio, fecha_servicio
from servicios_adicionales sa, historial_Servicios hs,
reservaciones r, habitaciones h
where hs.id_servicio = sa.id_servicio and r.id_reservacion = hs.id_reservacion
and h.id_habitacion = r.id_habitacion and hs.id_servicio = 1;


--consulta para listar los usuarios que se han alojado en las habitaciones--
select c.nombre, c.apellido, nombre_habitacion,fecha_entrada, fecha_salida from clientes c 
inner join reservaciones r on r.id_cliente = c.id_cliente
inner join habitaciones h on h.id_habitacion = r.id_habitacion;


--consulta para conocer la valoracion promedio de cada habitacion--
select nombre_habitacion,
(select avg(puntuacion) from valoraciones where id_reservacion = r.id_reservacion) as puntuacion
from habitaciones h inner join reservaciones r on r.id_reservacion = h.id_habitacion;


--consulta para mostrar el total de los servicios consumidos, valoracion,  --
--gasto total de alojamiento y tipo de habitacion--
select concat(c.nombre, ' ',c.apellido) as cliente, nombre_habitacion,precio_noche, nombre_tipo, fecha_entrada,
fecha_salida, (DATEDIFF(day, fecha_entrada, fecha_salida) * h.precio_noche) as Alojamiento, 
(select sum(precio_servicio) from historial_Servicios hs where hs.id_reservacion = r.id_reservacion)
as totalServicios, puntuacion, comentario from clientes c 
inner join reservaciones r on r.id_cliente = c.id_cliente
inner join habitaciones h on h.id_habitacion = r.id_habitacion
inner join tipo_habitaciones th on th.id_tipo = h.id_tipo
inner join valoraciones v on v.id_reservacion = r.id_reservacion;


-- consulta para conocer la cantidad de mantenimientos que se le han dado a una habitacion
select nombre_habitacion, count(*) as totalMantenimientos from habitaciones h 
inner join mantenimientos m on m.id_habitacion = h.id_habitacion
group by nombre_habitacion;
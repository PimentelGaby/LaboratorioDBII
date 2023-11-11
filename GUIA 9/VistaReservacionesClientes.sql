use hotel;

create view VistaReservacionesClientes as
SELECT
	c.id_cliente,
    c.nombres AS nombres_cliente,
    c.apellidos AS apellidos_cliente,
	h.numero_habitacion,
	h.precio_noche,
	h.estado,
	h.capacidad,
	r.estado_reservacion,
    r.fecha_entrada,
    r.fecha_salida

FROM
    reservaciones r
INNER JOIN clientes c ON r.id_cliente = c.id_cliente
INNER JOIN habitaciones h on r.id_habitacion = h.id_habitacion;

-- Consulta de vista
select * from VistaReservacionesClientes;




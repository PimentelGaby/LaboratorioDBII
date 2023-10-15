use hotel;
GO

-- Crear la función con valores de tabla
CREATE FUNCTION ObtenerDetalleReservacionesPorClienteYFechas(
    @idCliente INT,
    @fechaInicio DATETIME,
    @fechaFin DATETIME
)
RETURNS TABLE
AS
RETURN (
    SELECT
        r.id_reservacion,
        c.nombres AS nombre_cliente,
        c.apellidos AS apellidos_cliente,
        h.numero_habitacion,
        h.capacidad,
        th.nombre_tipo AS tipo_habitacion,
        r.fecha_entrada,
        r.fecha_salida,
        r.estado_reservacion
    FROM
        reservaciones r
    INNER JOIN clientes c ON r.id_cliente = c.id_cliente
    INNER JOIN habitaciones h ON r.id_habitacion = h.id_habitacion
    INNER JOIN tipo_habitaciones th ON h.id_tipo = th.id_tipo
    WHERE
        r.id_cliente = @idCliente
        AND r.fecha_entrada BETWEEN @fechaInicio AND @fechaFin
);

---------------------------------------------------------------------
-- Ejemplo de uso de la función
SELECT * FROM ObtenerDetalleReservacionesPorClienteYFechas(1, '2023-01-01', '2023-10-05');

USE hotel;

CREATE TABLE historial_reservaciones (
    id_historial INT PRIMARY KEY IDENTITY(1,1),
    id_reservacion INT,
    nuevo_estado VARCHAR(255),
    fecha_registro DATETIME
);

--------------------------------------------------------
UPDATE reservaciones
SET estado_reservacion= 'Cancelada'
WHERE id_cliente=3
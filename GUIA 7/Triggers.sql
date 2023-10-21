use hotel;

-- Trigger que se dispara despu�s de la actualizaci�n en la tabla reservaciones

create TRIGGER TriggerReservacion
ON reservaciones     
AFTER UPDATE
AS
BEGIN
    DECLARE @id_reservacion INT;
    DECLARE @nuevo_estado_reservacion VARCHAR(255);

    SELECT @id_reservacion = id_reservacion, @nuevo_estado_reservacion = estado_reservacion
    FROM inserted;

    -- Realiza la inserci�n en la tabla historial_reservaciones
    INSERT INTO historial_reservaciones (id_reservacion, nuevo_estado, fecha_registro)
    VALUES (@id_reservacion, @nuevo_estado_reservacion, GETDATE());

    -- Muestra un mensaje al finalizar
    PRINT 'El trigger ha registrado una actualizaci�n en el historial de reservaciones.';
END


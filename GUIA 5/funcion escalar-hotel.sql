use hotel;
-- Crear la funci�n escalar
CREATE FUNCTION dbo.ObtenerNombreCompletoEmpleado (@id_empleado INT)
RETURNS VARCHAR(200)
AS
BEGIN
    DECLARE @nombreCompleto VARCHAR(200);

    -- Verificar si el empleado existe
    IF NOT EXISTS (SELECT 1 FROM empleados WHERE id_empleado = @id_empleado)
    BEGIN
        RETURN 'Empleado no encontrado';
    END

    -- Obtener el nombre completo
    SELECT @nombreCompleto = nombres_empleado + ' ' + apellidos_empleado
    FROM empleados
    WHERE id_empleado = @id_empleado;

    -- Verificar si el nombre completo est� vac�o
    IF @nombreCompleto IS NULL
    BEGIN
        RETURN 'Nombre no disponible';
    END

    RETURN @nombreCompleto;
END;


-------------------------------------------------------------------

SELECT dbo.ObtenerNombreCompletoEmpleado(1) AS NombreCompleto;
-- Esto devolver� el nombre completo del empleado con ID 1.
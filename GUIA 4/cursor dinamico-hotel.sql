---CURSOR DINAMICO 

--EL CURSOR MUESTRA CUANTO DINERO SE TENDRA EN EL MES DE LAS RESERVACIONES POR NOCHES EN ESTE CASO 
---EN EL MES DE OCTUBRE SE TUVIERON 2 RESERVACIONES
DECLARE @ID_HABITACION  INT
DECLARE @PRECIO DECIMAL(10,2)
DECLARE @DIAS INT
DECLARE @FECHA_ENTRADA DATE
DECLARE @FECHA_SALIDA DATE
DECLARE @TOTAL DECIMAL(10,2)
-- Inicializar @TOTAL con 0
SET @TOTAL = 0
DECLARE CursorCaja CURSOR FOR 
select  
id_habitacion,
fecha_entrada,
fecha_salida
from reservaciones where MONTH(fecha_entrada) =  MONTH(GETDATE())  and estado_reservacion = 'Reservada'

OPEN CursorCaja

FETCH NEXT FROM CursorCaja INTO @ID_HABITACION, @FECHA_ENTRADA, @FECHA_SALIDA

WHILE @@fetch_status = 0

BEGIN

    --2. Obtiene el precio de la habitacion y hace el calculo de los dias
select 
@PRECIO = precio_noche, @DIAS = DATEDIFF(DAY, @FECHA_ENTRADA, @FECHA_SALIDA)  from habitaciones where id_habitacion = @ID_HABITACION;
-- 3. Hace el calculo del total de la reservacion

 SET @TOTAL = @TOTAL + (@DIAS - 1) * @PRECIO;
--4. Guardar el calculo en la tabla caja 
FETCH NEXT FROM CursorCaja INTO @ID_HABITACION, @FECHA_ENTRADA, @FECHA_SALIDA

END

insert into caja values 
	('caja1',  MONTH(GETDATE()), @TOTAL);

    
CLOSE CursorCaja
DEALLOCATE CursorCaja

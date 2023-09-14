--VER LOS CLIENTES QUE TIENEN MAS DE UN CONTRACTO

--HAGO UN REPORTE QUE MUESTRE LOS CLIENTES QUE TENGAN MAS DE UN CONTRATO(EXAMEN)


SELECT a.IDCliente, 
	CONCAT(b.Nombres, ' ',b.Apellidos) Cliente,
	COUNT(IDContrato) Contratos
FROM Contratos a
INNER JOIN Clientes b ON b.IDCliente=a.IDCliente
GROUP BY a.IDCliente, b.Nombres,b.Apellidos
ORDER BY Contratos DESC
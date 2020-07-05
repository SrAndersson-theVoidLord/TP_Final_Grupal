
USE ADECOM
GO

CREATE PROCEDURE PRO_Mostrar_DetalledeFactura 

@idventa int
 
AS
 
 SELECT Idventa, Descripcion, Cantidad, Subtotal 
  FROM (
		SELECT Id_Venta_DXV_H AS Idventa, H.Nombre_HAR as Descripcion, Cantidad_Total_DXV_H as Cantidad, Subtotal_DXV_H as Subtotal	
		FROM Detalles_de_ventas_x_Hardware DH
		iNNER JOIN Hardware H ON Id_Hardware_HAR = Id_Hardware_DXV_H
		WHERE Id_Venta_DXV_H = @idventa


  UNION ALL

		SELECT Id_Venta_DXV_S AS Idventa, TP.Descripcion_TDP AS Descripcion, 1 AS CANTIDAD , Subtotal_DXV_S AS Subtotal
		FROM Detalles_de_ventas_x_Actividades DA 
		INNER JOIN Actividades A ON DA.Id_Actividad_DXV_S = A.Id_Actividad_A
		INNER JOIN Tipos_de_pedido TP ON A.Id_Tipo_de_Pedido__A = TP.Id_Tipo_TDP
		WHERE Id_Venta_DXV_S = @idventa
		) detallefacturas
GO


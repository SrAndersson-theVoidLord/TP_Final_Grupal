
USE Adecom
GO

--Cada ves que se cree una nueva columna en la tabla "Detalles_de_ventas_x_Actividades" se alterara el monto total de la 
--columna que corresponda de la tabla "Ventas".

create trigger TRI_Detalle_de_vent_x_Acti__X__Vent
on Detalles_de_ventas_x_Actividades
after insert

AS   
BEGIN  
SET NOCOUNT ON; 

update Ventas set Monto_final_VEN = Monto_final_VEN + (select Subtotal_DXV_S from inserted)
where Id_Venta_VEN = (select Id_Venta_DXV_S from inserted)

end
GO



--Cada ves que se cree una nueva columna en la tabla "Detalles_de_ventas_x_Hardware" se alterara el monto total de la 
--columna que corresponda de la tabla "Ventas".

create trigger TRI_Detalles_de_vent_x_Hard__X__Vent
on Detalles_de_ventas_x_Hardware
after insert

AS   
BEGIN  
SET NOCOUNT ON; 

update Ventas set Monto_final_VEN = Monto_final_VEN + (select Subtotal_DXV_H from inserted)
where Id_Venta_VEN = (select Id_Venta_DXV_H from inserted)

end
GO

--Cada ves que se cree una nueva columna en la tabla "Actividades" se alterara el monto total de la 
--columna que corresponda de la tabla "Detalles_de_ventas_x_Actividades".

--create trigger TRI_Actividades__X__Detalles_de_ventas_x_Actividades
--on Actividades
--after insert

--AS   
--BEGIN  
--SET NOCOUNT ON; 

--update Detalles_de_ventas_x_Actividades set Subtotal_DXV_S = Subtotal_DXV_S + (select Subtotal_A from inserted)
--where Id_Actividad_DXV_S = (select Id_Actividad_A from inserted)

--end
--GO
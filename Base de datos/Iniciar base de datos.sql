CREATE DATABASE Adecom
GO

use Adecom
go

--DROP DATABASE Adecom
--GO

CREATE TABLE Categoria_hardware(
	
	Id_Categoria_CAT CHAR(4) NOT NULL,
	CONSTRAINT PK_Categoria_hardware PRIMARY KEY (Id_Categoria_CAT),

	Descripcion_CAT CHAR(100) NOT NULL

)
GO

CREATE TABLE Clientes(
	
	Id_Cliente_CLI INT identity(1,1) NOT NULL,
	CONSTRAINT PK_Clientes PRIMARY KEY (Id_Cliente_CLI),

	DNI_CLI CHAR(8) NOT NULL,
	Nombre_CLI CHAR(36) NOT NULL,
	Apellido_CLI CHAR(39) NOT NULL,
	CONSTRAINT UC_Clientes UNIQUE (DNI_CLI, Nombre_CLI, Apellido_CLI),

	NombreUsuario_CLI CHAR(15) NOT NULL,
	Contrasenia_CLI CHAR(15) NOT NULL,
	Direccion_CLI CHAR(20) NOT NULL,
	Localidad_CLI CHAR(20) NOT NULL,
	Codigo_Postal_CLI CHAR(5) NOT NULL,
	Telefono_CLI CHAR(13) NOT NULL,
	Email_CLI CHAR(76) NOT NULL,
	Estado_CLI BIT NOT NULL DEFAULT 1

)
GO

CREATE TABLE Hardware(

	Id_Hardware_HAR INT identity(1,1) NOT NULL,
	CONSTRAINT PK_Hardware PRIMARY KEY (Id_Hardware_HAR),

	Categoria_HAR CHAR(4) NOT NULL,
	constraint PF_Hardware_Categoria_hardware foreign key (Categoria_HAR) 
	references Categoria_hardware(Id_Categoria_CAT),

	Nombre_HAR CHAR(150) NOT NULL,
	Descripcion_HAR CHAR(1000) NOT NULL,
	Imagen_HAR CHAR(256) NULL,
	Precio_HAR FLOAT NOT NULL DEFAULT 0,
	Estado_HAR BIT NOT NULL DEFAULT 1

)
go

CREATE TABLE Empleados(
	
	Id_Empleado_EMP INT identity(1,1) NOT NULL,
	CONSTRAINT PK_Empleados PRIMARY KEY (Id_Empleado_EMP),

	DNI_EMP CHAR(8) NOT NULL,
	Nombre_EMP CHAR(36) NOT NULL,
	Apellido_EMP CHAR(39) NOT NULL,
	CONSTRAINT UC_Empleados UNIQUE (DNI_EMP, Nombre_EMP, Apellido_EMP),

	NombreUsuario_EMP CHAR(15) NOT NULL,
	Contrasenia_EMP CHAR(15) NOT NULL,
	Direccion_EMP CHAR(20) NOT NULL,
	Localidad_EMP CHAR(20) NOT NULL,
	Codigo_Postal_EMP CHAR(5) NOT NULL,
	Telefono_EMP CHAR(13) NOT NULL,
	Email_EMP CHAR(76) NOT NULL,
	Estado_EMP BIT NOT NULL DEFAULT 1

)
go

CREATE TABLE Tipos_de_pedido(
	
	Id_Tipo_TDP INT identity(1,1) NOT NULL,
	CONSTRAINT PK_Tipos_de_pedido PRIMARY KEY (Id_Tipo_TDP),

	Descripcion_TDP CHAR(150) NOT NULL,
	Precio_x_hora_TDP FLOAT NOT NULL DEFAULT 0

)
go

CREATE TABLE Ventas(

	Id_Venta_VEN INT identity(1,1) NOT NULL,
	CONSTRAINT PK_Ventas PRIMARY KEY (Id_Venta_VEN),

	Id_Cliente_VEN INT NOT NULL,

	constraint PF_Ventas_Clientes foreign key (Id_Cliente_VEN) 
	references Clientes(Id_Cliente_CLI),

	Fecha_VEN DATE NOT NULL,
	Monto_final_VEN FLOAT NOT NULL DEFAULT 0

)
go

CREATE TABLE Detalles_de_ventas_x_Hardware(

	Id_Venta_DXV_H INT NOT NULL,
	Id_Hardware_DXV_H INT NOT NULL,
	CONSTRAINT PK_Detalles_de_ventas_x_Hardware PRIMARY KEY (Id_Venta_DXV_H, Id_Hardware_DXV_H),

	constraint PF_Detalles_de_ventas_x_Hardware_Ventas foreign key (Id_Venta_DXV_H) 
	references Ventas(Id_Venta_VEN),

	constraint PF_Detalles_de_ventas_x_Hardware_Hardware foreign key (Id_Hardware_DXV_H) 
	references Hardware(Id_Hardware_HAR),

	Precio_Unitario_DXV_H FLOAT NOT NULL DEFAULT 0,
	Cantidad_Total_DXV_H INT NOT NULL DEFAULT 0,
	Subtotal_DXV_H FLOAT NOT NULL DEFAULT 0,

)
go

CREATE TABLE Actividades(
	
	Id_Actividad_A INT identity(1,1) NOT NULL,
	CONSTRAINT PK_Actividades PRIMARY KEY (Id_Actividad_A),

	Id_Cliente_A INT NOT NULL,
	Id_Empleado_A INT NOT NULL,
	Id_Tipo_de_Pedido__A INT NOT NULL,

	constraint PF_Actividades_Clientes foreign key (Id_Cliente_A) 
	references Clientes(Id_Cliente_CLI),

	constraint PF_Actividades_Empleados foreign key (Id_Empleado_A) 
	references Empleados(Id_Empleado_EMP),

	constraint PF_Actividades_Tipos_de_pedido foreign key (Id_Tipo_de_Pedido__A) 
	references Tipos_de_pedido(Id_Tipo_TDP),
	
	Descripcion_A CHAR(150) NOT NULL,
	Precio_x_hora_A FLOAT NOT NULL DEFAULT 0,
	Horas_trabajadas_A INT NOT NULL DEFAULT 0,
	Subtotal_A FLOAT NOT NULL DEFAULT 0,
	Fecha_A DATE NOT NULL,
	Estado_A BIT NOT NULL DEFAULT 1

)
go

CREATE TABLE Detalles_de_ventas_x_Actividades(

	Id_Venta_DXV_S INT NOT NULL,
	Id_Actividad_DXV_S INT NOT NULL,
	CONSTRAINT PK_Detalles_de_ventas_x_Actividades PRIMARY KEY (Id_Venta_DXV_S, Id_Actividad_DXV_S),

	constraint PF_Detalles_de_ventas_x_Actividades_Ventas foreign key (Id_Venta_DXV_S) 
	references Ventas(Id_Venta_VEN),

	constraint PF_Detalles_de_ventas_x_Actividades_Actividades foreign key (Id_Actividad_DXV_S) 
	references Actividades(Id_Actividad_A),

	Descripcion_DXV_S CHAR(150) NOT NULL,
	Subtotal_DXV_S FLOAT NOT NULL DEFAULT 0

)
go

CREATE TABLE Solicitud_de_servicio(

	Id_Solicitud_SdS INT identity(1,1) NOT NULL,
	Id_Cliente_SdS INT NOT NULL,

	CONSTRAINT PK_Solicitud_de_servicio PRIMARY KEY (Id_Solicitud_SdS, Id_Cliente_SdS),
	
	constraint PF_Solicitud_de_servicio_x_Clientes foreign key (Id_Cliente_SdS) 
	references Clientes(Id_Cliente_CLI),

	Descripcion_SdS CHAR(1500) NOT NULL,
	Estado_SdS BIT NOT NULL DEFAULT 1

)
go

CREATE TABLE Presupuesto_de_servicio(

	Id_Presupuesto_PdS INT identity(1,1) NOT NULL,
	CONSTRAINT PK_Presupuesto_de_servicio PRIMARY KEY (Id_Presupuesto_PdS),

	Id_Solicitud_PdS INT NOT NULL,
	Id_Cliente_PdS INT NOT NULL,

	constraint PF_Presupuesto_de_servicio_x_Solicitud_de_servicio foreign key (Id_Solicitud_PdS, Id_Cliente_PdS) 
	references Solicitud_de_servicio(Id_Solicitud_SdS, Id_Cliente_SdS),

	Id_Empleado_PdS INT NOT NULL,

	constraint PF_Presupuesto_de_servicio_x_Empleados foreign key (Id_Empleado_PdS) 
	references Empleados(Id_Empleado_EMP),

	Id_Tipo_PdS INT NOT NULL,

	constraint PF_Presupuesto_de_servicio_x_Tipos_de_pedido foreign key (Id_Tipo_PdS) 
	references Tipos_de_pedido(Id_Tipo_TDP),

	Precio_x_hora_PdS FLOAT NOT NULL DEFAULT 0,
	Horas_trabajadas_PdS INT NOT NULL DEFAULT 0,
	Subtotal_PdS FLOAT NOT NULL DEFAULT 0,

	Descripcion_PdS CHAR(1500) NOT NULL,
	Estado_PdS BIT NOT NULL DEFAULT 1

)
go

--Procedimientos almacenados:
--Categoria_hardware

CREATE PROCEDURE PRO_ingresar_datos_Categoria_hardware 
	
	@Id_Categoria CHAR(4),
	@Descripcion CHAR(100)

AS
	
	INSERT INTO Categoria_hardware (Id_Categoria_CAT, Descripcion_CAT)
	SELECT @Id_Categoria, @Descripcion

GO

--Clientes

CREATE PROCEDURE PRO_ingresar_datos_Clientes
	
	@DNI CHAR(8),
	@Nombre CHAR(36),
	@Apellido CHAR(39),
	@NombreUsuario CHAR(15),
	@Contrasenia CHAR(15),
	@Direccion CHAR(20),
	@Localidad CHAR(20),
	@Codigo_Postal CHAR(5),
	@Telefono CHAR(13),
	@Email CHAR(76)

AS
	
	INSERT INTO  
	Clientes(DNI_CLI, Nombre_CLI, Apellido_CLI, NombreUsuario_CLI, Contrasenia_CLI, Direccion_CLI, Localidad_CLI, Codigo_Postal_CLI, Telefono_CLI, Email_CLI)
	SELECT @DNI, @Nombre, @Apellido, @NombreUsuario, @Contrasenia, @Direccion, @Localidad, @Codigo_Postal, @Telefono, @Email

GO

CREATE PROCEDURE PRO_Desabilitar_Clientes
	
	@Id_Cliente INT
	
AS
	
	IF EXISTS(SELECT * FROM Clientes WHERE Id_Cliente_CLI = @Id_Cliente AND Estado_CLI = 1)
		
		Update Clientes Set Estado_CLI = 0 Where Id_Cliente_CLI = @Id_Cliente

	ELSE

		PRINT 'No se pudo ejecutar.'

GO

--Hardware

CREATE PROCEDURE PRO_ingresar_datos_Hardware

	@Categoria CHAR(4),
	@Nombre CHAR(150),
	@Descripcion CHAR(1000),
	@Imagen CHAR(256),
	@Precio FLOAT

AS
	
	INSERT INTO  
	Hardware(Categoria_HAR, Nombre_HAR, Descripcion_HAR, Imagen_HAR, Precio_HAR)
	SELECT @Categoria, @Nombre, @Descripcion, @Imagen, @Precio

GO

CREATE PROCEDURE PRO_Desabilitar_Hardware
	
	@Id_Hardware INT

AS
	
	IF EXISTS(SELECT * FROM Hardware WHERE Id_Hardware_HAR = @Id_Hardware AND Estado_HAR = 1)
		
		Update Hardware Set Estado_HAR = 0 Where Id_Hardware_HAR = @Id_Hardware

	ELSE

		PRINT 'No se pudo ejecutar.'

GO

--Empleados

CREATE PROCEDURE PRO_ingresar_datos_Empleados
	
	@DNI CHAR(8),
	@Nombre CHAR(36),
	@Apellido CHAR(39),
	@NombreUsuario CHAR(15),
	@Contrasenia CHAR(15),
	@Direccion CHAR(20),
	@Localidad CHAR(20),
	@Codigo_Postal CHAR(5),
	@Telefono CHAR(13),
	@Email CHAR(76)

AS
	
	INSERT INTO 
	Empleados(DNI_EMP, Nombre_EMP, Apellido_EMP, NombreUsuario_EMP, Contrasenia_EMP, Direccion_EMP, Localidad_EMP, Codigo_Postal_EMP, Telefono_EMP, Email_EMP)
	SELECT @DNI, @Nombre, @Apellido, @NombreUsuario, @Contrasenia, @Direccion, @Localidad, @Codigo_Postal, @Telefono, @Email

GO

CREATE PROCEDURE PRO_Desabilitar_Empleados
	
	@Id_Empleado INT

AS
	
	IF EXISTS(SELECT * FROM Empleados WHERE Id_Empleado_EMP = @Id_Empleado AND Estado_EMP = 1)
		
		Update Empleados Set Estado_EMP = 0 Where Id_Empleado_EMP = @Id_Empleado

	ELSE

		PRINT 'No se pudo ejecutar.'

GO

--Tipos_de_pedido

CREATE PROCEDURE PRO_ingresar_datos_Tipos_de_pedido

	@Descripcion CHAR(150),
	@Precio_x_hora FLOAT

AS

	INSERT INTO Tipos_de_pedido(Descripcion_TDP, Precio_x_hora_TDP)
	SELECT @Descripcion, @Precio_x_hora

GO


--Ventas

CREATE PROCEDURE PRO_ingresar_datos_Ventas

	@Id_Cliente INT

AS

	INSERT INTO Ventas(Id_Cliente_VEN, Fecha_VEN)
	SELECT @Id_Cliente, GETDATE()

GO

--Detalles_de_ventas_x_Hardware

CREATE PROCEDURE PRO_ingresar_datos_Detalles_de_ventas_x_Hardware

	@Id_Venta INT,
	@Id_Hardware INT,
	@Cantidad_Total INT

AS
	
	INSERT INTO 
	Detalles_de_ventas_x_Hardware(Id_Venta_DXV_H, Id_Hardware_DXV_H, Cantidad_Total_DXV_H, Precio_Unitario_DXV_H, Subtotal_DXV_H)
	SELECT @Id_Venta, @Id_Hardware, @Cantidad_Total,

	(SELECT Precio_HAR FROM Hardware WHERE Id_Hardware_HAR = @Id_Hardware), 
	((SELECT Precio_HAR FROM Hardware WHERE Id_Hardware_HAR = @Id_Hardware) * @Cantidad_Total)

GO

--Actividades

CREATE PROCEDURE PRO_ingresar_datos_Actividades
	
	@Id_Cliente INT,
	@Id_Empleado INT,
	@Id_Tipo_de_Pedido INT,
	@Descripcion CHAR(150),
	@Horas_trabajadas INT
	--@Fecha DATE

AS
	
	INSERT INTO
	Actividades(Id_Cliente_A, Id_Empleado_A, Id_Tipo_de_Pedido__A, Descripcion_A, Horas_trabajadas_A, Fecha_A, Precio_x_hora_A, Subtotal_A)
	SELECT @Id_Cliente, @Id_Empleado, @Id_Tipo_de_Pedido, @Descripcion, @Horas_trabajadas, 
	
	GETDATE(),
	(SELECT (Precio_x_hora_TDP * @Horas_trabajadas) FROM Tipos_de_pedido WHERE Id_Tipo_TDP = @Id_Tipo_de_Pedido),
	((SELECT (Precio_x_hora_TDP * @Horas_trabajadas) FROM Tipos_de_pedido WHERE Id_Tipo_TDP = @Id_Tipo_de_Pedido) * @Horas_trabajadas)

GO

CREATE PROCEDURE PRO_ingresar_datos_Actividades_armado
	
	@Id_Cliente INT,
	@Id_Empleado INT,
	@Id_Tipo_de_Pedido INT,
	@Descripcion CHAR(150),
	@Total_del_armado FLOAT
	--@Fecha DATE

AS
	
	INSERT INTO
	Actividades(Id_Cliente_A, Id_Empleado_A, Id_Tipo_de_Pedido__A, Descripcion_A, Horas_trabajadas_A, Fecha_A, Precio_x_hora_A, Subtotal_A)
	SELECT @Id_Cliente, @Id_Empleado, @Id_Tipo_de_Pedido, @Descripcion, 
	
	0,
	GETDATE(),
	0,
	@Total_del_armado

GO

CREATE PROCEDURE PRO_Desabilitar_Actividad
	
	@Id_Actividad INT

AS
	
	IF EXISTS(SELECT * FROM Actividades WHERE Id_Actividad_A = @Id_Actividad AND Estado_A = 1)
		
		Update Actividades Set Estado_A = 0 Where Id_Actividad_A = @Id_Actividad

	ELSE

		PRINT 'No se pudo ejecutar.'

GO

--Detalles_de_ventas_x_Actividades

CREATE PROCEDURE PRO_ingresar_datos_Detalles_de_ventas_x_Actividades

	@Id_Venta INT,
	@Id_Actividad INT,
	@Descripcion CHAR(150)

AS

	INSERT INTO 
	Detalles_de_ventas_x_Actividades(Id_Venta_DXV_S, Id_Actividad_DXV_S, Descripcion_DXV_S, Subtotal_DXV_S)
	SELECT @Id_Venta, @Id_Actividad, @Descripcion, 
	(SELECT Subtotal_A FROM Actividades WHERE Id_Actividad_A = @Id_Actividad)

GO

--Solicitud_de_servicio

CREATE PROCEDURE PRO_ingresar_datos_Solicitud_de_servicio

	@Id_Cliente INT,
	@Descripcion CHAR(1500)

AS

	INSERT INTO 
	Solicitud_de_servicio(Id_Cliente_SdS, Descripcion_SdS)
	SELECT @Id_Cliente, @Descripcion

GO

CREATE PROCEDURE PRO_Desabilitar_Solicitud_de_servicio
	
	@Id_Solisitud INT
	
AS
	
	IF EXISTS(SELECT * FROM Solicitud_de_servicio WHERE Id_Solicitud_SdS = @Id_Solisitud AND Estado_SdS = 1)
		
		Update Solicitud_de_servicio Set Estado_SdS = 0 Where Id_Solicitud_SdS = @Id_Solisitud


GO

--Presupuesto_de_servicio

CREATE PROCEDURE PRO_ingresar_datos_Presupuesto_de_servicio

	@Id_Solicitud INT,
	@Id_Cliente INT,
	@Id_Empleado INT,
	@Id_Tipo_de_pedido INT,
	@Horas_trabajadas INT,

	@Descripcion CHAR(1500)

AS

	INSERT INTO 
	Presupuesto_de_servicio(Id_Solicitud_PdS, Id_Cliente_PdS, Id_Empleado_PdS, Id_Tipo_PdS, Precio_x_hora_PdS, Horas_trabajadas_PdS, Subtotal_PdS, Descripcion_PdS)
	SELECT @Id_Solicitud, @Id_Cliente, @Id_Empleado, @Id_Tipo_de_pedido,

	(SELECT Precio_x_hora_TDP FROM Tipos_de_pedido WHERE Id_Tipo_TDP = @Id_Tipo_de_pedido),
	@Horas_trabajadas,
	(@Horas_trabajadas * (SELECT Precio_x_hora_TDP FROM Tipos_de_pedido WHERE Id_Tipo_TDP = @Id_Tipo_de_pedido)),
	@Descripcion



GO

CREATE PROCEDURE PRO_Desabilitar_Presupuesto_de_servicio
	
	@Id_Presupuesto INT
	
AS
	
	IF EXISTS(SELECT * FROM Presupuesto_de_servicio WHERE Id_Presupuesto_PdS = @Id_Presupuesto AND Estado_PdS = 1)
		
		Update Presupuesto_de_servicio Set Estado_PdS = 0 Where Id_Presupuesto_PdS = @Id_Presupuesto


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
--triggers:
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

--Datos:

--Insercion de datos Clientes :

INSERT INTO Clientes (DNI_CLI, Nombre_CLI, Apellido_CLI, NombreUsuario_CLI, Contrasenia_CLI, Direccion_CLI, Localidad_CLI, Codigo_Postal_CLI, Telefono_CLI, Email_CLI) 
SELECT '38769550', 'Angel','Simon','MrVoid','38769550','Avenida Peron 1234','Tigre','1604','1527638957','angelsimon@gmail.com' UNION
SELECT '35669550', 'Tobias','Couso','tCouso','35669550','Independencia 542','Villa Adelina','1607','1525467957','cousotobias@gmail.com' UNION
SELECT '40669550', 'Thomas','Lopez','tLopez','40669550','Avenida Marquez 5542','Boulogne','1642','1527798657','tlopez@gmail.com' UNION
SELECT '30669550', 'Miguel','Constantino','tConstantino','30669550','Yrigoyen 2345','Martinez','1609','1525897957','Miguel_c@gmail.com' UNION
SELECT '37669550', 'Gabriel','Andersson','MrAnderson','37669550','Washington 747','Vicente Lopez','1603','1585608957','sr_andersson@gmail.com' UNION
SELECT '25669550', 'Lucas','Montenegro','LMontenegro','25669550','Independencia 1492','Martinez','1609','1527637987','lmontenegro@gmail.com' UNION
SELECT '15669550', 'George','Fisher','GFisher','15669550','Av 9 de Julio 542','CABA','1000','1527345757','georgefisher@gmail.com' UNION
SELECT '14669550', 'Jose','Greco','JGreco','14669550','Piedrabuena 1515','Villa Adelina','1607','1583338957','j_greco@gmail.com' UNION
SELECT '38669550', 'Juan','Delgado','JDelgado','38669550','Azcuenaga 1542','Martinez','1609','1523856957','juandelgado94@gmail.com' UNION
SELECT '41609550', 'Jonathan','Ramirez','Jramirez','41609550','El Zorzal 254','Tortuato','1605','1527638957','Jramirez@gmail.com' UNION
SELECT '40609550', 'Carmen','Ferreyra','CFerreyra','40609550','Los Patos 2454','Tortuato','1605','1572898957','cferreyra@gmail.com' UNION
SELECT '16609550', 'Clara','Castro','CCastro','16609550','Italia 554','San Isidro','1608','1562632757','cla.castro@gmail.com' UNION
SELECT '40909550', 'Clara','Romano','CRomano','40909550','Los Olmos 673','Tortuato','1605','1527135457','clara_romano@gmail.com' UNION
SELECT '29909550', 'Paula','Ramirez','Pramirez','29909550','El Zorzal 1254','Tortuato','1605','1567808957','p_ramirez@gmail.com' UNION
SELECT '35609550', 'Camila','Gonzales','CGonzales','35609550','Alemania 2154','Martinez','1609','1527502957','camigonzales@gmail.com'

GO

--Insercion de datos Empleados :

INSERT INTO Empleados (DNI_EMP, Nombre_EMP, Apellido_EMP, NombreUsuario_EMP, Contrasenia_EMP, Direccion_EMP, Localidad_EMP , Codigo_Postal_EMP, Telefono_EMP, Email_EMP) 
SELECT '39769550', 'Lucas','Greco','Lgreco','39769550','Piedra Buena 785','Villa Adelina','1607','1564108757','lgreco@gmail.com' UNION
SELECT '54898556', 'Alejandra','Morales','DeathQ','45854932','Lomas 6575','Acasuso','4569','3802840836','DeathQ@gmail.com' UNION
SELECT '38700402', 'Jonathan','Ellacopulos','Sweetie_drops','11235813','Dreem 1948','Oblivion','1415','1800884045','Espada@gmail.com' UNION
SELECT '70038402', 'Joana','Bourdeu','Heartstrings','30897654','Salvado 133','San Icticola','1060','5646913498','lyra@gmail.com' UNION
SELECT '42586784', 'Ledesma','Matias','MatiQuerido','43089694','Caña 544','Sinai','6743','5463462489','MatiQuerido@gmail.com' UNION
SELECT '65782311', 'Masareno','Cruz','ReyDeReyes','45457644','Virey 987','Sinai','6743','5463462486','Cordero@gmail.com' UNION
SELECT '56776867', 'Angelica','Schuyler','Angelica','76560832','Fort Street 567','Schuyler','1710','3475986064','Angel@gmail.com' UNION
SELECT '56776865', 'Elizabeth','Schuyler','Elizabeth','67853456','Fort Street 567','Schuyler','1710','3475986064','Eliz@gmail.com' UNION
SELECT '56776866', 'Margarita','Schuyler','Peggy','56346727','Fort Street 567','Schuyler','1710','3475986064','Peggy69@gmail.com' UNION
SELECT '56094857', 'Samael','Gottlos','Opositor','54666327','Los Olmos 673','Tortuato','6784','8864696554','megami@gmail.com' UNION
SELECT '25456675', 'Alejandro','Julian','Julian','65674589','Cruz Santa 569','Shot','7684','6758734455','Julian854@gmail.com' UNION
SELECT '67589776', 'Marie-Joseph','Gilbert','Lafayette','54362487','Les Coupeaux 36500','Neuillay','6874','6678533487','Lafayette@gmail.com' UNION
SELECT '45366756', 'Celeste','Alameda','Staelar','56451232','Libertad 644','Babosa','6754','5671324962','Staelar@gmail.com' UNION
SELECT '45366756', 'Azul','Alameda','Sea','34564577','Libertad 644','Babosa','6754','5671324962','Staelar@gmail.com' UNION
SELECT '45366756', 'Philip','Lames','SADDEMON','65474747','Leyend 497b','Sakura','5646','8553342534','montauk@gmail.com'

GO

--Insercion de datos categoria de productos :

INSERT INTO Categoria_hardware(Id_Categoria_CAT, Descripcion_CAT)

SELECT 'PLMA', 'Placa madre.' UNION

SELECT 'PLVI', 'Placa de video.' UNION

SELECT 'DISO', 'Disco solido.' UNION

SELECT 'DIRI', 'Disco rigido.' UNION

SELECT 'FUEN', 'Fuente.' UNION

SELECT 'PROC', 'Procesador.' UNION

SELECT 'MRAM', 'Memoria RAM.' UNION

SELECT 'GABI', 'Gabinete.' UNION

SELECT 'MONI', 'Monitor.' UNION

SELECT 'TEMO', 'Teclado y Mouse.' UNION

SELECT 'SOFT', 'Software.'

GO



--Insercion de datos Productos :

INSERT INTO Hardware(Categoria_HAR, Nombre_HAR, Descripcion_HAR, Imagen_HAR, Precio_HAR) 

SELECT 
'PLMA',
'Mother MSI A68HM-E33 V2 AMD FM2+ HDMI M-ATX ',
'Caracteristicas Generales
Socket FM2, FM2+
Chipsets Principal AMD A68
Plataforma AMD
Conectividad
Salidas HDMI 1
Salidas VGA 1
Puertos SATA 4
Cantidad de slot PCI-E 16X 1
Cantidad de slot PCI 1
Cantidad de slot PCI-E 1X 1
Tecnología multi GPU -
Placa de Red Gigabit LAN 10/100/1000 Mb/s
Puertos USB 2.0 traseros 4
Puertos USB 3.0 traseros 2
Dimensiones
Factor M-ATX
Energia
Conector 24pines 1
Consumo 45 w
Conectos CPU 4pines 1
Watts máximos para CPU 140
Memoria
Cantidad de slot DDR3 2',
'~/Imagenes/1.jpg', 5450.00 UNION

SELECT 
'PLMA',
'Mother Asrock A320M-HDV R4.03 Ryzen M-ATX ',
'Caracteristicas Generales
Socket AM4 A-Series, AM4 APU 1th Gen, AM4 APU 2th Gen, AM4 Ryzen 1th Gen, AM4 Ryzen 2th Gen, AM4 Ryzen 3th Gen
Chipsets Principal AMD A320
Plataforma AMD
Conectividad
Salidas HDMI 1
Salidas DVI 1
Salidas VGA 1
Puertos SATA 4
Cantidad de slot m2 1
Cantidad de slot PCI-E 16X 1
Cantidad de slot PCI-E 1X 1
Tecnología multi GPU -
Placa de Red Gigabit LAN 10/100/1000 Mb/s
Puertos USB 2.0 traseros 4
Puertos USB 3.0 traseros 2
Dimensiones
Factor M-ATX
Energia
Conector 24pines 1
Consumo 50 w
Conectos CPU 4pines 1
Watts máximos para CPU 105
Memoria
Cantidad de slot DDR4 2
Sonido
Placa de sonido 7.1 CH HD Audio (Realtek ALC887 Audio Codec) ',
'~/Imagenes/2.jpg', 6240.00 UNION

SELECT 
'PLMA',
'Mother Supermicro H270 M.2 M-ATX ',
'Caracteristicas Generales
Socket 1151 Kaby Lake
Chipsets Principal Intel H270
Plataforma Intel
Conectividad
Salidas HDMI 1
Salidas DVI 1
Salidas Display Ports 1
Puertos SATA 6
Cantidad de slot m2 1
Cantidad de slot PCI-E 16X 1
Cantidad de slot PCI-E 1X 2
Placa de Red Gigabit LAN 10/100/1000 Mb/s
Puertos USB 2.0 traseros 4
Puertos USB 3.0 traseros 2
Dimensiones
Factor M-ATX
Energia
Conector 24pines 1
Consumo 35 w
Conectos CPU 4pines 1
Conector CPU 4pines Plus 1
Watts máximos para CPU 65
Memoria
Cantidad de slot DDR4 4 ',
'~/Imagenes/3.jpg', 6550.00 UNION

SELECT 
'PLVI',
'Placa de Video GeForce MSI GT 710 1GB LP Disipador ',
'Caracteristicas Generales
Tipo pcie
Chipset GPU GT 710
Puente para SLI/CroosfireX -
Características especiales Otras tecnologías
Conectividad
VGA 1
DVI digital 1
HDMI 1
Dimensiones
Ancho de la placa 70 mm
Largo de la placa 150 mm
Espesor de la placa 1 slots
Energia
Consumo 50 W
Watts totales recomendados 250 W
Extras
Velocidad del Core Base 954 Mhz
Velocidad del Core Turbo 954 Mhz
Tipo de memoria GDDR3
Capacidad de Memoria 1024 MB
Velocidad Memoria 1600 Mhz
Interface de memoria 64 bits
Tipos de procesos CUDA
Cantidad de procesos 64 ',
'~/Imagenes/4.jpg', 5620.00 UNION

SELECT 
'PLVI',
'Placa de Video Asrock RX 570 8GB OC Phantom Gaming D ',
'Caracteristicas Generales
Tipo pcie
Chipset GPU RX 570
Puente para SLI/CroosfireX Crossfire
Características especiales Otras tecnologías
Conectividad
DVI digital 1
HDMI 1
DisplayPorts 3
Dimensiones
Ancho de la placa 127 mm
Largo de la placa 236 mm
Espesor de la placa 2 slots
Energia
Consumo 150 W
Watts totales recomendados 500 W
Cantidad PCIE de 6 pines 1
Coolers y Disipadores
Cantidad de coolers fan 2
Extras
Velocidad del Core Base 1270 Mhz
Velocidad del Core Turbo 1270 Mhz
Tipo de memoria GDDR5
Capacidad de Memoria 8192 MB
Velocidad Memoria 7000 Mhz
Interface de memoria 256 bits
Tipos de procesos Stream
Cantidad de procesos 2048 ',
'~/Imagenes/5.jpg', 20340.00 UNION

SELECT 
'PLVI',
'Placa de Video Zotac GeForce GTX 1650 4GB GDDR5 OC + ',
'Caracteristicas Generales
Tipo pcie
Chipset GPU GTX 1650
Puente para SLI/CroosfireX -
Características especiales Ray Tracing por software
Conectividad
DVI digital 1
HDMI 1
DisplayPorts 1
Dimensiones
Ancho de la placa 112 mm
Largo de la placa 151 mm
Espesor de la placa 2 slots
Energia
Consumo 75 W
Watts totales recomendados 300 W
Coolers y Disipadores
Cantidad de coolers fan 1
Extras
Velocidad del Core Base 1695 Mhz
Velocidad del Core Turbo 1695 Mhz
Tipo de memoria GDDR5
Capacidad de Memoria 4096 MB
Velocidad Memoria 8000 Mhz
Interface de memoria 192 bits
Tipos de procesos CUDA
Cantidad de procesos 896 ',
'~/Imagenes/6.jpg', 22300.00 UNION

SELECT 
'DISO',
'Disco Solido SSD M.2 HP S700 120GB 560MB/s ',
'Caracteristicas Generales
Tipo de conexión M2
Consumo 2 W
Tipo de disco Sólido
Almacenamiento
Capacidad 120 GB
Rendimiento
Tasa de transferencia 6 Gb/s
Vel Lectura Secuencial 555 MB/s
Vel Escritura Secuencial 470 MB/s
Vel Lectura Random 35000 IOPS
Vel Escritura Random 75000 IOPS
Terabytes Written 70 TB
Dimensiones
Factor M2 ',
'~/Imagenes/7.jpg', 3240.00 UNION

SELECT 
'DISO',
'Disco Sólido SSD Adata 120GB SU650SS 520MB/s ',
'Caracteristicas Generales
Tipo de conexión SATA
Consumo 5 W
Tipo de disco Sólido
Almacenamiento
Capacidad 120 GB
Rendimiento
Memoria Cache 500 MB
Tasa de transferencia 6 Gb/s
Vel Lectura Secuencial 520 MB/s
Vel Escritura Secuencial 450 MB/s
Vel Lectura Random 20000 IOPS
Vel Escritura Random 75000 IOPS
Vida Útil 2000000 Horas
Terabytes Written 70 TB
Dimensiones
Factor 2.5 ',
'~/Imagenes/8.jpg', 3280.00 UNION

SELECT 
'DISO',
'Disco Sólido SSD WD 120GB GREEN 540MB/s ',
'Caracteristicas Generales
Tipo de conexión SATA
Consumo 5 W
Tipo de disco Sólido
Almacenamiento
Capacidad 120 GB
Rendimiento
Memoria Cache 128 MB
Tasa de transferencia 6 Gb/s
Vel Lectura Secuencial 540 MB/s
Vel Escritura Secuencial 405 MB/s
Vel Lectura Random 37000 IOPS
Vel Escritura Random 63000 IOPS
Vida Útil 1200000 Horas
Terabytes Written 40 TB
Dimensiones
Factor 2.5 ',
'~/Imagenes/9.jpg', 3290.00 UNION

SELECT 
'DIRI',
'Disco Rígido WD 1TB BLUE 64MB SATA 6.0GB/s ',
'Caracteristicas Generales
Tipo de conexión SATA
Consumo 30 W
Tipo de disco Mecánico
Almacenamiento
Capacidad 1000 GB
Rendimiento
Velocidad de rotación 7200 rmp
Memoria Cache 64 MB
Tasa de transferencia 6 Gb/s
Dimensiones
Factor 3.5 ',
'~/Imagenes/10.jpg', 4660.00 UNION

SELECT 
'DIRI',
'Disco Rigido Toshiba 1TB 64MB 7.2K RPM SATA 6Gb/s ',
'Caracteristicas Generales
Tipo de conexión SATA
Consumo 6 W
Tipo de disco Mecánico
Almacenamiento
Capacidad 1000 GB
Rendimiento
Velocidad de rotación 7200 rmp
Memoria Cache 64 MB
Tasa de transferencia 6 Gb/s
Dimensiones
Factor 3.5 ',
'~/Imagenes/11.jpg', 4970.00 UNION

SELECT 
'DIRI',
'Disco Rígido Seagate 1TB Barracuda 64MB SATA 6GB/s',
'Caracteristicas Generales
Tipo de conexión SATA
Consumo 10 W
Tipo de disco Mecánico
Almacenamiento
Capacidad 1000 GB
Rendimiento
Velocidad de rotación 7200 rmp
Memoria Cache 64 MB
Tasa de transferencia 6 Gb/s
Dimensiones
Factor 3.5 ',
'~/Imagenes/12.jpg', 5190.00 UNION

SELECT 
'FUEN',
'Fuente LNZ 550W Black Mod PX550-FS ',
'Caracteristicas Generales
Formato ATX
Watts Nominal 550 W
Watts Reales 199 W
Tipo de cableado Cables fijos
Ampers en linea +12V 32 A
Color Negro
Iluminación del cooler Sin Luz
Cableado
Conector 24 pines Sí
Conector CPU 4 pines 1
Conexiones Sata 4
Conexiones Molex 2
Conexiones Floppy 1
Detalle del Kit
Incluye Cable a 220V Sí ',
'~/Imagenes/13.jpg', 1410.00 UNION

SELECT 
'FUEN',
'Fuente Segotep 500W ATX ',
'Caracteristicas Generales
Formato ATX
Watts Nominal 500 W
Watts Reales 199 W
Tipo de cableado Cables fijos
Ampers en linea +12V 23 A
Color Negro
Cableado
Conector 24 pines Sí
Conector CPU 4 pines 1
Conexiones Sata 2
Conexiones Molex 2
Conexiones Floppy 1
Detalle del Kit
Incluye Cable a 220V Sí ',
'~/Imagenes/14.jpg', 1660.00 UNION

SELECT 
'FUEN',
'Fuente LNZ 650W Black Mod ZX650-LS Fan Red ',
'Caracteristicas Generales
Formato ATX
Watts Nominal 650 W
Watts Reales 450 W
Compatible con posición inferior Sí
Tipo de cableado Cables fijos
Ampers en linea +12V 36 A
Color Negro
Cableado
Conector 24 pines Sí
Conector CPU 4 pines 1
Conector CPU 4pines plus 1
Conector pcie 6 pines 1
Conexiones Sata 4
Conexiones Molex 3
Conexiones Floppy 1
Detalle del Kit
Incluye Cable a 220V Sí ',
'~/Imagenes/15.jpg', 3780.00 UNION

SELECT 
'PROC',
'Procesador AMD A6 7480 3.5GHz FM2+ Dual Core 65W',
'Caracteristicas Generales
modelo A6 7480
Familia AMD A-Series
Núcleos 2
Hilos 2
Frecuencia 3.5 Ghz
Frecuencia Turbo 4 GHz
Proceso de Fabricación 28 nm
Chipset GPU Radeon R5
socket FM2+
Coolers y Disipadores
Incluye Cooler CPU Sí
TDP 65 W
Memoria
L2 1 MB',
'~/Imagenes/16.jpg', 4830.00 UNION

SELECT 
'PROC',
'Procesador AMD A8 9600 APU 3.4Ghz AM4 + GPU Radeon R7 ',
'Caracteristicas Generales
modelo AMD A8 9600
Familia AMD A-Series
Núcleos 4
Hilos 4
Frecuencia 3.1 Ghz
Frecuencia Turbo 3 GHz
Proceso de Fabricación 28 nm
Chipset GPU Radeon R7 X6
socket AM4 A-Series
Coolers y Disipadores
Incluye Cooler CPU Sí
TDP 65 W
Memoria
L2 2 MB',
'~/Imagenes/17.jpg', 7300.00 UNION

SELECT 
'PROC',
'Procesador AMD RYZEN 7 1700X 8-Core 3.8GHz Turbo AM4 95W SIN COOLER ',
'Caracteristicas Generales
modelo Ryzen 7 1700X
Familia AMD RYZEN 7
Núcleos 8
Hilos 16
Frecuencia 3.4 Ghz
Frecuencia Turbo 4 GHz
Proceso de Fabricación 14 nm
Chipset GPU -
socket AM4 Ryzen 1th Gen
Coolers y Disipadores
TDP 95 W
Memoria
L1 0.768 MB
L2 4 MB
L3 16 MB',
'~/Imagenes/18.jpg', 18740.00 UNION

SELECT 
'MRAM',
'Memoria Team DDR3 4GB 1600MHz Elite+ Black ',
'Caracteristicas Generales
Capacidad 4 GB
Velocidad 1600 Mhz
Tipo DDR3
Cantidad de memorias 1
Latencia 11 CL
Voltaje 1.5 V
Coolers y Disipadores
Disipador Sí ',
'~/Imagenes/19.jpg', 2810.00 UNION

SELECT 
'MRAM',
'Memoria Team DDR4 4GB 3200MHz Elite Plus ',
'Caracteristicas Generales
Capacidad 4 GB
Velocidad 3200 Mhz
Tipo DDR4
Cantidad de memorias 1
Latencia 22 CL
Voltaje 1.2 V
Coolers y Disipadores
Disipador Sí ',
'~/Imagenes/20.jpg', 3250.00 UNION

SELECT 
'MRAM',
'Memoria Crucial DDR4 4GB 2400MHz Ballistix Sport LT WHITE ',
'Caracteristicas Generales
Capacidad 4 GB
Velocidad 2400 Mhz
Tipo DDR4
Cantidad de memorias 1
Latencia 16 CL
Coolers y Disipadores
Disipador Sí ',
'~/Imagenes/21.jpg', 3320.00 UNION

SELECT 
'GABI',
'Gabinete Gamemax H601 BR Black & Red M-ATX FAN 1 x 120mm ',
'Caracteristicas Generales
Factor Mother ITX, M-ATX
Con ventana Sí
Tipo de ventana Acrílico
Colores Rojo, Negro
Conectividad
USB 3.0 Frontal 2
Audio HD frontal Sí
Dimensiones
Ancho 188 mm
Alto 412 mm
Profundidad 455 mm
Largo máximo VGA 385 mm
Altura Máxima del Cooler CPU 155 mm
Unidades soportadas
Unidades 2.5'' soportadas 2
Unidades 3.5'' soportadas 2
Energia
Tipo de fuente admitida ATX
Coolers y Disipadores
Coolers Fan de 120mm soportados 6
Coolers Fan de 120mm incluidos 1
Soporte Radiador 240mm 1
Espacio para radiador water Sí
Accesorios
Cover para la fuente Sí ',
'~/Imagenes/22.jpg', 3690.00 UNION

SELECT 
'GABI',
'Gabinete Sentey K20 Lite + 4 Coolers RGB Vidrio Templado ',
'Caracteristicas Generales
Factor Mother ITX, M-ATX, ATX
Con ventana Sí
Tipo de ventana Vidrio templado
Colores Negro
Conectividad
USB 2.0 Frontal 2
USB 3.0 Frontal 1
Audio HD frontal Sí
Dimensiones
Ancho 183 mm
Alto 443 mm
Profundidad 400 mm
Largo máximo VGA 349 mm
Altura Máxima del Cooler CPU 166 mm
Unidades soportadas
Unidades 2.5'' soportadas 2
Unidades 3.5'' soportadas 2
Energia
Tipo de fuente admitida ATX
Coolers y Disipadores
Coolers Fan de 120mm soportados 6
Coolers Fan de 120mm incluidos 4
Coolers Fan de 140mm soportados 2
Iluminación RGB
Controlador de Fans interno
Controlador de la iluminación Sí
Extras
Sistema de conexión RGB Propio del gabinete ',
'~/Imagenes/23.jpg', 6920.00 UNION

SELECT 
'GABI',
'Gabinete Thermaltake H100 Tempered Glass MTB ATX ',
'Caracteristicas Generales
Factor Mother ITX, M-ATX, ATX
Con ventana Sí
Tipo de ventana Vidrio templado
Colores Negro
Conectividad
Audio HD frontal Sí
Dimensiones
Ancho 210 mm
Alto 454 mm
Profundidad 416 mm
Largo máximo VGA 320 mm
Altura Máxima del Cooler CPU 180 mm
Unidades soportadas
Unidades 2.5'' soportadas 3
Unidades 3.5'' soportadas 2
Energia
Tipo de fuente admitida ATX
Coolers y Disipadores
Coolers Fan de 120mm soportados 6
Coolers Fan de 140mm soportados 5
Soporte Radiador 240mm 2
Soporte Radiador 280mm 1
Espacio para radiador water Sí
Accesorios
Cover para la fuente Sí
Extras
Sistema de conexión RGB Propio del gabinete ',
'~/Imagenes/24.jpg', 7000.00 UNION

SELECT 
'MONI',
'Monitor Philips 19" VGA HDMI  ',
'Caracteristicas Generales
Tipo de ilumunación LCD
Tipo de panel TN
Conectividad
HDMI 1
VGA 1
Dimensiones
Ancho 437 mm
Alto 273 mm
Espesor 48 mm
Energia
Consumo Máximo 10 W
Tipo de fuente interna
Pantalla
Pulgadas 19 ''
Pulgadas Visibles 18.5 ''
Resolución Máxima 1366x768
Máxima frecuencia 60 Hz
Cantidad de colores 16.7 M
Tiempo de respuesta 5 ms
Angulo de visión horizontal 90 º
Angulo de visión vertical 65 º
Vida útil del backlight 30000 Horas
Radio de contraste estático 700 :1
Radio de contraste dinamico 5 M:1
Detalle del Kit
Pie desmontable Sí
Extras
VESA 100x100
Peso sin base 1.94 Kg',
'~/Imagenes/25.jpg', 13780.00 UNION

SELECT 
'MONI',
'Monitor LG LED 19'' 19M38A-B VGA ',
'Caracteristicas Generales
Tipo de ilumunación LCD-LED
Tipo de panel TN
Conectividad
VGA 1
Dimensiones
Ancho 441 mm
Alto 278 mm
Espesor 57 mm
Energia
Consumo Máximo 13 W
Tipo de fuente externa
Pantalla
Pulgadas 19 ''
Pulgadas Visibles 18.5 ''
Resolución Máxima 1366x768
Máxima frecuencia 60 Hz
Cantidad de colores 16.7 M
Tiempo de respuesta 5 ms
Angulo de visión horizontal 90 º
Angulo de visión vertical 65 º
Radio de contraste estático 600 :1
Radio de contraste dinamico 5 M:1
Detalle del Kit
Pie desmontable Sí
Accesorios
Cables includos VGA
Extras
VESA 75x75
Peso sin base 1.9 Kg',
'~/Imagenes/26.jpg', 13910.00 UNION

SELECT 
'MONI',
'Monitor Acer 20" V206HQL VGA',
'Caracteristicas Generales
Tipo de ilumunación LED
Tipo de panel TN
Conectividad
VGA 1
Dimensiones
Ancho 463 mm
Alto 362 mm
Espesor 50 mm
Energia
Consumo Máximo 14 W
Tipo de fuente interna
Pantalla
Pulgadas 20 ''
Pulgadas Visibles 19.5 ''
Resolución Máxima 1366x768
Máxima frecuencia 60 Hz
Cantidad de colores 16.7 M
Tiempo de respuesta 5 ms
Angulo de visión horizontal 90 º
Angulo de visión vertical 65 º
Radio de contraste estático 1000 :1
Radio de contraste dinamico 1000000 M:1
Detalle del Kit
Pie desmontable Sí
Accesorios
Cables includos VGA
Extras
VESA 100x100
Peso sin base 2.5 Kg',
'~/Imagenes/27.jpg', 14850.00 UNION

SELECT 
'TEMO',
'Teclado + Mouse Logitech Wireless MK235 ',
'-',
'~/Imagenes/28.jpg', 1940.00 UNION

SELECT 
'TEMO',
'Kit Marvo Scorpion KM409 Teclado + Mouse RGB Rainbow',
'-',
'~/Imagenes/29.jpg', 1980.00 UNION

SELECT 
'TEMO',
'Combo Teclado + Mouse Logitech MK220 Wireless ',
'-',
'~/Imagenes/30.jpg', 2450.00 UNION

SELECT 
'SOFT',
'Windows 10 Home',
'Minimum system requirements
License for:
1 PC
Processor:
1 GHz or faster
Architecture:
64 or 32 Bits
Minimum RAM:
1 GB (32-bit) / 2 GB (64-bit)
Minimum HDD:
16 GB (32-bit) / 20 GB (64-bit)

Beneficios
Software Genuino
Reinstalable
Multilenguaje
Soporte 24/7
No expira
Garantía de por vida
Actualizaciones permanentes
Archivos de instalación
Clave de producto
',
'~/Imagenes/31.jpg', 4900.00 UNION

SELECT 
'SOFT',
'Windows 10 PRO',
'Minimum system requirements
License for:
1 PC
Processor:
1 GHz or faster
Architecture:
64 or 32 Bits
Minimum RAM:
1 GB (32-bit) / 2 GB (64-bit)
Minimum HDD:
16 GB (32-bit) / 20 GB (64-bit)

Beneficios
Software Genuino
Reinstalable
Multilenguaje
Soporte 24/7
No expira
Garantía de por vida
Actualizaciones permanentes
Archivos de instalación
Clave de producto
',
'~/Imagenes/32.jpg', 5250.00 UNION

SELECT 
'SOFT',
'Linux Mint 18.2 Sonya',
'Requisitos para instalar Linux Mint 18.2 Sonya:

512MB RAM (1GB recomendado).
9GB de espacio libre en disco (20GB recomendado).
Tarjeta gráfica 800×600 de resolución mínima (1024×768 recomendada).
DVD drive o puerto USB
',
'~/Imagenes/33.jpg', 0.00 UNION

SELECT 
'SOFT',
'Linux Ubuntu 19.10',
'Requisitos para instalar Linux Ubuntu 19.10:

Procesador dual core de 2 GHz o superior
Memoria de sistema de 2 GB
25 GB de espacio libre en el disco duro
Ya sea una unidad de DVD o un puerto USB para los medios del instalador
',
'~/Imagenes/34.jpg', 0.00 



GO

--Insercion de datos categoria de tipos de pedido :

--1
EXEC PRO_ingresar_datos_Tipos_de_pedido 
'Limpieza de componentes.',
1000.00
GO

--2
EXEC PRO_ingresar_datos_Tipos_de_pedido 
'Restauracion de fabrica.',
1000.00
GO


--3
EXEC PRO_ingresar_datos_Tipos_de_pedido 
'Armado.',
1000.00
GO


--4
EXEC PRO_ingresar_datos_Tipos_de_pedido 
'Instalacion del sistema operativo.',
1000.00
GO


--5
EXEC PRO_ingresar_datos_Tipos_de_pedido 
'Cambio de componentes.',
1000.00
GO

--6
EXEC PRO_ingresar_datos_Tipos_de_pedido 
'Recuperacion de datos del disco duro.',
1000.00
GO

--7
EXEC PRO_ingresar_datos_Tipos_de_pedido 
'Inspeccion.',
1000.00
GO

--8
EXEC PRO_ingresar_datos_Tipos_de_pedido 
'Gastos administrativos.',
1000.00
GO

--9
EXEC PRO_ingresar_datos_Tipos_de_pedido 
'Personalizacion.',
1000.00
GO

--10
EXEC PRO_ingresar_datos_Tipos_de_pedido 
'Transporte.',
1000.00
GO


--Insercion de datos categoria de actividades:

EXEC PRO_ingresar_datos_Actividades
1,
1,
1,
'Limpieza de una computadora de oficina que posee cerca de 25 años.',
2

GO

EXEC PRO_ingresar_datos_Actividades
1,
1,
4,
'Actualizar el sistema operativo de W98 a Wxp.',
3

GO

EXEC PRO_ingresar_datos_Actividades
1,
1,
5,
'Se cambia el disco duro de uno de 100gb a uno a 500gb.',
2

GO

EXEC PRO_ingresar_datos_Actividades
2,
2,
5,
'Cambio de gabinete.',
1

GO

EXEC PRO_ingresar_datos_Actividades
2,
2,
7,
'Revision del estado del equipo.',
1

GO


EXEC PRO_ingresar_datos_Actividades
2,
2,
9,
'Trabajo con aerografo sobre el gabinete.',
4

GO

EXEC PRO_ingresar_datos_Actividades
3,
3,
6,
'Recuperar los datos de un disco rayado.',
6

GO

EXEC PRO_ingresar_datos_Actividades
7,
4,
3,
'Armado de una CPU gamer.',
8

GO

EXEC PRO_ingresar_datos_Actividades
3,
3,
4,
'Insalacion de doble sistema operativo, linux mint y windows 10.',
6

GO

EXEC PRO_ingresar_datos_Actividades
3,
3,
9,
'Imprecion digital sobre el gabinete.',
6

GO

EXEC PRO_ingresar_datos_Actividades
3,
3,
10,
'Transporte desde el taller a la recidencia del cliente.',
3

GO

EXEC PRO_ingresar_datos_Actividades
4,
4,
6,
'Recuperacion de los datos de un disco duro.',
5

GO

--Insercion de datos categoria de Ventas:

EXEC PRO_ingresar_datos_Ventas 
1
GO

EXEC PRO_ingresar_datos_Ventas 
2
GO

EXEC PRO_ingresar_datos_Ventas 
3
GO

EXEC PRO_ingresar_datos_Ventas 
4
GO

EXEC PRO_ingresar_datos_Ventas 
5
GO

EXEC PRO_ingresar_datos_Ventas 
7
GO

--Insercion de datos categoria de Detalles de ventas x Hardware:

EXEC PRO_ingresar_datos_Detalles_de_ventas_x_Hardware
5,
1,
1
GO

EXEC PRO_ingresar_datos_Detalles_de_ventas_x_Hardware
6,
2,
1
GO

EXEC PRO_ingresar_datos_Detalles_de_ventas_x_Hardware
6,
5,
1
GO

EXEC PRO_ingresar_datos_Detalles_de_ventas_x_Hardware
6,
14,
1
GO

EXEC PRO_ingresar_datos_Detalles_de_ventas_x_Hardware
6,
17,
1
GO

EXEC PRO_ingresar_datos_Detalles_de_ventas_x_Hardware
6,
20,
2
GO

EXEC PRO_ingresar_datos_Detalles_de_ventas_x_Hardware
6,
23,
1
GO

EXEC PRO_ingresar_datos_Detalles_de_ventas_x_Hardware
6,
26,
2
GO

EXEC PRO_ingresar_datos_Detalles_de_ventas_x_Hardware
3,
25,
1
GO

EXEC PRO_ingresar_datos_Detalles_de_ventas_x_Hardware
3,
30,
1
GO

--Insercion de datos categoria de Detalles de ventas x Actividades:

EXEC PRO_ingresar_datos_Detalles_de_ventas_x_Actividades
1,
1,
''
GO

EXEC PRO_ingresar_datos_Detalles_de_ventas_x_Actividades
1,
2,
''
GO

EXEC PRO_ingresar_datos_Detalles_de_ventas_x_Actividades
1,
3,
''
GO

EXEC PRO_ingresar_datos_Detalles_de_ventas_x_Actividades
2,
4,
''
GO

EXEC PRO_ingresar_datos_Detalles_de_ventas_x_Actividades
2,
5,
''
GO

EXEC PRO_ingresar_datos_Detalles_de_ventas_x_Actividades
2,
6,
''
GO

EXEC PRO_ingresar_datos_Detalles_de_ventas_x_Actividades
6,
8,
''
GO

EXEC PRO_ingresar_datos_Detalles_de_ventas_x_Actividades
3,
7,
''
GO

EXEC PRO_ingresar_datos_Detalles_de_ventas_x_Actividades
3,
9,
''
GO

EXEC PRO_ingresar_datos_Detalles_de_ventas_x_Actividades
3,
10,
''
GO

EXEC PRO_ingresar_datos_Detalles_de_ventas_x_Actividades
3,
11,
''
GO

EXEC PRO_ingresar_datos_Detalles_de_ventas_x_Actividades
4,
12,
''
GO

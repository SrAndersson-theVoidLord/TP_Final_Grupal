use Adecom
go

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
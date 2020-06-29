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


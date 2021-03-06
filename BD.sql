USE [BDPrograAvanzada]
GO
/****** Object:  Table [dbo].[Bitacora]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bitacora](
	[IdBitacora] [int] NOT NULL,
	[Controlador] [varchar](50) NOT NULL,
	[Accion] [varchar](50) NOT NULL,
	[Error] [varchar](max) NOT NULL,
	[Tipo] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[IdUsuario] [int] NOT NULL,
 CONSTRAINT [PK_Bitacora] PRIMARY KEY CLUSTERED 
(
	[IdBitacora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Canton]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Canton](
	[Provincia] [char](1) NOT NULL,
	[Canton] [char](2) NOT NULL,
	[Nombre] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Provincia] ASC,
	[Canton] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Deposito]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deposito](
	[IdDeposito] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Monto] [money] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Telefono] [varchar](20) NOT NULL,
	[Estado] [char](2) NOT NULL,
 CONSTRAINT [PK_Deposito] PRIMARY KEY CLUSTERED 
(
	[IdDeposito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Distrito]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Distrito](
	[Provincia] [char](1) NOT NULL,
	[Canton] [char](2) NOT NULL,
	[Distrito] [char](2) NOT NULL,
	[Nombre] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Provincia] ASC,
	[Canton] ASC,
	[Distrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empresa]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empresa](
	[IdEmpresa] [int] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[IdTipoIdentificacion] [int] NOT NULL,
	[Identificacion] [varchar](30) NOT NULL,
	[Telefono] [varchar](20) NOT NULL,
	[Contacto] [varchar](50) NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Empresa] PRIMARY KEY CLUSTERED 
(
	[IdEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Linea]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Linea](
	[IdLinea] [int] NOT NULL,
	[IdEmpresa] [int] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[CodigoCTP] [varchar](50) NOT NULL,
	[Provincia] [char](1) NOT NULL,
	[Canton] [char](2) NOT NULL,
	[Distrito] [char](2) NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Linea_1] PRIMARY KEY CLUSTERED 
(
	[IdLinea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LineaTarifa]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LineaTarifa](
	[IdLineaTarifa] [int] NOT NULL,
	[IdLinea] [int] NOT NULL,
	[IdTarifa] [int] NOT NULL,
 CONSTRAINT [PK_LineaTarifa] PRIMARY KEY CLUSTERED 
(
	[IdLineaTarifa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LineaUnidad]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LineaUnidad](
	[IdLineaUnidad] [int] NOT NULL,
	[IdUnidad] [int] NOT NULL,
	[IdLinea] [int] NOT NULL,
 CONSTRAINT [PK_LineaUnidad] PRIMARY KEY CLUSTERED 
(
	[IdLineaUnidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pago]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pago](
	[IdPago] [int] NOT NULL,
	[IdEmpresa] [int] NOT NULL,
	[IdUnidad] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Monto] [money] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Latitud] [decimal](18, 6) NULL,
	[Longitud] [decimal](18, 6) NULL,
	[Estado] [char](2) NOT NULL,
 CONSTRAINT [PK_Pago] PRIMARY KEY CLUSTERED 
(
	[IdPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincia](
	[Provincia] [char](1) NOT NULL,
	[Nombre] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Provincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[IdRol] [int] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tarifa]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tarifa](
	[IdTarifa] [int] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[Monto] [money] NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Tarifa] PRIMARY KEY CLUSTERED 
(
	[IdTarifa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoIdentificacion]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoIdentificacion](
	[IdTipoIdentificacion] [int] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_TipoIdentificacion] PRIMARY KEY CLUSTERED 
(
	[IdTipoIdentificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoPlaca]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoPlaca](
	[IdTipoPlaca] [int] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_TipoPlaca] PRIMARY KEY CLUSTERED 
(
	[IdTipoPlaca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unidad]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unidad](
	[IdUnidad] [int] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[IdTipoPlaca] [int] NOT NULL,
	[Placa] [varchar](50) NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Unidad] PRIMARY KEY CLUSTERED 
(
	[IdUnidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Nombre2] [varchar](50) NULL,
	[Apellido1] [varchar](50) NOT NULL,
	[Apellido2] [varchar](50) NOT NULL,
	[IdTipoIdentificacion] [int] NOT NULL,
	[Identificacion] [varchar](30) NOT NULL,
	[Saldo] [money] NOT NULL,
	[Telefono] [varchar](20) NOT NULL,
	[Correo] [varchar](50) NOT NULL,
	[Clave] [varchar](50) NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuarioRol]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioRol](
	[IdUsuarioRol] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[IdRol] [int] NOT NULL,
 CONSTRAINT [PK_UsuarioRol] PRIMARY KEY CLUSTERED 
(
	[IdUsuarioRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Bitacora] ([IdBitacora], [Controlador], [Accion], [Error], [Tipo], [Fecha], [IdUsuario]) VALUES (1, N'Pago', N'Realizar Pago', N'Pago realizado con exito', 0, CAST(N'2020-08-25T00:51:28.010' AS DateTime), 4)
INSERT [dbo].[Bitacora] ([IdBitacora], [Controlador], [Accion], [Error], [Tipo], [Fecha], [IdUsuario]) VALUES (2, N'Pago', N'Realizar Pago', N'Pago realizado con exito', 0, CAST(N'2020-08-25T00:51:31.457' AS DateTime), 4)
INSERT [dbo].[Bitacora] ([IdBitacora], [Controlador], [Accion], [Error], [Tipo], [Fecha], [IdUsuario]) VALUES (3, N'Pago', N'Realizar Pago', N'Pago realizado con exito', 0, CAST(N'2020-08-25T00:54:52.680' AS DateTime), 6)
INSERT [dbo].[Bitacora] ([IdBitacora], [Controlador], [Accion], [Error], [Tipo], [Fecha], [IdUsuario]) VALUES (4, N'Usuario', N'Editar usuario', N'Se ha editado un usuario', 0, CAST(N'2020-08-25T00:55:37.030' AS DateTime), 1)
INSERT [dbo].[Bitacora] ([IdBitacora], [Controlador], [Accion], [Error], [Tipo], [Fecha], [IdUsuario]) VALUES (5, N'Usuario', N'Editar usuario', N'Se ha editado un usuario', 0, CAST(N'2020-08-25T00:56:15.920' AS DateTime), 1)
GO
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'1', N'01', N' SAN JOSE')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'1', N'02', N' ESCAZU')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'1', N'03', N' DESAMPARADOS')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'1', N'04', N' PURISCAL')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'1', N'05', N' TARRAZU')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'1', N'06', N' ASERRI')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'1', N'07', N' MORA')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'1', N'08', N' GOICOECHEA')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'1', N'09', N' SANTA ANA')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'1', N'10', N' ALAJUELITA')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'1', N'11', N' CORONADO')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'1', N'12', N' ACOSTA')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'1', N'13', N' TIBAS')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'1', N'14', N' MORAVIA')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'1', N'15', N' MONTES DE OCA')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'1', N'16', N' TURRUBARES')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'1', N'17', N' DOTA')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'1', N'18', N' CURRIDABAT')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'1', N'19', N' PEREZ ZELEDON')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'1', N'20', N' LEON CORTES')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'2', N'01', N' ALAJUELA')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'2', N'02', N' SAN RAMON')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'2', N'03', N'  GRECIA')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'2', N'04', N' SAN MATEO')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'2', N'05', N' ATENAS')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'2', N'06', N' NARANJO')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'2', N'07', N' PALMARES')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'2', N'08', N' POAS')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'2', N'09', N' OROTINA')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'2', N'10', N' SAN CARLOS')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'2', N'11', N' ALFARO RUIZ')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'2', N'12', N' VALVERDE VEGA')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'2', N'13', N' UPALA')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'2', N'14', N' LOS CHILES')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'2', N'15', N' GUATUSO')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'2', N'16', N' RIO CUARTO')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'3', N'01', N' CARTAGO')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'3', N'02', N' PARAISO')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'3', N'03', N' LA UNION')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'3', N'04', N' JIMENEZ')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'3', N'05', N' TURRIALBA')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'3', N'06', N' ALVARADO')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'3', N'07', N' OREAMUNO')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'3', N'08', N' EL GUARCO')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'4', N'01', N' HEREDIA')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'4', N'02', N' BARVA')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'4', N'03', N' SANTO DOMINGO')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'4', N'04', N' SANTA BARBARA')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'4', N'05', N' SAN RAFAEL')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'4', N'06', N' SAN ISIDRO')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'4', N'07', N' BELEN')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'4', N'08', N' FLORES')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'4', N'09', N' SAN PABLO')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'4', N'10', N' SARAPIQUI')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'5', N'01', N' LIBERIA')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'5', N'02', N' NICOYA')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'5', N'03', N' SANTA CRUZ')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'5', N'04', N' BAGACES')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'5', N'05', N' CARRILLO')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'5', N'06', N' CAÑAS')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'5', N'07', N' ABANGARES')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'5', N'08', N' TILARAN')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'5', N'09', N' NANDAYURE')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'5', N'10', N' LA CRUZ')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'5', N'11', N' HOJANCHA')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'6', N'01', N' PUNTARENAS')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'6', N'02', N' ESPARZA')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'6', N'03', N' BUENOS AIRES')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'6', N'04', N' MONTES DE ORO')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'6', N'05', N' OSA')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'6', N'06', N' AGUIRRE')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'6', N'07', N' GOLFITO')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'6', N'08', N' COTO BRUS')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'6', N'09', N' PARRITA')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'6', N'10', N' CORREDORES')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'6', N'11', N' GARABITO')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'7', N'01', N' LIMON')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'7', N'02', N' POCOCI')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'7', N'03', N' SIQUIRRES')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'7', N'04', N' TALAMANCA')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'7', N'05', N' MATINA')
INSERT [dbo].[Canton] ([Provincia], [Canton], [Nombre]) VALUES (N'7', N'06', N' GUACIMO')
GO
INSERT [dbo].[Deposito] ([IdDeposito], [IdUsuario], [Monto], [Fecha], [Telefono], [Estado]) VALUES (1, 4, 1000.0000, CAST(N'2020-08-25T00:51:03.517' AS DateTime), N'88888888', N'PG')
INSERT [dbo].[Deposito] ([IdDeposito], [IdUsuario], [Monto], [Fecha], [Telefono], [Estado]) VALUES (2, 6, 2000.0000, CAST(N'2020-08-25T00:54:15.100' AS DateTime), N'88888888', N'PG')
GO
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'01', N'01', N'Carmen')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'01', N'02', N'Merced')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'01', N'03', N'Hospital')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'01', N'04', N'Catedral')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'01', N'05', N'Zapote')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'01', N'06', N'San Francisco de Dos Ríos')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'01', N'07', N'Uruca')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'01', N'08', N'Mata Redonda')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'01', N'09', N'Pavas')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'01', N'10', N'Hatillo')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'01', N'11', N'San Sebastián')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'02', N'01', N'Escazú')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'02', N'02', N'San Antonio')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'02', N'03', N'San Rafael')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'03', N'01', N'Desamparados')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'03', N'02', N'San Miguel')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'03', N'03', N'San Juan de Dios')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'03', N'04', N'San Rafael Arriba')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'03', N'05', N'San Antonio')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'03', N'06', N'Frailes')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'03', N'07', N'Patarrá')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'03', N'08', N'San Cristóbal')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'03', N'09', N'Rosario')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'03', N'10', N'Damas')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'03', N'11', N'San Rafael Abajo')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'03', N'12', N'Gravilias')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'03', N'13', N'Los Guido')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'04', N'01', N'Santiago')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'04', N'02', N'Mercedes Sur')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'04', N'03', N'Barbacoas')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'04', N'04', N'Grifo Alto')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'04', N'05', N'San Rafael')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'04', N'06', N'Candelarita')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'04', N'07', N'Desamparaditos')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'04', N'08', N'San Antonio')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'04', N'09', N'Chires')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'04', N'10', N'La Cangreja')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'05', N'01', N'San Marcos')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'05', N'02', N'San Lorenzo')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'05', N'03', N'San Carlos')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'06', N'01', N'Aserrí')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'06', N'02', N'Tarbaca o Praga')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'06', N'03', N'Vuelta de Jorco')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'06', N'04', N'San Gabriel')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'06', N'05', N'La Legua')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'06', N'06', N'Monterrey')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'06', N'07', N'Salitrillos')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'07', N'01', N'Ciudad Colón')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'07', N'02', N'Guayabo')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'07', N'03', N'Tabarcia')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'07', N'04', N'Piedras Negras')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'07', N'05', N'Picagres')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'07', N'06', N'Jaris')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'07', N'07', N'Quitirrisi')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'08', N'01', N'Guadalupe')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'08', N'02', N'San Francisco')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'08', N'03', N'Calle Blancos')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'08', N'04', N'Mata de Plátano')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'08', N'05', N'Ipís')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'08', N'06', N'Rancho Redondo')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'08', N'07', N'Purral')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'09', N'01', N'Santa Ana')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'09', N'02', N'Salitral')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'09', N'03', N'Pozos o Concepción')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'09', N'04', N'Uruca o San Joaquín')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'09', N'05', N'Piedades')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'09', N'06', N'Brasil')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'10', N'01', N'Alajuelita')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'10', N'02', N'San Josecito')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'10', N'03', N'San Antonio')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'10', N'04', N'Concepción')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'10', N'05', N'San Felipe')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'11', N'01', N'San Isidro')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'11', N'02', N'San Rafael')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'11', N'03', N'Dulce Nombre o Jesús')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'11', N'04', N'Patalillo')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'11', N'05', N'Cascajal')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'12', N'01', N'San Ignacio')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'12', N'02', N'Guaitil')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'12', N'03', N'Palmichal')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'12', N'04', N'Cangrejal')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'12', N'05', N'Sabanillas')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'13', N'01', N'San Juan')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'13', N'02', N'Cinco Esquinas')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'13', N'03', N'Anselmo Llorente')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'13', N'04', N'León XIII')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'13', N'05', N'Colima')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'14', N'01', N'San Vicente')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'14', N'02', N'San Jerónimo')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'14', N'03', N'La Trinidad')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'15', N'01', N'San Pedro')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'15', N'02', N'Sabanilla')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'15', N'03', N'Mercedes o Betania')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'15', N'04', N'San Rafael')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'16', N'01', N'San Pablo')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'16', N'02', N'San Pedro')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'16', N'03', N'San Juan de Mata')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'16', N'04', N'San Luis')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'16', N'05', N'Carara')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'17', N'01', N'Santa María')
GO
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'17', N'02', N'Jardín')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'17', N'03', N'Copey')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'18', N'01', N'Curridabat')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'18', N'02', N'Granadilla')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'18', N'03', N'Sánchez')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'18', N'04', N'Tirrases')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'19', N'01', N'San Isidro de El General')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'19', N'02', N'General')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'19', N'03', N'Daniel Flores')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'19', N'04', N'Rivas')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'19', N'05', N'San Pedro')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'19', N'06', N'Platanares')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'19', N'07', N'Pejibaye')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'19', N'08', N'Cajón o Carmen')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'19', N'09', N'Barú')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'19', N'10', N'Río Nuevo')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'19', N'11', N'Páramo')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'19', N'12', N'La Amistad')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'20', N'01', N'San Pablo')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'20', N'02', N'San Andrés')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'20', N'03', N'Llano Bonito')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'20', N'04', N'San Isidro')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'20', N'05', N'Santa Cruz')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'1', N'20', N'06', N'San Antonio')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'01', N'01', N'Alajuela')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'01', N'02', N'San José')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'01', N'03', N'Carrizal')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'01', N'04', N'San Antonio')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'01', N'05', N'Guácima')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'01', N'06', N'San Isidro')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'01', N'07', N'Sabanilla')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'01', N'08', N'San Rafael')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'01', N'09', N'Río Segundo')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'01', N'10', N'Desamparados')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'01', N'11', N'Turrucares')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'01', N'12', N'Tambor')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'01', N'13', N'La Garita')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'01', N'14', N'Sarapiquí')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'02', N'01', N'San Ramón')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'02', N'02', N'Santiago')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'02', N'03', N'San Juan')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'02', N'04', N'Piedades Norte')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'02', N'05', N'Piedades Sur')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'02', N'06', N'San Rafael')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'02', N'07', N'San Isidro')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'02', N'08', N'Angeles')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'02', N'09', N'Alfaro')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'02', N'10', N'Volio')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'02', N'11', N'Concepción')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'02', N'12', N'Zapotal')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'02', N'13', N'San Isidro de Peñas Blancas')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'02', N'14', N'San Lorenzo')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'03', N'01', N'Grecia')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'03', N'02', N'San Isidro')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'03', N'03', N'San José')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'03', N'04', N'San Roque')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'03', N'05', N'Tacares')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'03', N'06', N'Puente Piedra')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'03', N'07', N'Bolívar')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'04', N'01', N'San Mateo')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'04', N'02', N'Desmonte')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'04', N'03', N'Jesús María')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'04', N'04', N'Labrador')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'05', N'01', N'Atenas')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'05', N'02', N'Jesús')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'05', N'03', N'Mercedes')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'05', N'04', N'San Isidro')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'05', N'05', N'Concepción')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'05', N'06', N'San José')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'05', N'07', N'Santa Eulalia')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'05', N'08', N'Escobal')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'06', N'01', N'Naranjo')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'06', N'02', N'San Miguel')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'06', N'03', N'San José')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'06', N'04', N'Cirrí Sur')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'06', N'05', N'San Jerónimo')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'06', N'06', N'San Juan')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'06', N'07', N'Rosario')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'07', N'01', N'Palmares')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'07', N'02', N'Zaragoza')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'07', N'03', N'Buenos Aires')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'07', N'04', N'Santiago')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'07', N'05', N'Candelaria')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'07', N'06', N'Esquipulas')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'07', N'07', N'La Granja')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'08', N'01', N'San Pedro')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'08', N'02', N'San Juan')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'08', N'03', N'San Rafael')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'08', N'04', N'Carrillos')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'08', N'05', N'Sabana Redonda')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'09', N'01', N'Orotina')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'09', N'02', N'Mastate')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'09', N'03', N'Hacienda Vieja')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'09', N'04', N'Coyolar')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'09', N'05', N'Ceiba')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'10', N'01', N'Quesada')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'10', N'02', N'Florencia')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'10', N'03', N'Buenavista')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'10', N'04', N'Aguas Zarcas')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'10', N'05', N'Venecia')
GO
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'10', N'06', N'Pital')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'10', N'07', N'Fortuna')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'10', N'08', N'Tigra')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'10', N'09', N'Palmera')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'10', N'10', N'Venado')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'10', N'11', N'Cutris')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'10', N'12', N'Monterrey')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'10', N'13', N'Pocosol')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'11', N'01', N'Zarcero')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'11', N'02', N'Laguna')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'11', N'03', N'Tapezco')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'11', N'04', N'Guadalupe')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'11', N'05', N'Palmira')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'11', N'06', N'Zapote')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'11', N'07', N'Brisas')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'12', N'01', N'Sarchí Norte')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'12', N'02', N'Sarchí Sur')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'12', N'03', N'Toro Amarillo')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'12', N'04', N'San Pedro')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'12', N'05', N'Rodríguez')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'13', N'01', N'Upala')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'13', N'02', N'Aguas Claras')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'13', N'03', N'San José o Pizote')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'13', N'04', N'Bijagua')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'13', N'05', N'Delicias')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'13', N'06', N'Dos Ríos')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'13', N'07', N'Yolillal')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'13', N'08', N'Canalete')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'14', N'01', N'Los Chiles')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'14', N'02', N'Caño Negro')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'14', N'03', N'Amparo')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'14', N'04', N'San Jorge')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'15', N'01', N'San Rafael')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'15', N'02', N'Buenavista')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'15', N'03', N'Cote')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'15', N'04', N'Katira')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'2', N'16', N'01', N'Rio Cuarto')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'3', N'01', N'01', N'Oriental')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'3', N'01', N'02', N'Occidental')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'3', N'01', N'03', N'Carmen')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'3', N'01', N'04', N'San Nicolás')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'3', N'01', N'05', N'Aguacaliente  (San Francisco)')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'3', N'01', N'06', N'Guadalupe  (Arenilla)')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'3', N'01', N'07', N'Corralillo')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'3', N'01', N'08', N'Tierra Blanca')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'3', N'01', N'09', N'Dulce Nombre')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'3', N'01', N'10', N'Llano Grande')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'3', N'01', N'11', N'Quebradilla')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'3', N'02', N'01', N'Paraíso')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'3', N'02', N'02', N'Santiago')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'3', N'02', N'03', N'Orosi')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'3', N'02', N'04', N'Cachí')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'3', N'02', N'05', N'Llanos de Sta Lucia')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'3', N'03', N'01', N'Tres Ríos')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'3', N'03', N'02', N'San Diego')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'3', N'03', N'03', N'San Juan')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'3', N'03', N'04', N'San Rafael')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'3', N'03', N'05', N'Concepción')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'3', N'03', N'06', N'Dulce Nombre')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'3', N'03', N'07', N'San Ramón')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'3', N'03', N'08', N'Río Azul')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'3', N'04', N'01', N'Juan Viñas')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'3', N'04', N'02', N'Tucurrique')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'3', N'04', N'03', N'Pejibaye')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'3', N'05', N'01', N'Turrialba')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'3', N'05', N'02', N'La Suiza')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'3', N'05', N'03', N'Peralta')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'3', N'05', N'04', N'Santa Cruz')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'3', N'05', N'05', N'Santa Teresita')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'3', N'05', N'06', N'Pavones')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'3', N'05', N'07', N'Tuis')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'3', N'05', N'08', N'Tayutic')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'3', N'05', N'09', N'Santa Rosa')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'3', N'05', N'10', N'Tres Equis')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'3', N'05', N'11', N'La Isabel')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'3', N'05', N'12', N'Chirripo')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'3', N'06', N'01', N'Pacayas')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'3', N'06', N'02', N'Cervantes')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'3', N'06', N'03', N'Capellades')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'3', N'07', N'01', N'San Rafael')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'3', N'07', N'02', N'Cot')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'3', N'07', N'03', N'Potrero Cerrado')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'3', N'07', N'04', N'Cipreses')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'3', N'07', N'05', N'Santa Rosa')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'3', N'08', N'01', N'El Tejar')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'3', N'08', N'02', N'San Isidro')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'3', N'08', N'03', N'Tobosi')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'3', N'08', N'04', N'Patio de Agua')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'4', N'01', N'01', N'Heredia')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'4', N'01', N'02', N'Mercedes')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'4', N'01', N'03', N'San Francisco')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'4', N'01', N'04', N'Ulloa')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'4', N'01', N'05', N'Vara Blanca')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'4', N'02', N'01', N'Barva')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'4', N'02', N'02', N'San Pedro')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'4', N'02', N'03', N'San Pablo')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'4', N'02', N'04', N'San Roque')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'4', N'02', N'05', N'Santa Lucía')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'4', N'02', N'06', N'San José de la Montaña')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'4', N'03', N'01', N'Santo Domingo')
GO
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'4', N'03', N'02', N'San Vicente')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'4', N'03', N'03', N'San Miguel')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'4', N'03', N'04', N'Paracito')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'4', N'03', N'05', N'Santo Tomás')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'4', N'03', N'06', N'Santa Rosa')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'4', N'03', N'07', N'Tures')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'4', N'03', N'08', N'Pará')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'4', N'04', N'01', N'Santa Bárbara')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'4', N'04', N'02', N'San Pedro')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'4', N'04', N'03', N'San Juan')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'4', N'04', N'04', N'Jesús')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'4', N'04', N'05', N'Santo Domingo del Roble')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'4', N'04', N'06', N'Puraba')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'4', N'05', N'01', N'San Rafael')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'4', N'05', N'02', N'San Josecito')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'4', N'05', N'03', N'Santiago')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'4', N'05', N'04', N'Angeles')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'4', N'05', N'05', N'Concepción')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'4', N'06', N'01', N'San Isidro')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'4', N'06', N'02', N'San José')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'4', N'06', N'03', N'Concepción')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'4', N'06', N'04', N'San Francisco')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'4', N'07', N'01', N'San Antonio')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'4', N'07', N'02', N'La Rivera')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'4', N'07', N'03', N'Asunción')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'4', N'08', N'01', N'San Joaquín')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'4', N'08', N'02', N'Barrantes')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'4', N'08', N'03', N'Llorente')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'4', N'09', N'01', N'San Pablo')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'4', N'09', N'02', N'Rincon de Sabanilla')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'4', N'10', N'01', N'Puerto Viejo')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'4', N'10', N'02', N'La Virgen')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'4', N'10', N'03', N'Horquetas')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'4', N'10', N'04', N'Llanuras del Gaspar')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'4', N'10', N'05', N'Cureña')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'01', N'01', N'Liberia')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'01', N'02', N'Cañas Dulces')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'01', N'03', N'Mayorga')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'01', N'04', N'Nacascolo')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'01', N'05', N'Curubande')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'02', N'01', N'Nicoya')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'02', N'02', N'Mansión')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'02', N'03', N'San Antonio')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'02', N'04', N'Quebrada Honda')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'02', N'05', N'Sámara')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'02', N'06', N'Nosara')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'02', N'07', N'Belén de Nosarita')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'03', N'01', N'Santa Cruz')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'03', N'02', N'Bolsón')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'03', N'03', N'Veintisiete de Abril')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'03', N'04', N'Tempate')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'03', N'05', N'Cartagena')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'03', N'06', N'Cuajiniquil')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'03', N'07', N'Diriá')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'03', N'08', N'Cabo Velas')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'03', N'09', N'Tamarindo')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'04', N'01', N'Bagaces')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'04', N'02', N'Fortuna')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'04', N'03', N'Mogote')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'04', N'04', N'Río Naranjo')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'05', N'01', N'Filadelfia')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'05', N'02', N'Palmira')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'05', N'03', N'Sardinal')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'05', N'04', N'Belén')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'06', N'01', N'Cañas')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'06', N'02', N'Palmira')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'06', N'03', N'San Miguel')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'06', N'04', N'Bebedero')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'06', N'05', N'Porozal')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'07', N'01', N'Juntas')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'07', N'02', N'Sierra')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'07', N'03', N'San Juan')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'07', N'04', N'Colorado')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'08', N'01', N'Tilarán')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'08', N'02', N'Quebrada Grande')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'08', N'03', N'Tronadora')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'08', N'04', N'Santa Rosa')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'08', N'05', N'Líbano')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'08', N'06', N'Tierras Morenas')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'08', N'07', N'Arenal')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'09', N'01', N'Carmona')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'09', N'02', N'Santa Rita')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'09', N'03', N'Zapotal')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'09', N'04', N'San Pablo')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'09', N'05', N'Porvenir')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'09', N'06', N'Bejuco')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'10', N'01', N'La Cruz')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'10', N'02', N'Santa Cecilia')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'10', N'03', N'Garita')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'10', N'04', N'Santa Elena')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'11', N'01', N'Hojancha')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'11', N'02', N'Monte Romo')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'11', N'03', N'Puerto Carrillo')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'11', N'04', N'Huacas')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'5', N'11', N'05', N'Matambú')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'01', N'01', N'Puntarenas')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'01', N'02', N'Pitahaya')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'01', N'03', N'Chomes')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'01', N'04', N'Lepanto')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'01', N'05', N'Paquera')
GO
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'01', N'06', N'Manzanillo')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'01', N'07', N'Guacimal')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'01', N'08', N'Barranca')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'01', N'09', N'Monte Verde')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'01', N'10', N'Isla del Coco')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'01', N'11', N'Cóbano')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'01', N'12', N'Chacarita')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'01', N'13', N'Chira (Isla)')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'01', N'14', N'Acapulco')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'01', N'15', N'El Roble')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'01', N'16', N'Arancibia')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'02', N'01', N'Espíritu Santo')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'02', N'02', N'San Juan Grande')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'02', N'03', N'Macacona')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'02', N'04', N'San Rafael')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'02', N'05', N'San Jerónimo')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'02', N'06', N'Caldera')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'03', N'01', N'Buenos Aires')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'03', N'02', N'Volcán')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'03', N'03', N'Potrero Grande')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'03', N'04', N'Boruca')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'03', N'05', N'Pilas')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'03', N'06', N'Colinas o Bajo de Maíz')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'03', N'07', N'Chánguena')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'03', N'08', N'Biolley')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'03', N'09', N'Brunka')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'04', N'01', N'Miramar')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'04', N'02', N'Unión')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'04', N'03', N'San Isidro')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'05', N'01', N'Ciudad Cortés')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'05', N'02', N'Palmar')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'05', N'03', N'Sierpe')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'05', N'04', N'Bahía Ballena')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'05', N'05', N'Piedras Blancas')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'05', N'06', N'Bahia Drake')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'06', N'01', N'Quepos')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'06', N'02', N'Savegre')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'06', N'03', N'Naranjito')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'07', N'01', N'Golfito')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'07', N'02', N'Puerto Jiménez')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'07', N'03', N'Guaycará')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'07', N'04', N'Pavones o Villa Conte')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'08', N'01', N'San Vito')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'08', N'02', N'Sabalito')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'08', N'03', N'Agua Buena')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'08', N'04', N'Limoncito')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'08', N'05', N'Pittier')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'08', N'06', N'Gutierrez Brown')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'09', N'01', N'Parrita')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'10', N'01', N'Corredores')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'10', N'02', N'La Cuesta')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'10', N'03', N'Paso Canoas')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'10', N'04', N'Laurel')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'11', N'01', N'Jacó')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'6', N'11', N'02', N'Tárcoles')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'7', N'01', N'01', N'Limón')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'7', N'01', N'02', N'Valle  La Estrella')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'7', N'01', N'03', N'Río Blanco')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'7', N'01', N'04', N'Matama')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'7', N'02', N'01', N'Guápiles')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'7', N'02', N'02', N'Jiménez')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'7', N'02', N'03', N'Rita')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'7', N'02', N'04', N'Roxana')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'7', N'02', N'05', N'Cariari')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'7', N'02', N'06', N'Colorado')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'7', N'02', N'07', N'La Colonia')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'7', N'03', N'01', N'Siquirres')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'7', N'03', N'02', N'Pacuarito')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'7', N'03', N'03', N'Florida')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'7', N'03', N'04', N'Germania')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'7', N'03', N'05', N'Cairo')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'7', N'03', N'06', N'Alegría')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'7', N'04', N'01', N'Bratsi')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'7', N'04', N'02', N'Sixaola')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'7', N'04', N'03', N'Cahuita')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'7', N'04', N'04', N'Telire')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'7', N'05', N'01', N'Matina')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'7', N'05', N'02', N'Batán')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'7', N'05', N'03', N'Carrandí')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'7', N'06', N'01', N'Guácimo')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'7', N'06', N'02', N'Mercedes')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'7', N'06', N'03', N'Pocora')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'7', N'06', N'04', N'Río Jiménez')
INSERT [dbo].[Distrito] ([Provincia], [Canton], [Distrito], [Nombre]) VALUES (N'7', N'06', N'05', N'Duacarí')
GO
INSERT [dbo].[Empresa] ([IdEmpresa], [Descripcion], [IdTipoIdentificacion], [Identificacion], [Telefono], [Contacto], [Estado]) VALUES (1, N'MUSOC', 2, N'14477884455', N'2771-0414', N'info@musoccr.com', 1)
GO
INSERT [dbo].[Linea] ([IdLinea], [IdEmpresa], [Descripcion], [CodigoCTP], [Provincia], [Canton], [Distrito], [Estado]) VALUES (1, 1, N'San José - San Marcos', N'8875H', N'1', N'05', N'01', 1)
INSERT [dbo].[Linea] ([IdLinea], [IdEmpresa], [Descripcion], [CodigoCTP], [Provincia], [Canton], [Distrito], [Estado]) VALUES (2, 1, N'San José - Pérez Zeledón', N'8559J', N'1', N'19', N'02', 1)
GO
INSERT [dbo].[LineaTarifa] ([IdLineaTarifa], [IdLinea], [IdTarifa]) VALUES (1, 1, 3)
INSERT [dbo].[LineaTarifa] ([IdLineaTarifa], [IdLinea], [IdTarifa]) VALUES (2, 2, 2)
GO
INSERT [dbo].[LineaUnidad] ([IdLineaUnidad], [IdUnidad], [IdLinea]) VALUES (1, 1, 1)
INSERT [dbo].[LineaUnidad] ([IdLineaUnidad], [IdUnidad], [IdLinea]) VALUES (2, 2, 1)
INSERT [dbo].[LineaUnidad] ([IdLineaUnidad], [IdUnidad], [IdLinea]) VALUES (3, 3, 2)
GO
INSERT [dbo].[Pago] ([IdPago], [IdEmpresa], [IdUnidad], [IdUsuario], [Monto], [Fecha], [Latitud], [Longitud], [Estado]) VALUES (1, 1, 1, 4, 400.0000, CAST(N'2020-08-25T00:51:27.983' AS DateTime), CAST(9.748917 AS Decimal(18, 6)), CAST(-83.753428 AS Decimal(18, 6)), N'PG')
INSERT [dbo].[Pago] ([IdPago], [IdEmpresa], [IdUnidad], [IdUsuario], [Monto], [Fecha], [Latitud], [Longitud], [Estado]) VALUES (2, 1, 1, 4, 400.0000, CAST(N'2020-08-25T00:51:31.447' AS DateTime), CAST(9.748917 AS Decimal(18, 6)), CAST(-83.753428 AS Decimal(18, 6)), N'PG')
INSERT [dbo].[Pago] ([IdPago], [IdEmpresa], [IdUnidad], [IdUsuario], [Monto], [Fecha], [Latitud], [Longitud], [Estado]) VALUES (3, 1, 1, 6, 400.0000, CAST(N'2020-08-25T00:54:52.667' AS DateTime), CAST(9.748917 AS Decimal(18, 6)), CAST(-83.753428 AS Decimal(18, 6)), N'PG')
GO
INSERT [dbo].[Provincia] ([Provincia], [Nombre]) VALUES (N'2', N' ALAJUELA')
INSERT [dbo].[Provincia] ([Provincia], [Nombre]) VALUES (N'3', N' CARTAGO')
INSERT [dbo].[Provincia] ([Provincia], [Nombre]) VALUES (N'5', N' GUANACASTE')
INSERT [dbo].[Provincia] ([Provincia], [Nombre]) VALUES (N'4', N' HEREDIA')
INSERT [dbo].[Provincia] ([Provincia], [Nombre]) VALUES (N'7', N' LIMON')
INSERT [dbo].[Provincia] ([Provincia], [Nombre]) VALUES (N'6', N' PUNTARENAS')
INSERT [dbo].[Provincia] ([Provincia], [Nombre]) VALUES (N'1', N' SAN JOSE')
GO
INSERT [dbo].[Rol] ([IdRol], [Descripcion], [Estado]) VALUES (1, N'Admin', 1)
INSERT [dbo].[Rol] ([IdRol], [Descripcion], [Estado]) VALUES (2, N'Gerente', 1)
INSERT [dbo].[Rol] ([IdRol], [Descripcion], [Estado]) VALUES (3, N'Supervisor', 1)
INSERT [dbo].[Rol] ([IdRol], [Descripcion], [Estado]) VALUES (4, N'Cliente', 1)
GO
INSERT [dbo].[Tarifa] ([IdTarifa], [Descripcion], [Monto], [Estado]) VALUES (1, N'Baja', 400.0000, 1)
INSERT [dbo].[Tarifa] ([IdTarifa], [Descripcion], [Monto], [Estado]) VALUES (2, N'Media', 600.0000, 1)
INSERT [dbo].[Tarifa] ([IdTarifa], [Descripcion], [Monto], [Estado]) VALUES (3, N'Alta', 750.0000, 1)
INSERT [dbo].[Tarifa] ([IdTarifa], [Descripcion], [Monto], [Estado]) VALUES (4, N'Media - Alta', 680.0000, 0)
GO
INSERT [dbo].[TipoIdentificacion] ([IdTipoIdentificacion], [Descripcion], [Estado]) VALUES (1, N'Nacional', 1)
INSERT [dbo].[TipoIdentificacion] ([IdTipoIdentificacion], [Descripcion], [Estado]) VALUES (2, N'Juridica', 1)
INSERT [dbo].[TipoIdentificacion] ([IdTipoIdentificacion], [Descripcion], [Estado]) VALUES (3, N'Dimex', 1)
GO
INSERT [dbo].[TipoPlaca] ([IdTipoPlaca], [Descripcion], [Estado]) VALUES (1, N'Placa 1', 1)
INSERT [dbo].[TipoPlaca] ([IdTipoPlaca], [Descripcion], [Estado]) VALUES (2, N'Placa 2', 1)
INSERT [dbo].[TipoPlaca] ([IdTipoPlaca], [Descripcion], [Estado]) VALUES (3, N'Placa 3', 0)
GO
INSERT [dbo].[Unidad] ([IdUnidad], [Descripcion], [IdTipoPlaca], [Placa], [Estado]) VALUES (1, N'Unidad 1', 1, N'SJB-10140', 1)
INSERT [dbo].[Unidad] ([IdUnidad], [Descripcion], [IdTipoPlaca], [Placa], [Estado]) VALUES (2, N'Unidad 2', 2, N'SJB-78785', 1)
INSERT [dbo].[Unidad] ([IdUnidad], [Descripcion], [IdTipoPlaca], [Placa], [Estado]) VALUES (3, N'Unidad 3', 1, N'SBJ-85584', 1)
GO
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [Nombre2], [Apellido1], [Apellido2], [IdTipoIdentificacion], [Identificacion], [Saldo], [Telefono], [Correo], [Clave], [Estado]) VALUES (1, N'Manuel', NULL, N'Monge', N'Monge', 1, N'1-44444', 0.0000, N'88888888', N'admin@hotmail.com', N'1ngJShrN/dXCHUirxYbSYA==', 1)
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [Nombre2], [Apellido1], [Apellido2], [IdTipoIdentificacion], [Identificacion], [Saldo], [Telefono], [Correo], [Clave], [Estado]) VALUES (2, N'Jose', N'David', N'Mora', N'Robles', 1, N'1-77777', 0.0000, N'88888888', N'gerente@hotmail.com', N'1ngJShrN/dXCHUirxYbSYA==', 1)
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [Nombre2], [Apellido1], [Apellido2], [IdTipoIdentificacion], [Identificacion], [Saldo], [Telefono], [Correo], [Clave], [Estado]) VALUES (3, N'Pablo', NULL, N'Duran', N'Duran', 1, N'1-88888', 0.0000, N'88888888', N'supervisor@hotmail.com', N'1ngJShrN/dXCHUirxYbSYA==', 1)
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [Nombre2], [Apellido1], [Apellido2], [IdTipoIdentificacion], [Identificacion], [Saldo], [Telefono], [Correo], [Clave], [Estado]) VALUES (4, N'Andres', NULL, N'Navarro', N'Castro', 1, N'1-99999', 200.0000, N'88888888', N'cliente@hotmail.com', N'1ngJShrN/dXCHUirxYbSYA==', 1)
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [Nombre2], [Apellido1], [Apellido2], [IdTipoIdentificacion], [Identificacion], [Saldo], [Telefono], [Correo], [Clave], [Estado]) VALUES (5, N'Santiago', NULL, N'Hurtado', N'Alzate', 3, N'117000793520', 0.0000, N'88888888', N'santiago@hotmail.com', N'1ngJShrN/dXCHUirxYbSYA==', 1)
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [Nombre2], [Apellido1], [Apellido2], [IdTipoIdentificacion], [Identificacion], [Saldo], [Telefono], [Correo], [Clave], [Estado]) VALUES (6, N'Cliente 2', NULL, N'Cliente', N'Cliente', 3, N'117000785889', 1600.0000, N'88888888', N'cliente2@hotmail.com', N'1ngJShrN/dXCHUirxYbSYA==', 0)
GO
INSERT [dbo].[UsuarioRol] ([IdUsuarioRol], [IdUsuario], [IdRol]) VALUES (2, 2, 2)
INSERT [dbo].[UsuarioRol] ([IdUsuarioRol], [IdUsuario], [IdRol]) VALUES (3, 3, 3)
INSERT [dbo].[UsuarioRol] ([IdUsuarioRol], [IdUsuario], [IdRol]) VALUES (4, 4, 4)
INSERT [dbo].[UsuarioRol] ([IdUsuarioRol], [IdUsuario], [IdRol]) VALUES (5, 5, 1)
INSERT [dbo].[UsuarioRol] ([IdUsuarioRol], [IdUsuario], [IdRol]) VALUES (6, 5, 2)
INSERT [dbo].[UsuarioRol] ([IdUsuarioRol], [IdUsuario], [IdRol]) VALUES (7, 5, 3)
INSERT [dbo].[UsuarioRol] ([IdUsuarioRol], [IdUsuario], [IdRol]) VALUES (9, 1, 1)
INSERT [dbo].[UsuarioRol] ([IdUsuarioRol], [IdUsuario], [IdRol]) VALUES (10, 6, 4)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Provinci__75E3EFCF4627C141]    Script Date: 8/25/2020 12:58:51 AM ******/
ALTER TABLE [dbo].[Provincia] ADD UNIQUE NONCLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Usuario] ADD  CONSTRAINT [DF_Usuario_Estado]  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Canton]  WITH CHECK ADD FOREIGN KEY([Provincia])
REFERENCES [dbo].[Provincia] ([Provincia])
GO
ALTER TABLE [dbo].[Deposito]  WITH CHECK ADD  CONSTRAINT [FK_Deposito_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Deposito] CHECK CONSTRAINT [FK_Deposito_Usuario]
GO
ALTER TABLE [dbo].[Distrito]  WITH CHECK ADD FOREIGN KEY([Provincia], [Canton])
REFERENCES [dbo].[Canton] ([Provincia], [Canton])
GO
ALTER TABLE [dbo].[Empresa]  WITH CHECK ADD  CONSTRAINT [FK_Empresa_TipoIdentificacion] FOREIGN KEY([IdTipoIdentificacion])
REFERENCES [dbo].[TipoIdentificacion] ([IdTipoIdentificacion])
GO
ALTER TABLE [dbo].[Empresa] CHECK CONSTRAINT [FK_Empresa_TipoIdentificacion]
GO
ALTER TABLE [dbo].[Linea]  WITH CHECK ADD  CONSTRAINT [FK_Linea_Empresa] FOREIGN KEY([IdEmpresa])
REFERENCES [dbo].[Empresa] ([IdEmpresa])
GO
ALTER TABLE [dbo].[Linea] CHECK CONSTRAINT [FK_Linea_Empresa]
GO
ALTER TABLE [dbo].[Linea]  WITH CHECK ADD  CONSTRAINT [FK_Linea_Provincia] FOREIGN KEY([Provincia])
REFERENCES [dbo].[Provincia] ([Provincia])
GO
ALTER TABLE [dbo].[Linea] CHECK CONSTRAINT [FK_Linea_Provincia]
GO
ALTER TABLE [dbo].[LineaTarifa]  WITH CHECK ADD  CONSTRAINT [FK_LineaTarifa_Linea1] FOREIGN KEY([IdLinea])
REFERENCES [dbo].[Linea] ([IdLinea])
GO
ALTER TABLE [dbo].[LineaTarifa] CHECK CONSTRAINT [FK_LineaTarifa_Linea1]
GO
ALTER TABLE [dbo].[LineaTarifa]  WITH CHECK ADD  CONSTRAINT [FK_LineaTarifa_Tarifa] FOREIGN KEY([IdTarifa])
REFERENCES [dbo].[Tarifa] ([IdTarifa])
GO
ALTER TABLE [dbo].[LineaTarifa] CHECK CONSTRAINT [FK_LineaTarifa_Tarifa]
GO
ALTER TABLE [dbo].[LineaUnidad]  WITH CHECK ADD  CONSTRAINT [FK_LineaUnidad_Linea] FOREIGN KEY([IdLinea])
REFERENCES [dbo].[Linea] ([IdLinea])
GO
ALTER TABLE [dbo].[LineaUnidad] CHECK CONSTRAINT [FK_LineaUnidad_Linea]
GO
ALTER TABLE [dbo].[LineaUnidad]  WITH CHECK ADD  CONSTRAINT [FK_LineaUnidad_Unidad] FOREIGN KEY([IdUnidad])
REFERENCES [dbo].[Unidad] ([IdUnidad])
GO
ALTER TABLE [dbo].[LineaUnidad] CHECK CONSTRAINT [FK_LineaUnidad_Unidad]
GO
ALTER TABLE [dbo].[Pago]  WITH CHECK ADD  CONSTRAINT [FK_Pago_Empresa] FOREIGN KEY([IdEmpresa])
REFERENCES [dbo].[Empresa] ([IdEmpresa])
GO
ALTER TABLE [dbo].[Pago] CHECK CONSTRAINT [FK_Pago_Empresa]
GO
ALTER TABLE [dbo].[Pago]  WITH CHECK ADD  CONSTRAINT [FK_Pago_Unidad] FOREIGN KEY([IdUnidad])
REFERENCES [dbo].[Unidad] ([IdUnidad])
GO
ALTER TABLE [dbo].[Pago] CHECK CONSTRAINT [FK_Pago_Unidad]
GO
ALTER TABLE [dbo].[Pago]  WITH CHECK ADD  CONSTRAINT [FK_Pago_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Pago] CHECK CONSTRAINT [FK_Pago_Usuario]
GO
ALTER TABLE [dbo].[Unidad]  WITH CHECK ADD  CONSTRAINT [FK_Unidad_TipoPlaca] FOREIGN KEY([IdTipoPlaca])
REFERENCES [dbo].[TipoPlaca] ([IdTipoPlaca])
GO
ALTER TABLE [dbo].[Unidad] CHECK CONSTRAINT [FK_Unidad_TipoPlaca]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_TipoIdentificacion] FOREIGN KEY([IdTipoIdentificacion])
REFERENCES [dbo].[TipoIdentificacion] ([IdTipoIdentificacion])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_TipoIdentificacion]
GO
ALTER TABLE [dbo].[UsuarioRol]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioRol_Rol] FOREIGN KEY([IdRol])
REFERENCES [dbo].[Rol] ([IdRol])
GO
ALTER TABLE [dbo].[UsuarioRol] CHECK CONSTRAINT [FK_UsuarioRol_Rol]
GO
ALTER TABLE [dbo].[UsuarioRol]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioRol_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[UsuarioRol] CHECK CONSTRAINT [FK_UsuarioRol_Usuario]
GO
/****** Object:  StoredProcedure [dbo].[ActualizaEmpresa]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[ActualizaEmpresa]
@IdEmpresa int,
@Descripcion as varchar(50),
@IdTipoIdentificacion as int,
@Identificacion as varchar(30),
@Telefono as varchar(20),
@Contacto as varchar(50),
@Estado as  bit
AS
BEGIN
	Update Empresa SET
		Descripcion = @Descripcion,
		IdTipoIdentificacion = @IdTipoIdentificacion,
		Identificacion = @Identificacion,
		Telefono = @Telefono,
		Contacto = @Contacto,
		Estado = @Estado	
		where IdEmpresa = @IdEmpresa
END
GO
/****** Object:  StoredProcedure [dbo].[ActualizaLinea]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizaLinea]
@IdEmpresa as int,
@IdLinea as int,
@Descripcion as varchar(50),
@CodigoCTP as varchar(50),
@IdTarifa as int,
@Provincia as char(1),
@Canton as char(2),
@Distrito as char(2),
@Estado as bit

AS
BEGIN
	
	BEGIN TRY
		Update Linea SET
		IdEmpresa = @IdEmpresa,
		Descripcion = @Descripcion,
		CodigoCTP = @CodigoCTP,
		Provincia = @Provincia,
		Canton = @Canton,
		Distrito = @Distrito,
		Estado = @Estado	
		where IdLinea = @IdLinea

		exec ActualizaLineaTarifa @IdLinea, @IdTarifa;
	END TRY

	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000);  
		DECLARE @ErrorSeverity INT;  
		DECLARE @ErrorState INT;  
  
		SELECT   
			@ErrorMessage = ERROR_MESSAGE(),  
			@ErrorSeverity = ERROR_SEVERITY(),  
			@ErrorState = ERROR_STATE();  
  
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState);  
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[ActualizaLineaTarifa]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizaLineaTarifa]
@IdLinea as int,
@IdTarifa as int

AS
BEGIN
	Update LineaTarifa SET
	IdTarifa = @IdTarifa
	where IdLinea = @IdLinea
END
GO
/****** Object:  StoredProcedure [dbo].[ActualizaLineaUnidad]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizaLineaUnidad]
@IdLinea as int,
@IdUnidad as int
AS
BEGIN
	Update LineaUnidad SET --Cambiar la líea a la que pertenece la unidad
	IdLinea = @IdLinea
	where IdUnidad = @IdUnidad
END
GO
/****** Object:  StoredProcedure [dbo].[ActualizaPerfilUsuario]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[ActualizaPerfilUsuario] 
@IdUsuario int,
@Nombre varchar(50),
@Nombre2 varchar(50),
@Apellido1 varchar(50),
@Apellido2 varchar(50),
@IdTipoIdentificacion int,
@Identificacion varchar(30),
@Telefono varchar(20),
@Correo varchar(50),
@Clave varchar(50)
AS
BEGIN
	update Usuario 
	set Nombre = @Nombre,
	Nombre2 = @Nombre2,
	Apellido1 = @Apellido1,
	Apellido2 = @Apellido2,
	IdTipoIdentificacion = @IdTipoIdentificacion,
	Identificacion = @Identificacion,
	Telefono = @Telefono,
	Correo = @Correo,
	Clave = @Clave
	where IdUsuario = @IdUsuario
END
GO
/****** Object:  StoredProcedure [dbo].[ActualizaRol]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizaRol]
@IdRol int,
@Descripcion varchar(50),
@Estado bit
AS
BEGIN
	update Rol 
	set Descripcion = @Descripcion,
	Estado = @Estado
	where IdRol = @IdRol
END
GO
/****** Object:  StoredProcedure [dbo].[ActualizaTarifa]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ActualizaTarifa]
@IdTarifa as int,
@Descripcion as varchar(50),
@Monto as money,
@Estado as bit

AS
BEGIN
	Update Tarifa SET
	Descripcion = @Descripcion,
	Monto = @Monto,
	Estado = @Estado	
	where IdTarifa = @IdTarifa
END
GO
/****** Object:  StoredProcedure [dbo].[ActualizaTipoIdentificacion]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizaTipoIdentificacion]
@IdTipoIdentificacion int,
@Descripcion varchar(50),
@Estado bit
AS
BEGIN
	update TipoIdentificacion 
	set Descripcion = @Descripcion,
	Estado = @Estado
	where IdTipoIdentificacion = @IdTipoIdentificacion
END
GO
/****** Object:  StoredProcedure [dbo].[ActualizaTipoPlaca]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizaTipoPlaca]
@IdTipoPlaca as int,
@Descripcion as varchar(50),
@Estado as bit
AS
BEGIN
	Update TipoPlaca SET
	Descripcion = @Descripcion,
	Estado = @Estado
	where IdTipoPlaca = @IdTipoPlaca
END
GO
/****** Object:  StoredProcedure [dbo].[ActualizaUnidad]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizaUnidad]
@IdUnidad as int,
@Descripcion as varchar(50),
@IdTipoPlaca as int,
@Placa as varchar(50),
@IdLinea as int,
@Estado as bit
AS
BEGIN

	BEGIN TRY
		Update Unidad SET
		Descripcion = @Descripcion,
		IdTipoPlaca = @IdTipoPlaca,
		Placa = @Placa,
		Estado = @Estado
		where IdUnidad = @IdUnidad

		exec ActualizaLineaUnidad @IdLinea, @IdUnidad;
	END TRY

	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000);  
		DECLARE @ErrorSeverity INT;  
		DECLARE @ErrorState INT;  
  
		SELECT   
			@ErrorMessage = ERROR_MESSAGE(),  
			@ErrorSeverity = ERROR_SEVERITY(),  
			@ErrorState = ERROR_STATE();  
  
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState);  
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[ActualizaUsuario]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizaUsuario] 
@IdUsuario int,
@Nombre varchar(50),
@Nombre2 varchar(50),
@Apellido1 varchar(50),
@Apellido2 varchar(50),
@IdTipoIdentificacion int,
@Identificacion varchar(30),
@Telefono varchar(20),
@Correo varchar(50),
@Estado as bit,
@EsAdmin as bit,
@EsGerente as bit,
@EsSupervisor as bit,
@EsCliente as bit
AS
BEGIN
	
	BEGIN TRY
		update Usuario 
		set Nombre = @Nombre,
		Nombre2 = @Nombre2,
		Apellido1 = @Apellido1,
		Apellido2 = @Apellido2,
		IdTipoIdentificacion = @IdTipoIdentificacion,
		Identificacion = @Identificacion,
		Telefono = @Telefono,
		Correo = @Correo,
		Estado = @Estado
		where IdUsuario = @IdUsuario

		if(@EsAdmin = 'true')
		 begin
			Declare @Admin  int
			Select @Admin = IdUsuarioRol from UsuarioRol where IdUsuario = @IdUsuario and IdRol = 1;
			if(@Admin is null)
			 begin
				exec AgregaUsuarioRol @IdUsuario, 1;
			 end
		 end
		else
		 begin
			exec EliminaUsuarioROl @IdUsuario, 1;
		 end

		if(@EsGerente = 'true')
		 begin
			Declare @Gerente  int
			Select @Gerente = IdUsuarioRol from UsuarioRol where IdUsuario = @IdUsuario and IdRol = 2;
			if(@Gerente is null)
			 begin
				exec AgregaUsuarioRol @IdUsuario, 2;
			 end
		 end
		else
		 begin
			exec EliminaUsuarioROl @IdUsuario, 2;
		 end

		if(@EsSupervisor = 'true')
		 begin
			Declare @Supervisor  int
			Select @Supervisor = IdUsuarioRol from UsuarioRol where IdUsuario = @IdUsuario and IdRol = 3;
			if(@Supervisor is null)
			 begin
				exec AgregaUsuarioRol @IdUsuario, 3;
			 end
		 end
		else
		 begin
			exec EliminaUsuarioROl @IdUsuario, 3;
		 end

		if(@EsCliente = 'true')
		 begin
			Declare @Cliente  int
			Select @Cliente = IdUsuarioRol from UsuarioRol where IdUsuario = @IdUsuario and IdRol = 4;
			if(@Cliente is null)
			 begin
				exec AgregaUsuarioRol @IdUsuario, 4;
			 end
		 end
		else
		 begin
			exec EliminaUsuarioROl @IdUsuario, 4;
		 end
	END TRY

	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000);  
		DECLARE @ErrorSeverity INT;  
		DECLARE @ErrorState INT;  
  
		SELECT   
			@ErrorMessage = ERROR_MESSAGE(),  
			@ErrorSeverity = ERROR_SEVERITY(),  
			@ErrorState = ERROR_STATE();  
  
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState);  
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[ActualizaUsuarioRol]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizaUsuarioRol]
@IdUsuarioRol int,
@IdUsuario int,
@IdRol int

AS
BEGIN
	update UsuarioRol
	set IdUsuario = @IdUsuario,
	IdRol = @IdRol
	where IdUsuarioRol = @IdUsuarioRol
END
GO
/****** Object:  StoredProcedure [dbo].[AgregaRol]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregaRol]
@Descripcion varchar(50),
@Estado bit

AS
BEGIN
Declare @Consecutivo  int

Select @Consecutivo = isnull(max(IdRol),0)+1 from Rol

		Insert into  Rol (IdRol,Descripcion,Estado)
			values(@Consecutivo,@Descripcion,@Estado)
END
GO
/****** Object:  StoredProcedure [dbo].[AgregaTipoIdentificacion]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregaTipoIdentificacion]
@Descripcion varchar(50),
@Estado bit

AS
BEGIN
Declare @Consecutivo  int

Select @Consecutivo = isnull(max(IdTipoIdentificacion),0)+1 from TipoIdentificacion

		Insert into  TipoIdentificacion (IdTipoIdentificacion,Descripcion,Estado)
			values(@Consecutivo,@Descripcion,@Estado)
END
GO
/****** Object:  StoredProcedure [dbo].[AgregaUsuarioRol]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregaUsuarioRol]
@IdUsuario int,
@IdRol int

AS
BEGIN
Declare @Consecutivo  int

Select @Consecutivo = isnull(max(IdUsuarioRol),0)+1 from UsuarioRol

		Insert into  UsuarioRol (IdUsuarioRol,IdUsuario,IdRol)
			values(@Consecutivo,@IdUsuario,@IdRol)
END
GO
/****** Object:  StoredProcedure [dbo].[Cantones]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Cantones]
@Provincia char(1)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Canton where Provincia=@Provincia order by Provincia,Canton
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultaBitacora]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultaBitacora]

AS
BEGIN
	select * from Bitacora order by Fecha DESC
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultaCorreoUsuario]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultaCorreoUsuario]
@Correo varchar(50)
AS
BEGIN
	select U.*, TI.Descripcion as NombreTipoId from Usuario U
	inner join TipoIdentificacion TI on(TI.IdTipoIdentificacion = U.IdTipoIdentificacion)
	where  U.Correo = @Correo
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultaDepositos]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultaDepositos]
@IdUsuario as int
AS
BEGIN
	select * from Deposito where IdUsuario = @IdUsuario order by Fecha DESC
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultaEmpresa]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultaEmpresa]
@IdEmpresa as int
AS
BEGIN

	SELECT E.*, TI.Descripcion as DescTipoIdentificacion from Empresa E
	inner join TipoIdentificacion TI on(TI.IdTipoIdentificacion = E.IdTipoIdentificacion)
	where E.IdEmpresa = @IdEmpresa
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultaEmpresas]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultaEmpresas]
AS
BEGIN
	SELECT E.*, TI.Descripcion as DescTipoIdentificacion from Empresa E
	inner join TipoIdentificacion TI on(TI.IdTipoIdentificacion = E.IdTipoIdentificacion)
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultaIdentificacionEmpresa]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultaIdentificacionEmpresa]
@Identificacion varchar(30)
AS
BEGIN
	select * from Empresa where Identificacion = @Identificacion
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultaIdentificacionUsuario]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultaIdentificacionUsuario] 
@Identificacion varchar(30)
AS
BEGIN
	select U.*, TI.Descripcion as NombreTipoId from Usuario U
	inner join TipoIdentificacion TI on(TI.IdTipoIdentificacion = U.IdTipoIdentificacion)
	where  U.Identificacion = @Identificacion
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultaLinea]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultaLinea]
@IdLinea as int
AS
BEGIN
	SELECT L.*, E.Descripcion as NombreEmpresa, T.IdTarifa as IdTarifa, T.Descripcion as NombreTarifa, T.Monto as Monto ,P.Nombre as NombreProvincia, C.Nombre as NombreCanton, D.Nombre as NombreDistrito from Linea L
	inner join Empresa E on(E.IdEmpresa = L.IdEmpresa)
	inner join LineaTarifa LT on(LT.IdLinea = L.IdLinea)
	inner join Tarifa T on(T.IdTarifa = LT.IdTarifa)
	inner join Provincia P on(P.Provincia=L.Provincia)
	inner join Canton C on(C.Provincia = L.Provincia and C.Canton = L.Canton)
	inner join Distrito D on(D.Provincia = L.Provincia and D.Canton = L.Canton and D.Distrito = L.Distrito) 
	where L.IdLinea = @IdLinea
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultaLineas]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultaLineas]
@IdEmpresa as int
AS
BEGIN
	SELECT L.*, E.Descripcion as NombreEmpresa, T.IdTarifa as IdTarifa, T.Descripcion as NombreTarifa, T.Monto as Monto ,P.Nombre as NombreProvincia, C.Nombre as NombreCanton, D.Nombre as NombreDistrito from Linea L
	inner join Empresa E on(E.IdEmpresa = L.IdEmpresa)
	inner join LineaTarifa LT on(LT.IdLinea = L.IdLinea)
	inner join Tarifa T on(T.IdTarifa = LT.IdTarifa)
	inner join Provincia P on(P.Provincia = L.Provincia)
	inner join Canton C on(C.Provincia = L.Provincia and C.Canton = L.Canton)
	inner join Distrito D on(D.Provincia = L.Provincia and D.Canton = L.Canton and D.Distrito = L.Distrito)
	where L.IdEmpresa = @IdEmpresa
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultaPagosEmpresa]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultaPagosEmpresa]
@IdEmpresa as int
AS
BEGIN
	
	SELECT P.*, E.Descripcion as NombreEmpresa, UN.Descripcion as NombreUnidad, US.Identificacion as Identificacion from Pago P
	inner join Empresa E on(E.IdEmpresa = P.IdEmpresa)
	inner join Unidad UN on(UN.IdUnidad = P.IdUnidad)
	inner join Usuario US on(US.IdUsuario = P.IdUsuario)
	where P.IdEmpresa = @IdEmpresa

END
GO
/****** Object:  StoredProcedure [dbo].[ConsultaPagosUsuario]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ConsultaPagosUsuario]
@IdUsuario as int
AS
BEGIN
	
	SELECT P.*, E.Descripcion as NombreEmpresa, UN.Descripcion as NombreUnidad from Pago P
	inner join Empresa E on(E.IdEmpresa = P.IdEmpresa)
	inner join Unidad UN on(UN.IdUnidad = P.IdUnidad)
	where P.IdUsuario = @IdUsuario

END
GO
/****** Object:  StoredProcedure [dbo].[ConsultaRolesUsuario]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[ConsultaRolesUsuario] 
@IdUsuario int
AS
BEGIN
	select R.IdRol, R.Descripcion as Rol from UsuarioRol UR
	inner join Rol R on (R.IdRol = UR.IdRol)
	where UR.IdUsuario = @IdUsuario
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultaSaldo]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultaSaldo] 
@IdUsuario int
AS
BEGIN
	select Saldo from Usuario where IdUsuario = @IdUsuario
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultaTarifa]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultaTarifa]
@IdTarifa as int
AS
BEGIN
	SELECT * from Tarifa where IdTarifa = @IdTarifa
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultaTarifas]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultaTarifas]

AS
BEGIN
	SELECT * from Tarifa
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultaTipoPlaca]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultaTipoPlaca]
@IdTipoPlaca as int
AS
BEGIN
	SELECT * from TipoPlaca where IdTipoPlaca = @IdTipoPlaca
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultaTiposIdentificacion]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[ConsultaTiposIdentificacion]

AS
BEGIN
	SELECT * from TipoIdentificacion
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultaTiposPlaca]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultaTiposPlaca]

AS
BEGIN
	SELECT * from TipoPlaca
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultaUnidad]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultaUnidad]
@IdUnidad as int
AS
BEGIN
	SELECT U.*,L.IdEmpresa as IdEmpresa, LU.IdLinea as IdLinea, TP.Descripcion as NombreTipoPlaca from Unidad U
	inner join LineaUnidad LU on(LU.IdUnidad = U.IdUnidad)
	inner join Linea L on(L.IdLinea = LU.IdLinea)
	inner join TipoPlaca TP on(TP.IdTipoPlaca = U.IdTipoPlaca)
	where U.IdUnidad = @IdUnidad
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultaUnidades]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultaUnidades]
--@IdEmpresa as int
@IdLinea as int
AS
BEGIN
	
	SELECT U.*, L.IdEmpresa as IdEmpresa, LU.IdLinea as IdLinea ,TP.Descripcion as NombreTipoPlaca from Unidad U
	--inner join Linea L on(L.IdEmpresa = @IdEmpresa)
	--inner join Linea L on(L.IdLinea = @IdLinea)
	inner join LineaUnidad LU on(LU.IdLinea = @IdLinea and LU.IdUnidad = U.IdUnidad)
	inner join Linea L on(L.IdLinea = LU.IdLinea)
	--inner join LineaUnidad LU on(LU.IdLinea = L.IdLinea and LU.IdUnidad = U.IdUnidad)
	inner join TipoPlaca TP on(TP.IdTipoPlaca = U.IdTipoPlaca)
	--inner join LineaUnidad LU on(LU.IdLinea = L.IdLinea)
	--inner join LineaUnidad LU on(LU.IdUnidad = U.IdUnidad and LU.IdLinea = @IdLinea)
	--where LU.IdLinea = @IdLinea

END
GO
/****** Object:  StoredProcedure [dbo].[ConsultaUsuario]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultaUsuario]
@IdUsuario int
AS
BEGIN
	select U.*, TI.Descripcion as NombreTipoId from Usuario U
	inner join TipoIdentificacion TI on(TI.IdTipoIdentificacion = U.IdTipoIdentificacion)
	where U.IdUsuario = @IdUsuario
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultaUsuarios]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultaUsuarios] 

AS
BEGIN
	select U.*, TI.Descripcion as NombreTipoId from Usuario U
	inner join TipoIdentificacion TI on(TI.IdTipoIdentificacion = U.IdTipoIdentificacion)
END
GO
/****** Object:  StoredProcedure [dbo].[CreaDeposito]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreaDeposito]
@IdUsuario as int,
@Monto as money,
@Fecha as datetime,
@Telefono varchar(20),
@Estado as char(2)

AS
BEGIN

Declare @Consecutivo as int

Select @Consecutivo=isnull(Max(IdDeposito),0)+1 from Deposito

	
	BEGIN TRY
		
		update Usuario 
		set Saldo = Saldo + @Monto
		where IdUsuario = @IdUsuario
		
		Insert into Deposito (IdDeposito,IdUsuario,Monto,Fecha,Telefono,Estado)	
		values(@Consecutivo,@IdUsuario,@Monto,@Fecha,@Telefono,@Estado)

	END TRY

	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000);  
		DECLARE @ErrorSeverity INT;  
		DECLARE @ErrorState INT;  
  
		SELECT   
			@ErrorMessage = ERROR_MESSAGE(),  
			@ErrorSeverity = ERROR_SEVERITY(),  
			@ErrorState = ERROR_STATE();  
  
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState);  
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[CreaEmpresa]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreaEmpresa]
@Descripcion as varchar(50),
@IdTipoIdentificacion as int,
@Identificacion as varchar(30),
@Telefono as varchar(20),
@Contacto as varchar(50),
@Estado as  bit
AS
BEGIN
Declare @Consecutivo as int

Select @Consecutivo=isnull(Max(IdEmpresa),0)+1 from Empresa

	Insert into Empresa (IdEmpresa,Descripcion,IdTipoIdentificacion,Identificacion,Telefono,Contacto,Estado)	
		values(@Consecutivo,@Descripcion,@IdTipoIdentificacion,@Identificacion,@Telefono,@Contacto,@Estado)
END
GO
/****** Object:  StoredProcedure [dbo].[CreaLinea]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreaLinea]
@IdEmpresa as int,
@Descripcion as varchar(50),
@CodigoCTP as varchar(50),
@IdTarifa as int,
@Provincia as char(1),
@Canton as char(2),
@Distrito as char(2),
@Estado as  bit

AS
BEGIN

Declare @Consecutivo as int

Select @Consecutivo=isnull(Max(IdLinea),0)+1 from Linea

	BEGIN TRY
		Insert into Linea (IdEmpresa,IdLinea,Descripcion,CodigoCTP,Provincia,Canton,Distrito,Estado)	
		values(@IdEmpresa,@Consecutivo,@Descripcion,@CodigoCTP,@Provincia,@Canton,@Distrito,@Estado)

	exec CreaLineaTarifa @Consecutivo, @IdTarifa;
	END TRY

	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000);  
		DECLARE @ErrorSeverity INT;  
		DECLARE @ErrorState INT;  
  
		SELECT   
			@ErrorMessage = ERROR_MESSAGE(),  
			@ErrorSeverity = ERROR_SEVERITY(),  
			@ErrorState = ERROR_STATE();  
  
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState);  
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[CreaLineaTarifa]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreaLineaTarifa]
@IdLinea as int,
@IdTarifa as int

AS
BEGIN

Declare @Consecutivo as int

Select @Consecutivo=isnull(Max(IdLineatarifa),0)+1 from LineaTarifa

	Insert into LineaTarifa (IdLineaTarifa,IdLinea,IdTarifa)	
		values(@Consecutivo,@IdLinea,@IdTarifa)
END
GO
/****** Object:  StoredProcedure [dbo].[CreaLineaUnidad]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreaLineaUnidad]
@IdLinea as int,
@IdUnidad as int

AS
BEGIN

Declare @Consecutivo as int

Select @Consecutivo=isnull(Max(IdLineaUnidad),0)+1 from LineaUnidad

	Insert into LineaUnidad (IdLineaUnidad,IdLinea,IdUnidad)	
		values(@Consecutivo,@IdLinea,@IdUnidad)
END
GO
/****** Object:  StoredProcedure [dbo].[CreaPago]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreaPago]
@IdEmpresa as int,
@IdUnidad as int,
@IdUsuario as int,
@Monto as money,
@Fecha as datetime,
@Latitud as decimal(18,6),
@Longitud as decimal(18,6),
@Estado as char(2)

AS
BEGIN

Declare @Consecutivo as int

Select @Consecutivo=isnull(Max(IdPago),0)+1 from Pago

	Insert into Pago (IdPago,IdEmpresa,IdUnidad,IdUsuario,Monto,Fecha,Latitud,Longitud,Estado)	
		values(@Consecutivo,@IdEmpresa,@IdUnidad,@IdUsuario,@Monto,@Fecha,@Latitud,@Longitud,@Estado)

	update Usuario set Saldo = Saldo - @Monto
	where IdUsuario = @IdUsuario

END
GO
/****** Object:  StoredProcedure [dbo].[CreaTarifa]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreaTarifa]
@Descripcion as varchar(50),
@Monto as money,
@Estado as bit

AS
BEGIN

Declare @Consecutivo as int

Select @Consecutivo=isnull(Max(IdTarifa),0)+1 from Tarifa

	Insert into Tarifa (IdTarifa,Descripcion,Monto,Estado)	
		values(@Consecutivo,@Descripcion,@Monto,@Estado)
END
GO
/****** Object:  StoredProcedure [dbo].[CreaTipoPlaca]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreaTipoPlaca]
@Descripcion as varchar(50),
@Estado as bit

AS
BEGIN

Declare @Consecutivo as int

Select @Consecutivo=isnull(Max(IdTipoPlaca),0)+1 from TipoPlaca

	Insert into TipoPlaca (IdTipoPlaca,Descripcion,Estado)	
		values(@Consecutivo,@Descripcion,@Estado)
END
GO
/****** Object:  StoredProcedure [dbo].[CreaUnidad]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreaUnidad]
@Descripcion as varchar(50),
@IdTipoPlaca as int,
@Placa as varchar(50),
@IdLinea as int,
@Estado as bit

AS
BEGIN

Declare @Consecutivo as int

Select @Consecutivo=isnull(Max(IdUnidad),0)+1 from Unidad

	BEGIN TRY
		Insert into Unidad (IdUnidad,Descripcion,IdTipoPlaca,Placa,Estado)	
		values(@Consecutivo,@Descripcion,@IdTipoPlaca,@Placa,@Estado)

		exec CreaLineaUnidad @IdLinea, @Consecutivo;
	END TRY

	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000);  
		DECLARE @ErrorSeverity INT;  
		DECLARE @ErrorState INT;  
  
		SELECT   
			@ErrorMessage = ERROR_MESSAGE(),  
			@ErrorSeverity = ERROR_SEVERITY(),  
			@ErrorState = ERROR_STATE();  
  
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState);  
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[CreaUsuario]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreaUsuario]
@Nombre varchar(50),
@Nombre2 varchar(50),
@Apellido1 varchar(50),
@Apellido2 varchar(50),
@IdTipoIdentificacion int,
@Identificacion varchar(30),
@Telefono varchar(20),
@Correo varchar(50),
@Clave varchar(50),
@EsAdmin as bit,
@EsGerente as bit,
@EsSupervisor as bit,
@EsCliente as bit
AS
BEGIN
	Declare @Consecutivo as int
	Select @Consecutivo=isnull(Max(IdUsuario),0)+1 from Usuario

	Insert into Usuario (IdUsuario,Nombre,Nombre2,Apellido1,Apellido2,IdTipoIdentificacion,Identificacion,Saldo,Telefono,Correo,Clave)	
		values(@Consecutivo,@Nombre,@Nombre2,@Apellido1,@Apellido2,@IdTipoIdentificacion,@Identificacion,0,@Telefono,@Correo,@Clave)

	if(@EsAdmin = 'true')
        begin
		exec AgregaUsuarioRol @Consecutivo, 1;
        end
	if(@EsGerente = 'true')
        begin
            exec AgregaUsuarioRol @Consecutivo, 2;
        end
	if(@EsSupervisor = 'true')
        begin
            exec AgregaUsuarioRol @Consecutivo, 3;
        end
	if(@EsCliente = 'true')
        begin
            exec AgregaUsuarioRol @Consecutivo, 4;
        end
END
GO
/****** Object:  StoredProcedure [dbo].[Distritos]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Distritos]
@Provincia char(1),
@Canton char(2)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Distrito where Provincia=@Provincia and Canton=@Canton
	order by Provincia,Canton,Distrito
END
GO
/****** Object:  StoredProcedure [dbo].[EliminaEmpresa]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminaEmpresa]
@IdEmpresa as int
AS
BEGIN
	Delete Empresa where IdEmpresa = @IdEmpresa
END
GO
/****** Object:  StoredProcedure [dbo].[EliminaLinea]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminaLinea]
@IdLinea as int
AS
BEGIN

	BEGIN TRY
		Delete Linea where IdLinea = @IdLinea
		exec EliminaLineaTarifa @IdLinea;
		exec EliminaLineaUnidad @IdLinea;
	END TRY

	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000);  
		DECLARE @ErrorSeverity INT;  
		DECLARE @ErrorState INT;  
  
		SELECT   
			@ErrorMessage = ERROR_MESSAGE(),  
			@ErrorSeverity = ERROR_SEVERITY(),  
			@ErrorState = ERROR_STATE();  
  
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState);  
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[EliminaLineaTarifa]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminaLineaTarifa]
@IdLinea as int
AS
BEGIN
	Delete LineaTarifa where IdLinea = @IdLinea
END
GO
/****** Object:  StoredProcedure [dbo].[EliminaLineaUnidad]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminaLineaUnidad]
@IdUnidad as int
AS
BEGIN
	Delete LineaUnidad where IdUnidad = @IdUnidad
END
GO
/****** Object:  StoredProcedure [dbo].[EliminaRol]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminaRol]
@IdRol as int
AS
BEGIN
	Delete Rol where IdRol = @IdRol
END
GO
/****** Object:  StoredProcedure [dbo].[EliminaTarifa]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminaTarifa]
@IdTarifa as int
AS
BEGIN
	Delete Tarifa where IdTarifa = @IdTarifa
END
GO
/****** Object:  StoredProcedure [dbo].[EliminaTipoPlaca]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EliminaTipoPlaca]
@IdTipoPlaca as int
AS
BEGIN
	Delete TipoPlaca where IdTipoPlaca = @IdTipoPlaca
END
GO
/****** Object:  StoredProcedure [dbo].[EliminaUnidad]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminaUnidad]
@IdUnidad as int
AS
BEGIN
	
	BEGIN TRY
		Delete Unidad where IdUnidad = @IdUnidad

		exec EliminaLineaUnidad @IdUnidad;
	END TRY

	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000);  
		DECLARE @ErrorSeverity INT;  
		DECLARE @ErrorState INT;  
  
		SELECT   
			@ErrorMessage = ERROR_MESSAGE(),  
			@ErrorSeverity = ERROR_SEVERITY(),  
			@ErrorState = ERROR_STATE();  
  
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState);  
	END CATCH
	
END
GO
/****** Object:  StoredProcedure [dbo].[EliminaUsuario]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminaUsuario]
@IdUsuario as int
AS
BEGIN
	
	BEGIN TRY
		Delete Usuario where IdUsuario = @IdUsuario
		exec EliminaUsuarioRolTotal @IdUsuario;
	END TRY

	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000);  
		DECLARE @ErrorSeverity INT;  
		DECLARE @ErrorState INT;  
  
		SELECT   
			@ErrorMessage = ERROR_MESSAGE(),  
			@ErrorSeverity = ERROR_SEVERITY(),  
			@ErrorState = ERROR_STATE();  
  
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState);  
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[EliminaUsuarioRol]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminaUsuarioRol]
@IdUsuario int,
@IdRol int
AS
BEGIN
	delete UsuarioRol where IdUsuario = @IdUsuario and IdRol = @IdRol
END
GO
/****** Object:  StoredProcedure [dbo].[EliminaUsuarioRolTotal]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[EliminaUsuarioRolTotal]
@IdUsuario int
AS
BEGIN
	delete UsuarioRol where IdUsuario = @IdUsuario
END
GO
/****** Object:  StoredProcedure [dbo].[Provincias]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Provincias]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Provincia order by Provincia
END
GO
/****** Object:  StoredProcedure [dbo].[RegistrarBitacora]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegistrarBitacora]
@Controlador as varchar(50),
@Accion as varchar(50),
@Error as varchar(max),
@Tipo as int,
@Fecha as datetime,
@IdUsuario as int
AS
BEGIN
Declare @Consecutivo as int

Select @Consecutivo=isnull(Max(IdBitacora),0)+1 from Bitacora

    INSERT INTO Bitacora(IdBitacora,Controlador,Accion,Error,Tipo,Fecha,IdUsuario)
    VALUES(@Consecutivo,@Controlador,@Accion,@Error,@Tipo,@Fecha,@IdUsuario)

END
GO
/****** Object:  StoredProcedure [dbo].[ValidaInicioSesion]    Script Date: 8/25/2020 12:58:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ValidaInicioSesion]
@Correo varchar(50),
@Clave varchar(50)
AS
BEGIN
	select U.*, TI.Descripcion as NombreTipoId from Usuario U
	inner join TipoIdentificacion TI on(TI.IdTipoIdentificacion = U.IdTipoIdentificacion)
	where U.Correo = @Correo and U.Clave = @Clave
END
GO

drop database funcionarios

create database funcionarios
GO
use funcionarios
go
/****** Object:  Table [dbo].[setores]    Script Date: 04/20/2012 20:37:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[setores](
	[setor_id] [int] NOT NULL,
	[setor_nome] [varchar](20) NULL,

PRIMARY KEY CLUSTERED 
(
	[setor_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[setores] ([setor_id], [setor_nome]) VALUES (1, N'Faturamento')
INSERT [dbo].[setores] ([setor_id], [setor_nome]) VALUES (2, N'Contabilidade')
INSERT [dbo].[setores] ([setor_id], [setor_nome]) VALUES (3, N'RH')
INSERT [dbo].[setores] ([setor_id], [setor_nome]) VALUES (4, N'Compras')
INSERT [dbo].[setores] ([setor_id], [setor_nome]) VALUES (5, N'Estoque')
INSERT [dbo].[setores] ([setor_id], [setor_nome]) VALUES (6, N'Farmácia')
INSERT [dbo].[setores] ([setor_id], [setor_nome]) VALUES (7, N'Recepção')
INSERT [dbo].[setores] ([setor_id], [setor_nome]) VALUES (8, N'Desenvolvimento')
INSERT [dbo].[setores] ([setor_id], [setor_nome]) VALUES (9, N'Engenharia')
INSERT [dbo].[setores] ([setor_id], [setor_nome]) VALUES (10, N'CAD')
/****** Object:  Table [dbo].[funcionarios]    Script Date: 04/20/2012 20:37:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[funcionarios](
	[func_id] [int] NOT NULL,
	[func_nome] [varchar](30) NULL,
	[gerente_id] [int] NULL,
	[setor_id] [int] NULL,
	[func_salario] [numeric](18, 2) NULL,
	[func_dataNasc] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[func_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc]) VALUES (1, N'Maria', NULL, 1, CAST(5000.00 AS Numeric(18, 2)), CAST(0x00006ABD00000000 AS DateTime))
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc]) VALUES (2, N'Ana', NULL, 1, CAST(4780.00 AS Numeric(18, 2)), CAST(0x0000660500000000 AS DateTime))
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc]) VALUES (3, N'Carla', NULL, 1, CAST(7000.00 AS Numeric(18, 2)), CAST(0x00006AAE00000000 AS DateTime))
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc]) VALUES (4, N'Antonio', 1, 1, CAST(1000.00 AS Numeric(18, 2)), CAST(0x00007A2200000000 AS DateTime))
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc]) VALUES (5, N'Nestor', 1, 1, CAST(700.00 AS Numeric(18, 2)), CAST(0x0000471D00000000 AS DateTime))
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc]) VALUES (6, N'Eduardo', 1, 2, CAST(300.00 AS Numeric(18, 2)), CAST(0x000082AD00000000 AS DateTime))
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc]) VALUES (7, N'Anderson', 1, 2, CAST(500.00 AS Numeric(18, 2)), CAST(0x00006E9900000000 AS DateTime))
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc]) VALUES (8, N'Fábio', 1, 2, CAST(350.00 AS Numeric(18, 2)), CAST(0x00007F7800000000 AS DateTime))
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc]) VALUES (9, N'João', 1, 2, CAST(980.00 AS Numeric(18, 2)), CAST(0x000073B200000000 AS DateTime))
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc]) VALUES (10, N'José', 2, 2, CAST(321.00 AS Numeric(18, 2)), CAST(0x0000739100000000 AS DateTime))
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc]) VALUES (11, N'Ingrid', 2, 3, CAST(422.00 AS Numeric(18, 2)), CAST(0x0000751E00000000 AS DateTime))
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc]) VALUES (12, N'Bruno', 2, 3, CAST(890.00 AS Numeric(18, 2)), CAST(0x00005A7200000000 AS DateTime))
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc]) VALUES (13, N'Bruna', 2, 3, CAST(1021.00 AS Numeric(18, 2)), CAST(0x00006F2C00000000 AS DateTime))
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc]) VALUES (14, N'Daniela', 2, 3, CAST(2050.00 AS Numeric(18, 2)), CAST(0x0000790900000000 AS DateTime))
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc]) VALUES (15, N'Daniel', 3, NULL, CAST(600.00 AS Numeric(18, 2)), CAST(0x0000792C00000000 AS DateTime))
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc]) VALUES (16, N'Valdir', 3, NULL, CAST(900.00 AS Numeric(18, 2)), CAST(0x0000789600000000 AS DateTime))
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc]) VALUES (17, N'Kleber', 3, NULL, CAST(800.63 AS Numeric(18, 2)), CAST(0x0000517300000000 AS DateTime))
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc]) VALUES (18, NULL, NULL, NULL, NULL, NULL)


USE [master]
GO
/****** Object:  Database [dbStock]    Script Date: 29/04/2019 9:25:22 AM ******/
CREATE DATABASE [dbStock]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbStock_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\dbStock.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'dbStock_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\dbStock.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [dbStock] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbStock].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbStock] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbStock] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbStock] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbStock] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbStock] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbStock] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbStock] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbStock] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbStock] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbStock] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbStock] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbStock] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbStock] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbStock] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbStock] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbStock] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbStock] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbStock] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbStock] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbStock] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbStock] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbStock] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbStock] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbStock] SET  MULTI_USER 
GO
ALTER DATABASE [dbStock] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbStock] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbStock] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbStock] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbStock] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbStock] SET QUERY_STORE = OFF
GO
USE [dbStock]
GO
/****** Object:  Table [dbo].[login]    Script Date: 29/04/2019 9:25:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 29/04/2019 9:25:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[companyname] [varchar](50) NULL,
	[productname] [varchar](50) NULL,
	[qty] [int] NULL,
	[price] [int] NULL,
	[total] [int] NULL,
	[sdate] [varchar](50) NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sale]    Script Date: 29/04/2019 9:25:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sale](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[companyname] [varchar](50) NULL,
	[productname] [varchar](50) NULL,
	[qty] [int] NULL,
	[price] [int] NULL,
	[total] [int] NULL,
	[sdate] [varchar](50) NULL,
 CONSTRAINT [PK_sale] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stock]    Script Date: 29/04/2019 9:25:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stock](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[productname] [varchar](50) NULL,
	[qty] [int] NULL,
 CONSTRAINT [PK_stock] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[login] ON 

INSERT [dbo].[login] ([id], [UserName], [Password]) VALUES (1, N'admin@admin.com', N'admin')
INSERT [dbo].[login] ([id], [UserName], [Password]) VALUES (2, N'stock@gmail.com', N'stock')
SET IDENTITY_INSERT [dbo].[login] OFF
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [companyname], [productname], [qty], [price], [total], [sdate]) VALUES (8, N'bjaj', N'bulb', 1, 10, 10, N'05/09/2019')
INSERT [dbo].[product] ([id], [companyname], [productname], [qty], [price], [total], [sdate]) VALUES (9, N'test', N'ok', 6, 9300, 55800, N'23/05/2016')
INSERT [dbo].[product] ([id], [companyname], [productname], [qty], [price], [total], [sdate]) VALUES (10, N'nst', N'sensex', 96, 3020, 289920, N'02/07/2010')
INSERT [dbo].[product] ([id], [companyname], [productname], [qty], [price], [total], [sdate]) VALUES (11, N'kk', N'dd', 2, 455, 910, N'12/02/2019')
INSERT [dbo].[product] ([id], [companyname], [productname], [qty], [price], [total], [sdate]) VALUES (12, N'anchor', N'fan', 10, 2000, 20000, N'11/11/2018')
INSERT [dbo].[product] ([id], [companyname], [productname], [qty], [price], [total], [sdate]) VALUES (1005, N'havels', N'fan', 200, 2000, 400000, N'07/01/2018')
INSERT [dbo].[product] ([id], [companyname], [productname], [qty], [price], [total], [sdate]) VALUES (1006, N'Wild stone', N'perfume and hair wax', 150, 40, 6000, N'20/03/2019')
INSERT [dbo].[product] ([id], [companyname], [productname], [qty], [price], [total], [sdate]) VALUES (1007, N'happy', N'burger', 2, 12, 24, N'11/11/2018')
INSERT [dbo].[product] ([id], [companyname], [productname], [qty], [price], [total], [sdate]) VALUES (1008, N'ok', N'ok', 2, 12, 24, N'02/02/2019')
INSERT [dbo].[product] ([id], [companyname], [productname], [qty], [price], [total], [sdate]) VALUES (1009, N'anchor', N'heater', 5, 200, 1000, N'2/4/2018')
SET IDENTITY_INSERT [dbo].[product] OFF
SET IDENTITY_INSERT [dbo].[sale] ON 

INSERT [dbo].[sale] ([id], [companyname], [productname], [qty], [price], [total], [sdate]) VALUES (2, N'Panasonic', N'battery', 10, 1000, 10000, N'1/1/2011')
INSERT [dbo].[sale] ([id], [companyname], [productname], [qty], [price], [total], [sdate]) VALUES (4, N'Haldiram', N'mixture and sev', 2000, 40000, 80000000, N'10/3/2019')
INSERT [dbo].[sale] ([id], [companyname], [productname], [qty], [price], [total], [sdate]) VALUES (5, N'Samsung', N'TV and mobile', 100, 50000, 5000000, N'15/03/2019')
INSERT [dbo].[sale] ([id], [companyname], [productname], [qty], [price], [total], [sdate]) VALUES (6, N'Dell', N'Laptop', 50, 750000, 37500000, N'23/02/2019')
SET IDENTITY_INSERT [dbo].[sale] OFF
SET IDENTITY_INSERT [dbo].[stock] ON 

INSERT [dbo].[stock] ([id], [productname], [qty]) VALUES (1, N'phone', 1)
INSERT [dbo].[stock] ([id], [productname], [qty]) VALUES (2, N'hyyu', 2)
INSERT [dbo].[stock] ([id], [productname], [qty]) VALUES (3, N'bulb', 2)
INSERT [dbo].[stock] ([id], [productname], [qty]) VALUES (4, N'ok', 6)
INSERT [dbo].[stock] ([id], [productname], [qty]) VALUES (5, N'sensex', 96)
INSERT [dbo].[stock] ([id], [productname], [qty]) VALUES (6, N'dd', 2)
INSERT [dbo].[stock] ([id], [productname], [qty]) VALUES (7, N'fan', 210)
INSERT [dbo].[stock] ([id], [productname], [qty]) VALUES (1002, N'perfume and hair wax', 150)
INSERT [dbo].[stock] ([id], [productname], [qty]) VALUES (1003, N'heater', 5)
SET IDENTITY_INSERT [dbo].[stock] OFF
USE [master]
GO
ALTER DATABASE [dbStock] SET  READ_WRITE 
GO
